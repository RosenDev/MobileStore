using MediatR;
using MobileStore.Api.Model.Customer;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class UpdateCustomerCommandHandler : IRequestHandler<UpdateCustomerCommand, CustomerModel>
    {
        private readonly ICustomersService customersService;

        public UpdateCustomerCommandHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }

        public async Task<CustomerModel> Handle(UpdateCustomerCommand request, CancellationToken cancellationToken)
        {
            return await customersService.UpdateCustomerAsync(request.UpdateCustomerModel, cancellationToken);
        }
    }
}
