using MediatR;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class DeleteOrderCommand : IRequest
    {
        public int Id { get; set; }
    }
}
