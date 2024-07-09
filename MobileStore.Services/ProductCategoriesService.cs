using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Entities;
using MobileStore.Services.Interfaces;

namespace MobileStore.Services
{
    public class ProductCategoriesService : IProductCategoriesService
    {
        private readonly MobileStoreContext dbContext;
        private readonly IMapper mapper;

        public ProductCategoriesService(MobileStoreContext dbContext, IMapper mapper)
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
            var productCategory = await dbContext.ProductCategories.FindAsync(id, ct);

            dbContext.ProductCategories.Remove(productCategory!);

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
                await dbContext.ProductCategories.CountAsync(ct)
            );
        }

        public async Task<ProductCategoryModel> GetProductCategoryAsync(int id, CancellationToken ct)
        {
            return mapper.Map<ProductCategoryModel>(await dbContext.ProductCategories.FindAsync(id, ct));
        }

        public async Task<ProductCategoryModel> UpdateProductCategoryAsync(UpdateProductCategoryModel productCategoryToUpdate, CancellationToken ct)
        {
            var productCategoryEntity = (await dbContext.ProductCategories.FindAsync(productCategoryToUpdate.Id, ct))!;

            productCategoryEntity.Name = productCategoryToUpdate.Name;

            dbContext.ProductCategories.Update(productCategoryEntity);

            await dbContext.SaveChangesAsync(ct);

            return mapper.Map<ProductCategoryModel>(productCategoryEntity);
        }
    }
}
