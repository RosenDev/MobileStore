using MobileStore.Api.Model;
using MobileStore.Api.Model.ProductCategory;

namespace MobileStore.Services.Interfaces
{
    public interface IProductCategoriesService
    {
        Task<int> CreateProductCategoryAsync(CreateProductCategoryModel productCategoryModel, CancellationToken ct);
        Task<PagedResponse<ProductCategoryModel>> GetAllProductCategoriesAsync(int page, int size, CancellationToken ct);
        Task DeleteProductCategoryAsync(int id, CancellationToken ct);
        Task<ProductCategoryModel> UpdateProductCategoryAsync(UpdateProductCategoryModel productCategoryToUpdate, CancellationToken ct);
        Task<ProductCategoryModel> GetProductCategoryAsync(int id, CancellationToken ct);
    }
}
