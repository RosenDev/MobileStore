using MediatR;
using MobileStore.Api.Model;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class GetOrderByIdQueryHandler : IRequestHandler<GetOrderByIdQuery, ApiResponse<OrderModel>>
    {
        private readonly IOrdersService ordersService;

        public GetOrderByIdQueryHandler(
            IOrdersService ordersService)
        {
            this.ordersService = ordersService;
        }

        public async Task<ApiResponse<OrderModel>> Handle(GetOrderByIdQuery request, CancellationToken cancellationToken)
        {
            return new ApiResponse<OrderModel>(await ordersService.GetOrderAsync(request.Id, cancellationToken));
        }
    }
}