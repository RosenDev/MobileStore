using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.CommandsAndQueries.Orders;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    internal sealed class GetCustomerQueryHandler : IRequestHandler<GetCustomerQuery, ApiResponse<CustomerModel>>
    {
        private readonly ICustomersService customersService;
        private readonly IMediator mediator;

        public GetCustomerQueryHandler(ICustomersService customersService, IMediator mediator)
        {
            this.customersService = customersService;
            this.mediator = mediator;
        }

        public async Task<ApiResponse<CustomerModel>> Handle(GetCustomerQuery request, CancellationToken cancellationToken)
        {
            var customer = await customersService.GetCustomerAsync(request.UserId, cancellationToken);
            customer.Orders = await mediator.Send(new GetAllOrdersByCustomerIdQuery { CustomerId = customer.Id }, cancellationToken);

            return new ApiResponse<CustomerModel>(customer);
        }
    }
}
