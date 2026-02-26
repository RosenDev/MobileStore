using MediatR;
using MobileStore.Api.Model.Product;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    internal sealed class GetProductsByIdsQueryHandler : IRequestHandler<GetProductsByIdsQuery, List<ProductModel>>
    {
        private readonly IProductsService productsService;

        public GetProductsByIdsQueryHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public Task<List<ProductModel>> Handle(GetProductsByIdsQuery request, CancellationToken cancellationToken)
        {
            return productsService.GetProductsByIdsAsync(request.Ids, cancellationToken);
        }
    }
}
