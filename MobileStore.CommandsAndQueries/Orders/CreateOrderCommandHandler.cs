using MassTransit;
using MediatR;
using Microsoft.EntityFrameworkCore;
using MobileStore.Email.Service.Model;
using MobileStore.Entities;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class CreateOrderCommandHandler : IRequestHandler<CreateOrderCommand, int>
    {
        private readonly IOrdersService ordersService;
        private readonly IBus bus;
        private readonly AuthDbContext authDbContext;

        public CreateOrderCommandHandler(
            IOrdersService ordersService,
            IBus bus,
            AuthDbContext authDbContext)
        {
            this.ordersService = ordersService;
            this.bus = bus;
            this.authDbContext = authDbContext;
        }

        public async Task<int> Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            var orderId = await ordersService.CreateOrderAsync(request.CreateOrderModel, cancellationToken);

            var customerInfo = await ordersService.GetCustomerInfoOrderIdAsync(orderId, cancellationToken);

            var user = await authDbContext.Users.FirstAsync(x => x.CustomerId == customerInfo.Id);

            await bus.Publish(new EmailModel
            {
                To = user.Email!,
                Subject = $"Order {OrderStatus.Created}",
                Body = $"Hello, {customerInfo.FirstName} {customerInfo.LastName},\r\nYou sucessfully placed order with id {orderId}.\r\n\r\nTo view more information about your order, login to your account.\r\n\r\n\r\nKind regards,\r\n\r\nMobileStore Team"
            }, cancellationToken);

            return orderId;
        }
    }

}