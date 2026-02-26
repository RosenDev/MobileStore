using MediatR;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class DeleteCurrentUserCommand : IRequest
    {
        public string UserId { get; set; } = null!;
    }
}
