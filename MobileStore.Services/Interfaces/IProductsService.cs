using MobileStore.Api.Model;
using MobileStore.Api.Model.Product;

namespace MobileStore.Services.Interfaces
{
    public interface IProductsService
    {
        Task<int> CreateProductAsync(CreateProductModel productModel, CancellationToken ct);
        Task<PagedResponse<ProductModel>> GetAllProductsAsync(int page, int size, CancellationToken ct);
        Task DeleteProductAsync(int id, CancellationToken ct);
        Task<ProductModel> UpdateProductAsync(UpdateProductModel productToUpdate, CancellationToken ct);
        Task<ProductModel> GetProductAsync(int id, CancellationToken ct);

    }
}
