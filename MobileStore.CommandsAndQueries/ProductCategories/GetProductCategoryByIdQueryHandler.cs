using MediatR;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class GetProductCategoryByIdQueryHandler : IRequestHandler<GetProductCategoryByIdQuery, ProductCategoryModel>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public GetProductCategoryByIdQueryHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public async Task<ProductCategoryModel> Handle(GetProductCategoryByIdQuery request, CancellationToken cancellationToken)
        {
            return await productsCategoriesService.GetProductCategoryAsync(request.Id, cancellationToken);
        }
    }
}
