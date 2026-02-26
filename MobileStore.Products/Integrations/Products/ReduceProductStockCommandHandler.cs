using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    internal sealed class ReduceProductStockCommandHandler : IRequestHandler<ReduceProductStockCommand>
    {
        private readonly IProductsService productsService;

        public ReduceProductStockCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task Handle(ReduceProductStockCommand request, CancellationToken cancellationToken)
        {
            await productsService.ReduceProductStockAsync(request.Reductions, cancellationToken);
        }
    }
}
