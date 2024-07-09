using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class DeleteOrderCommandHandler : IRequestHandler<DeleteOrderCommand>
    {
        private readonly IOrdersService ordersService;

        public DeleteOrderCommandHandler(IOrdersService ordersService)
        {
            this.ordersService = ordersService;
        }

        public async Task Handle(DeleteOrderCommand request, CancellationToken cancellationToken)
        {
            await ordersService.DeleteOrderAsync(request.Id, cancellationToken);
        }
    }
}
