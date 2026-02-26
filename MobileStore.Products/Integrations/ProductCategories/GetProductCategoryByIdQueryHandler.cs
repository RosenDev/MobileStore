using MediatR;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    internal sealed class GetProductCategoryByIdQueryHandler : IRequestHandler<GetProductCategoryByIdQuery, ProductCategoryModel>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public GetProductCategoryByIdQueryHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public Task<ProductCategoryModel> Handle(GetProductCategoryByIdQuery request, CancellationToken cancellationToken)
        {
            return productsCategoriesService.GetProductCategoryAsync(request.Id, cancellationToken);
        }
    }
}
