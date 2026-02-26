using MassTransit;
using MediatR;
using MobileStore.CommandsAndQueries.Customers;
using MobileStore.Email.Service.Model;
using MobileStore.Services.Interfaces;
using ApiOrderStatus = MobileStore.Api.Model.OrderStatus;

namespace MobileStore.CommandsAndQueries.Orders
{
    internal sealed class CreateOrderCommandHandler : IRequestHandler<CreateOrderCommand, int>
    {
        private readonly IOrdersService ordersService;
        private readonly IMediator mediator;
        private readonly IBus bus;

        public CreateOrderCommandHandler(IOrdersService ordersService, IMediator mediator, IBus bus)
        {
            this.ordersService = ordersService;
            this.mediator = mediator;
            this.bus = bus;
        }

        public async Task<int> Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            var orderId = await ordersService.CreateOrderAsync(request.CreateOrderModel, cancellationToken);
            var order = await ordersService.GetOrderAsync(orderId, cancellationToken);
            var customerInfo = await mediator.Send(new GetCustomerInfoByIdQuery { CustomerId = order.CustomerId }, cancellationToken);

            if(!string.IsNullOrWhiteSpace(customerInfo.Email))
            {
                await bus.Publish(new EmailModel
                {
                    To = customerInfo.Email,
                    Subject = $"Order {ApiOrderStatus.Created}",
                    Body = $"Hello, {customerInfo.FirstName} {customerInfo.LastName},\r\nYou sucessfully placed order with id {orderId}.\r\n\r\nTo view more information about your order, login to your account.\r\n\r\n\r\nKind regards,\r\n\r\nMobileStore Team"
                }, cancellationToken);
            }

            return orderId;
        }
    }
}
