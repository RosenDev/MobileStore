using MediatR;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class UpdateProductCategoryCommandHandler : IRequestHandler<UpdateProductCategoryCommand, ProductCategoryModel>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public UpdateProductCategoryCommandHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public async Task<ProductCategoryModel> Handle(UpdateProductCategoryCommand request, CancellationToken cancellationToken)
        {
            return await productsCategoriesService.UpdateProductCategoryAsync(request.UpdateProductCategoryModel, cancellationToken);
        }
    }
}
