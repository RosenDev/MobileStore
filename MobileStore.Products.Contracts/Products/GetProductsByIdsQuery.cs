using MediatR;
using MobileStore.Api.Model.Product;

namespace MobileStore.CommandsAndQueries.Products
{
    public class GetProductsByIdsQuery : IRequest<List<ProductModel>>
    {
        public List<int> Ids { get; set; } = new List<int>();
    }
}
