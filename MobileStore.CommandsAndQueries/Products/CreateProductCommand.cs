using MediatR;
using MobileStore.Api.Model.Product;

namespace MobileStore.CommandsAndQueries.Products
{
    public class CreateProductCommand : IRequest<int>
    {
        public CreateProductModel CreateProductModel { get; set; }
    }
}
