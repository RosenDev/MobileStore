using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Product;

namespace MobileStore.CommandsAndQueries.Products
{
    public class GetAllProductsQuery : IRequest<PagedResponse<ProductModel>>
    {
        public Paging Paging { get; set; }
    }
}
