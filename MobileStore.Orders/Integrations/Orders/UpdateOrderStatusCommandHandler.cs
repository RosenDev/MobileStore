using MassTransit;
using MediatR;
using MobileStore.CommandsAndQueries.Customers;
using MobileStore.CommandsAndQueries.Products;
using MobileStore.Email.Service.Model;
using MobileStore.Services.Interfaces;
using ApiOrderStatus = MobileStore.Api.Model.OrderStatus;

namespace MobileStore.CommandsAndQueries.Orders
{
    internal sealed class UpdateOrderStatusCommandHandler : IRequestHandler<UpdateOrderStatusCommand>
    {
        private readonly IOrdersService ordersService;
        private readonly IMediator mediator;
        private readonly IBus bus;

        public UpdateOrderStatusCommandHandler(IOrdersService ordersService, IMediator mediator, IBus bus)
        {
            this.ordersService = ordersService;
            this.mediator = mediator;
            this.bus = bus;
        }

        public async Task Handle(UpdateOrderStatusCommand request, CancellationToken cancellationToken)
        {
            var order = await ordersService.UpdateOrderStatusAsync(request.Id, request.UpdateStatusModel, cancellationToken);

            if(request.UpdateStatusModel.Status == ApiOrderStatus.Paid)
            {
                await mediator.Send(new ReduceProductStockCommand
                {
                    Reductions = order.ProductsOrders
                        .Select(x => new MobileStore.Api.Model.Product.ProductStockReductionModel
                        {
                            ProductId = x.ProductId,
                            QuantityToReduce = x.Quantity
                        })
                        .ToList()
                }, cancellationToken);
            }

            var customerInfo = await mediator.Send(new GetCustomerInfoByIdQuery { CustomerId = order.CustomerId }, cancellationToken);

            if(!string.IsNullOrWhiteSpace(customerInfo.Email))
            {
                await bus.Publish(new EmailModel
                {
                    To = customerInfo.Email,
                    Subject = $"Order {request.UpdateStatusModel.Status}",
                    Body = $"Hello, {customerInfo.FirstName} {customerInfo.LastName},\r\n\r\nWe are writing to inform you that your order has been {request.UpdateStatusModel.Status}.\r\n\r\n\r\nKind regards,\r\n\r\nMobileStore Team"
                }, cancellationToken);
            }
        }
    }
}
