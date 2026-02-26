using MediatR;
using MobileStore.CommandsAndQueries.Products;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Payments
{
    internal sealed class GetPaymentTokenForOrderQueryHandler : IRequestHandler<GetPaymentTokenForOrderQuery, string>
    {
        private readonly IOrdersService ordersService;
        private readonly IPaymentsService paymentsService;
        private readonly IMediator mediator;

        public GetPaymentTokenForOrderQueryHandler(IOrdersService ordersService, IPaymentsService paymentsService, IMediator mediator)
        {
            this.ordersService = ordersService;
            this.paymentsService = paymentsService;
            this.mediator = mediator;
        }

        public async Task<string> Handle(GetPaymentTokenForOrderQuery request, CancellationToken cancellationToken)
        {
            var order = await ordersService.GetOrderAsync(request.OrderId, cancellationToken);

            var productIds = order.ProductsOrders.Select(x => x.ProductId).Distinct().ToList();
            var products = productIds.Count == 0
                ? new List<MobileStore.Api.Model.Product.ProductModel>()
                : await mediator.Send(new GetProductsByIdsQuery { Ids = productIds }, cancellationToken);

            var productsById = products.ToDictionary(x => x.Id, x => x);

            var amount = order.ProductsOrders
                .Sum(line => (productsById.TryGetValue(line.ProductId, out var product) ? product.Price : 0) * line.Quantity);

            var description = string.Join(Environment.NewLine,
                order.ProductsOrders.Select(x => productsById.TryGetValue(x.ProductId, out var product) ? product.Name : $"Product {x.ProductId}").Distinct());

            return await paymentsService.GeneratePaymentTokenAsync(description, amount);
        }
    }
}
