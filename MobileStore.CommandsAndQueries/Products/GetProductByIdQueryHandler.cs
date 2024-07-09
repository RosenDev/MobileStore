using MediatR;
using MobileStore.Api.Model.Product;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    public class GetProductByIdQueryHandler : IRequestHandler<GetProductByIdQuery, ProductModel>
    {
        private readonly IProductsService productsService;

        public GetProductByIdQueryHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task<ProductModel> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            return await productsService.GetProductAsync(request.Id, cancellationToken);
        }
    }
}
