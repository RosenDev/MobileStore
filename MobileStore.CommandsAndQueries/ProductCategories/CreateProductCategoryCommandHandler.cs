using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class CreateProductCategoryCommandHandler : IRequestHandler<CreateProductCategoryCommand, int>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public CreateProductCategoryCommandHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public async Task<int> Handle(CreateProductCategoryCommand request, CancellationToken cancellationToken)
        {
            return await productsCategoriesService.CreateProductCategoryAsync(request.CreateProductCategoryModel, cancellationToken);
        }
    }
}
