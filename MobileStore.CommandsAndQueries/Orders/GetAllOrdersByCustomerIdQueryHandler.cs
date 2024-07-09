using MediatR;
using MobileStore.Api.Model;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class GetAllOrdersByCustomerIdQueryHandler : IRequestHandler<GetAllOrdersByCustomerIdQuery, List<OrderModel>>
    {
        private readonly IOrdersService ordersService;

        public GetAllOrdersByCustomerIdQueryHandler(
            IOrdersService ordersService)
        {
            this.ordersService = ordersService;
        }

        public async Task<List<OrderModel>> Handle(GetAllOrdersByCustomerIdQuery request, CancellationToken cancellationToken)
        {
            return await ordersService.GetOrdersByCustomerIdAsync(request.CustomerId, cancellationToken);
        }
    }
}