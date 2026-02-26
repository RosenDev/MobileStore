using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    internal sealed class DeleteProductCategoryCommandHandler : IRequestHandler<DeleteProductCategoryCommand>
    {
        private readonly IProductCategoriesService productsCategoriesService;

        public DeleteProductCategoryCommandHandler(IProductCategoriesService productsCategoriesService)
        {
            this.productsCategoriesService = productsCategoriesService;
        }

        public async Task Handle(DeleteProductCategoryCommand request, CancellationToken cancellationToken)
        {
            await productsCategoriesService.DeleteProductCategoryAsync(request.Id, cancellationToken);
        }
    }
}
