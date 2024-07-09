using MassTransit;
using MediatR;
using Microsoft.EntityFrameworkCore;
using MobileStore.Email.Service.Model;
using MobileStore.Entities;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class UpdateOrderStatusCommandHandler : IRequestHandler<UpdateOrderStatusCommand>
    {
        private readonly IOrdersService ordersService;
        private readonly IBus bus;
        private readonly AuthDbContext authDbContext;

        public UpdateOrderStatusCommandHandler(
            IOrdersService ordersService,
            IBus bus,
            AuthDbContext authDbContext
            )
        {
            this.ordersService = ordersService;
            this.bus = bus;
            this.authDbContext = authDbContext;
        }

        public async Task Handle(UpdateOrderStatusCommand request, CancellationToken cancellationToken)
        {
            await ordersService.UpdateOrderStatusAsync(request.Id, request.UpdateStatusModel, cancellationToken);

            var customerInfo = await ordersService.GetCustomerInfoOrderIdAsync(request.Id, cancellationToken);

            var user = await authDbContext.Users.FirstAsync(x => x.CustomerId == customerInfo.Id);

            await bus.Publish(new EmailModel
            {
                To = user.Email!,
                Subject = $"Order {request.UpdateStatusModel.Status}",
                Body = $"Hello, {customerInfo.FirstName} {customerInfo.LastName},\r\n\r\nWe are writing to inform you that your order has been {request.UpdateStatusModel.Status}.\r\n\r\n\r\nKind regards,\r\n\r\nMobileStore Team"
            }, cancellationToken);
        }
    }
}
