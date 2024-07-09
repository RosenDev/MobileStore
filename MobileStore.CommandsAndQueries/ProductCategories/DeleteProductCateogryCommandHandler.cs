using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class DeleteProductCateogryCommandHandler : IRequestHandler<DeleteProductCategoryCommand>
    {
        private readonly IProductCategoriesService productsCateogriesService;

        public DeleteProductCateogryCommandHandler(IProductCategoriesService productsCateogriesService)
        {
            this.productsCateogriesService = productsCateogriesService;
        }

        public async Task Handle(DeleteProductCategoryCommand request, CancellationToken cancellationToken)
        {
            await productsCateogriesService.DeleteProductCategoryAsync(request.Id, cancellationToken);
        }
    }
}
