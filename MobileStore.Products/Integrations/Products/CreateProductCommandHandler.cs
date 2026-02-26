using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    internal sealed class CreateProductCommandHandler : IRequestHandler<CreateProductCommand, int>
    {
        private readonly IProductsService productsService;

        public CreateProductCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public Task<int> Handle(CreateProductCommand request, CancellationToken cancellationToken)
        {
            return productsService.CreateProductAsync(request.CreateProductModel, cancellationToken);
        }
    }
}
