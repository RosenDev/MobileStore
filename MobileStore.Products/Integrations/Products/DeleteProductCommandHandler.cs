using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    internal sealed class DeleteProductCommandHandler : IRequestHandler<DeleteProductCommand>
    {
        private readonly IProductsService productsService;

        public DeleteProductCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task Handle(DeleteProductCommand request, CancellationToken cancellationToken)
        {
            await productsService.DeleteProductAsync(request.Id, cancellationToken);
        }
    }
}
