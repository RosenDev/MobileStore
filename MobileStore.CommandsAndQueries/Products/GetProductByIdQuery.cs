using MediatR;
using MobileStore.Api.Model.Product;

namespace MobileStore.CommandsAndQueries.Products
{
    public class GetProductByIdQuery : IRequest<ProductModel>
    {
        public int Id { get; set; }
    }
}
