using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Payments
{
    public class GetPaymentTokenForOrderQueryHandler : IRequestHandler<GetPaymentTokenForOrderQuery, string>
    {
        private readonly IOrdersService ordersService;
        private readonly IPaymentsService paymentsService;

        public GetPaymentTokenForOrderQueryHandler(
            IOrdersService ordersService,
            IPaymentsService paymentsService
            )
        {
            this.ordersService = ordersService;
            this.paymentsService = paymentsService;
        }
        public async Task<string> Handle(GetPaymentTokenForOrderQuery request, CancellationToken cancellationToken)
        {
            var order = await ordersService.GetOrderAsync(request.OrderId, cancellationToken);

            return await paymentsService.GeneratePaymentTokenAsync(
                string.Join(Environment.NewLine, order.Products.Select(x => x.Name)),
                order.Price
                );
        }
    }
}
