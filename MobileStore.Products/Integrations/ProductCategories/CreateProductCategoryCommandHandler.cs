using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    internal sealed class CreateProductCategoryCommandHandler : IRequestHandler<CreateProductCategoryCommand, int>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public CreateProductCategoryCommandHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public Task<int> Handle(CreateProductCategoryCommand request, CancellationToken cancellationToken)
        {
            return productsCategoriesService.CreateProductCategoryAsync(request.CreateProductCategoryModel, cancellationToken);
        }
    }
}
