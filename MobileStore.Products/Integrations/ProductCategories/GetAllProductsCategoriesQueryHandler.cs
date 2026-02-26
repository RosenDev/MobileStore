using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    internal sealed class GetAllProductsCategoriesQueryHandler : IRequestHandler<GetAllProductsCategoriesQuery, PagedResponse<ProductCategoryModel>>
    {
        private readonly IProductCategoriesService productCategoriesService;

        public GetAllProductsCategoriesQueryHandler(IProductCategoriesService productCategoriesService)
        {
            this.productCategoriesService = productCategoriesService;
        }

        public Task<PagedResponse<ProductCategoryModel>> Handle(GetAllProductsCategoriesQuery request, CancellationToken cancellationToken)
        {
            return productCategoriesService.GetAllProductCategoriesAsync(request.Paging.Page, request.Paging.Size, cancellationToken);
        }
    }
}
