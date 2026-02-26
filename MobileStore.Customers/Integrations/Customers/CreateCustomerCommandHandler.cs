using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    internal sealed class CreateCustomerCommandHandler : IRequestHandler<CreateCustomerCommand, int>
    {
        private readonly ICustomersService customersService;

        public CreateCustomerCommandHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }

        public Task<int> Handle(CreateCustomerCommand request, CancellationToken cancellationToken)
        {
            return customersService.CreateCustomerAsync(request.UserId, request.CreateCustomerModel, cancellationToken);
        }
    }
}
