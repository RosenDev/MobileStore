using MediatR;
using MobileStore.Api.Model;
using MobileStore.CommandsAndQueries.Customers;
using MobileStore.CommandsAndQueries.Products;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    internal sealed class GetAllOrdersByCustomerIdQueryHandler : IRequestHandler<GetAllOrdersByCustomerIdQuery, List<OrderModel>>
    {
        private readonly IOrdersService ordersService;
        private readonly IMediator mediator;

        public GetAllOrdersByCustomerIdQueryHandler(IOrdersService ordersService, IMediator mediator)
        {
            this.ordersService = ordersService;
            this.mediator = mediator;
        }

        public async Task<List<OrderModel>> Handle(GetAllOrdersByCustomerIdQuery request, CancellationToken cancellationToken)
        {
            var orders = await ordersService.GetOrdersByCustomerIdAsync(request.CustomerId, cancellationToken);
            var customer = await mediator.Send(new GetCustomerInfoByIdQuery { CustomerId = request.CustomerId }, cancellationToken);

            var allProductIds = orders
                .SelectMany(x => x.ProductsOrders)
                .Select(x => x.ProductId)
                .Distinct()
                .ToList();

            var products = allProductIds.Count == 0
                ? new List<MobileStore.Api.Model.Product.ProductModel>()
                : await mediator.Send(new GetProductsByIdsQuery { Ids = allProductIds }, cancellationToken);

            var productsById = products.ToDictionary(x => x.Id, x => x);

            return orders.Select(x => OrderModelFactory.Create(x, customer, productsById)).ToList();
        }
    }
}
