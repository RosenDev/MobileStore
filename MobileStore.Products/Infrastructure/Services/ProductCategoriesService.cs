using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Products.Domain;
using MobileStore.Products.Infrastructure.Data;
using MobileStore.Services.Interfaces;

namespace MobileStore.Services
{
    internal sealed class ProductCategoriesService : IProductCategoriesService
    {
        private readonly ProductsDbContext dbContext;
        private readonly IMapper mapper;

        public ProductCategoriesService(ProductsDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task<int> CreateProductCategoryAsync(CreateProductCategoryModel productCategoryModel, CancellationToken ct)
        {
            var productCategoryEntity = new ProductCategory
            {
                Name = productCategoryModel.Name
            };

            dbContext.ProductCategories.Add(productCategoryEntity);
            await dbContext.SaveChangesAsync(ct);

            return productCategoryEntity.Id;
        }

        public async Task DeleteProductCategoryAsync(int id, CancellationToken ct)
        {
            var productCategory = await dbContext.ProductCategories.FirstAsync(x => x.Id == id, ct);

            dbContext.ProductCategories.Remove(productCategory);
            await dbContext.SaveChangesAsync(ct);
        }

        public async Task<PagedResponse<ProductCategoryModel>> GetAllProductCategoriesAsync(int page, int size, CancellationToken ct)
        {
            return new PagedResponse<ProductCategoryModel>(
                await dbContext.ProductCategories
                    .AsNoTracking()
                    .Skip(page - 1)
                    .Take(size)
                    .ProjectTo<ProductCategoryModel>(mapper.ConfigurationProvider)
                    .ToListAsync(ct),
                page,
                size,
                await dbContext.ProductCategories.CountAsync(ct));
        }

        public async Task<ProductCategoryModel> GetProductCategoryAsync(int id, CancellationToken ct)
        {
            return mapper.Map<ProductCategoryModel>(await dbContext.ProductCategories.FirstAsync(x => x.Id == id, ct));
        }

        public async Task<ProductCategoryModel> UpdateProductCategoryAsync(UpdateProductCategoryModel productCategoryToUpdate, CancellationToken ct)
        {
            var productCategoryEntity = await dbContext.ProductCategories.FirstAsync(x => x.Id == productCategoryToUpdate.Id, ct);

            productCategoryEntity.Name = productCategoryToUpdate.Name;

            dbContext.ProductCategories.Update(productCategoryEntity);
            await dbContext.SaveChangesAsync(ct);

            return mapper.Map<ProductCategoryModel>(productCategoryEntity);
        }
    }
}
