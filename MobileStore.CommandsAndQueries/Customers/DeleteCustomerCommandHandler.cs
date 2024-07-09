using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class DeleteCustomerCommandHandler : IRequestHandler<DeleteCustomerCommand>
    {
        private readonly ICustomersService customersService;

        public DeleteCustomerCommandHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }
        public async Task Handle(DeleteCustomerCommand request, CancellationToken cancellationToken)
        {
            await customersService.DeleteCustomerAsync(request.UserId, cancellationToken);
        }
    }
}
