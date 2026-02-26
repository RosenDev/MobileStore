using MediatR;
using MobileStore.Api.Model.Customer;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    internal sealed class UpdateCustomerCommandHandler : IRequestHandler<UpdateCustomerCommand, CustomerModel>
    {
        private readonly ICustomersService customersService;

        public UpdateCustomerCommandHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }

        public Task<CustomerModel> Handle(UpdateCustomerCommand request, CancellationToken cancellationToken)
        {
            return customersService.UpdateCustomerAsync(request.UpdateCustomerModel, cancellationToken);
        }
    }
}
