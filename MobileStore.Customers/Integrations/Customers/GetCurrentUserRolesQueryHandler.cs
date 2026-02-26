using MediatR;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    internal sealed class GetCurrentUserRolesQueryHandler : IRequestHandler<GetCurrentUserRolesQuery, List<string>>
    {
        private readonly ICustomersService customersService;

        public GetCurrentUserRolesQueryHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }

        public Task<List<string>> Handle(GetCurrentUserRolesQuery request, CancellationToken cancellationToken)
        {
            return customersService.GetCurrentUserRolesAsync(request.UserId);
        }
    }
}
