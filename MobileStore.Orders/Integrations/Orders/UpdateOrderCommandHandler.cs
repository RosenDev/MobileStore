using MediatR;
using MobileStore.Api.Model;
using MobileStore.CommandsAndQueries.Customers;
using MobileStore.CommandsAndQueries.Products;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    internal sealed class UpdateOrderCommandHandler : IRequestHandler<UpdateOrderCommand, OrderModel>
    {
        private readonly IOrdersService ordersService;
        private readonly IMediator mediator;

        public UpdateOrderCommandHandler(IOrdersService ordersService, IMediator mediator)
        {
            this.ordersService = ordersService;
            this.mediator = mediator;
        }

        public async Task<OrderModel> Handle(UpdateOrderCommand request, CancellationToken cancellationToken)
        {
            var order = await ordersService.UpdateOrderAsync(request.UpdateOrderModel, cancellationToken);
            var customer = await mediator.Send(new GetCustomerInfoByIdQuery { CustomerId = order.CustomerId }, cancellationToken);

            var productIds = order.ProductsOrders.Select(x => x.ProductId).Distinct().ToList();
            var products = productIds.Count == 0
                ? new List<MobileStore.Api.Model.Product.ProductModel>()
                : await mediator.Send(new GetProductsByIdsQuery { Ids = productIds }, cancellationToken);

            var productsById = products.ToDictionary(x => x.Id, x => x);

            return OrderModelFactory.Create(order, customer, productsById);
        }
    }
}
