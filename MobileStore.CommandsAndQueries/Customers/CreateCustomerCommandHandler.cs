using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class CreateCustomerCommandHandler : IRequestHandler<CreateCustomerCommand, int>
    {
        private readonly ICustomersService customersService;

        public CreateCustomerCommandHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }
        public async Task<int> Handle(CreateCustomerCommand request, CancellationToken cancellationToken)
        {
            return await customersService.CreateCustomerAsync(request.UserId, request.CreateCustomerModel, cancellationToken);
        }
    }
}
