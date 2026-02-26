using MediatR;
using MobileStore.Api.Model.Product;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    internal sealed class UpdateProductCommandHandler : IRequestHandler<UpdateProductCommand, ProductModel>
    {
        private readonly IProductsService productsService;

        public UpdateProductCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public Task<ProductModel> Handle(UpdateProductCommand request, CancellationToken cancellationToken)
        {
            return productsService.UpdateProductAsync(request.UpdateProductModel, cancellationToken);
        }
    }
}
