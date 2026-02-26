using MediatR;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class GetCurrentUserRolesQuery : IRequest<List<string>>
    {
        public string UserId { get; set; } = null!;
    }
}
