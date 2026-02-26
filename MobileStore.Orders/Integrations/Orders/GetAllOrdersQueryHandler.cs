using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.Api.Model.Product;
using MobileStore.CommandsAndQueries.Customers;
using MobileStore.CommandsAndQueries.Products;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    internal sealed class GetAllOrdersQueryHandler : IRequestHandler<GetAllOrdersQuery, PagedResponse<OrderModel>>
    {
        private readonly IOrdersService ordersService;
        private readonly IMediator mediator;

        public GetAllOrdersQueryHandler(IOrdersService ordersService, IMediator mediator)
        {
            this.ordersService = ordersService;
            this.mediator = mediator;
        }

        public async Task<PagedResponse<OrderModel>> Handle(GetAllOrdersQuery request, CancellationToken cancellationToken)
        {
            var orders = await ordersService.GetAllOrdersAsync(request.Paging.Page, request.Paging.Size, cancellationToken);
            var total = await ordersService.GetTotalOrdersAsync(cancellationToken);

            var allProductIds = orders
                .SelectMany(x => x.ProductsOrders)
                .Select(x => x.ProductId)
                .Distinct()
                .ToList();

            var products = allProductIds.Count == 0
                ? new List<ProductModel>()
                : await mediator.Send(new GetProductsByIdsQuery { Ids = allProductIds }, cancellationToken);

            var productsById = products.ToDictionary(x => x.Id, x => x);

            var customerCache = new Dictionary<int, CustomerInfoModel>();
            var result = new List<OrderModel>();

            foreach(var order in orders)
            {
                if(!customerCache.TryGetValue(order.CustomerId, out var customer))
                {
                    customer = await mediator.Send(new GetCustomerInfoByIdQuery { CustomerId = order.CustomerId }, cancellationToken);
                    customerCache[order.CustomerId] = customer;
                }

                result.Add(OrderModelFactory.Create(order, customer, productsById));
            }

            return new PagedResponse<OrderModel>(result, request.Paging.Page, request.Paging.Size, total);
        }
    }
}
