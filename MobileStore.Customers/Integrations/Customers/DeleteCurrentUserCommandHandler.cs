using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    internal sealed class DeleteCurrentUserCommandHandler : IRequestHandler<DeleteCurrentUserCommand>
    {
        private readonly ICustomersService customersService;

        public DeleteCurrentUserCommandHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }

        public async Task Handle(DeleteCurrentUserCommand request, CancellationToken cancellationToken)
        {
            await customersService.DeleteCurrentUserAsync(request.UserId, cancellationToken);
        }
    }
}
