using MediatR;
using MobileStore.Api.Model;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class UpdateOrderCommandHandler : IRequestHandler<UpdateOrderCommand, OrderModel>
    {
        private readonly IOrdersService ordersService;

        public UpdateOrderCommandHandler(IOrdersService ordersService)
        {
            this.ordersService = ordersService;
        }
        public async Task<OrderModel> Handle(UpdateOrderCommand request, CancellationToken cancellationToken)
        {
            return await ordersService.UpdateOrderAsync(request.UpdateOrderModel, cancellationToken);
        }
    }
}
