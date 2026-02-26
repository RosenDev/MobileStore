using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Product;
using MobileStore.Products.Domain;
using MobileStore.Products.Infrastructure.Data;
using MobileStore.Services.Interfaces;

namespace MobileStore.Services
{
    internal sealed class ProductsService : IProductsService
    {
        private readonly ProductsDbContext dbContext;
        private readonly IMapper mapper;

        public ProductsService(ProductsDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task<int> CreateProductAsync(CreateProductModel productModel, CancellationToken ct)
        {
            var product = new Product
            {
                Name = productModel.Name,
                Price = productModel.Price,
                Description = productModel.Description,
                Quantity = productModel.Quantity,
                ProductCategories = productModel.CategoryIds.Select(id => new ProductsProductCategory
                {
                    ProductCategoryId = id,
                }).ToList()
            };

            dbContext.Products.Add(product);
            await dbContext.SaveChangesAsync(ct);

            return product.Id;
        }

        public async Task DeleteProductAsync(int id, CancellationToken ct)
        {
            var product = await dbContext.Products.FirstAsync(x => x.Id == id, ct);
            dbContext.Products.Remove(product);
            await dbContext.SaveChangesAsync(ct);
        }

        public async Task<PagedResponse<ProductModel>> GetAllProductsAsync(int page, int size, CancellationToken ct)
        {
            return new PagedResponse<ProductModel>(
                await dbContext.Products
                    .AsNoTracking()
                    .Include(x => x.ProductCategories)
                    .ThenInclude(x => x.ProductCategory)
                    .Skip(page - 1)
                    .Take(size)
                    .ProjectTo<ProductModel>(mapper.ConfigurationProvider)
                    .ToListAsync(ct),
                page,
                size,
                await dbContext.Products.CountAsync(ct));
        }

        public async Task<ProductModel> GetProductAsync(int id, CancellationToken ct)
        {
            return mapper.Map<ProductModel>(await dbContext.Products
                .AsNoTracking()
                .Include(x => x.ProductCategories)
                .ThenInclude(x => x.ProductCategory)
                .FirstAsync(x => x.Id == id, ct));
        }

        public async Task<List<ProductModel>> GetProductsByIdsAsync(IReadOnlyCollection<int> ids, CancellationToken ct)
        {
            return await dbContext.Products
                .AsNoTracking()
                .Include(x => x.ProductCategories)
                .ThenInclude(x => x.ProductCategory)
                .Where(x => ids.Contains(x.Id))
                .ProjectTo<ProductModel>(mapper.ConfigurationProvider)
                .ToListAsync(ct);
        }

        public async Task<ProductModel> UpdateProductAsync(UpdateProductModel productToUpdate, CancellationToken ct)
        {
            var product = await dbContext.Products
                .Include(x => x.ProductCategories)
                .FirstAsync(x => x.Id == productToUpdate.Id, ct);

            product.Quantity = productToUpdate.Quantity;
            product.Name = productToUpdate.Name;
            product.Price = productToUpdate.Price;
            product.Description = productToUpdate.Description;
            product.ProductCategories = productToUpdate.CategoryIds.Select(id => new ProductsProductCategory
            {
                ProductCategoryId = id
            }).ToList();

            dbContext.Products.Update(product);
            await dbContext.SaveChangesAsync(ct);

            return mapper.Map<ProductModel>(product);
        }

        public async Task ReduceProductStockAsync(IReadOnlyCollection<ProductStockReductionModel> reductions, CancellationToken ct)
        {
            if(reductions.Count == 0)
            {
                return;
            }

            var productIds = reductions.Select(x => x.ProductId).Distinct().ToList();
            var products = await dbContext.Products.Where(x => productIds.Contains(x.Id)).ToListAsync(ct);

            foreach(var product in products)
            {
                var quantityToReduce = reductions
                    .Where(x => x.ProductId == product.Id)
                    .Sum(x => x.QuantityToReduce);

                product.Quantity -= quantityToReduce;
            }

            dbContext.Products.UpdateRange(products);
            await dbContext.SaveChangesAsync(ct);
        }
    }
}
