using MediatR;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    internal sealed class UpdateProductCategoryCommandHandler : IRequestHandler<UpdateProductCategoryCommand, ProductCategoryModel>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public UpdateProductCategoryCommandHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public Task<ProductCategoryModel> Handle(UpdateProductCategoryCommand request, CancellationToken cancellationToken)
        {
            return productsCategoriesService.UpdateProductCategoryAsync(request.UpdateProductCategoryModel, cancellationToken);
        }
    }
}
