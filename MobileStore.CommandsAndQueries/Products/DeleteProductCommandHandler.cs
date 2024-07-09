using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    public class DeleteProductCateogryCommandHandler : IRequestHandler<DeleteProductCommand>
    {
        private readonly IProductsService productsService;

        public DeleteProductCateogryCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task Handle(DeleteProductCommand request, CancellationToken cancellationToken)
        {
            await productsService.DeleteProductAsync(request.Id, cancellationToken);
        }
    }
}
