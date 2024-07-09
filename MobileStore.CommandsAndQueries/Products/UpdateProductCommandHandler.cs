using MediatR;
using MobileStore.Api.Model.Product;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Products
{
    public class UpdateProductCommandHandler : IRequestHandler<UpdateProductCommand, ProductModel>
    {
        private readonly IProductsService productsService;

        public UpdateProductCommandHandler(IProductsService productsService)
        {
            this.productsService = productsService;
        }

        public async Task<ProductModel> Handle(UpdateProductCommand request, CancellationToken cancellationToken)
        {
            return await productsService.UpdateProductAsync(request.UpdateProductModel, cancellationToken);
        }
    }
}
