using MediatR;
using MobileStore.Api.Model.Product;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    internal sealed class GetProductByIdQueryHandler : IRequestHandler<GetProductByIdQuery, ProductModel>
    {
        private readonly IProductsService productsService;

        public GetProductByIdQueryHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public Task<ProductModel> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            return productsService.GetProductAsync(request.Id, cancellationToken);
        }
    }
}
