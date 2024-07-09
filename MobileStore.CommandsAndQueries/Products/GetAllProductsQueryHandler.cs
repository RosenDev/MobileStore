using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Product;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    public class GetAllProductsQueryHandler : IRequestHandler<GetAllProductsQuery, PagedResponse<ProductModel>>
    {
        private readonly IProductsService productsService;

        public GetAllProductsQueryHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task<PagedResponse<ProductModel>> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {
            return await productsService.GetAllProductsAsync(request.Paging.Page, request.Paging.Size, cancellationToken);
        }
    }
}
