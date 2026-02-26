using MediatR;
using MobileStore.Api.Model.Product;

namespace MobileStore.CommandsAndQueries.Products
{
    public class UpdateProductCommand : IRequest<ProductModel>
    {
        public UpdateProductModel UpdateProductModel { get; set; }
    }
}
