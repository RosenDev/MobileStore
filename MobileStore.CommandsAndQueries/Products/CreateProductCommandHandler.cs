using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    public class CreateProductCategoryCommandHandler : IRequestHandler<CreateProductCommand, int>
    {
        private readonly IProductsService productsService;

        public CreateProductCategoryCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task<int> Handle(CreateProductCommand request, CancellationToken cancellationToken)
        {
            return await productsService.CreateProductAsync(request.CreateProductModel, cancellationToken);
        }
    }
}
