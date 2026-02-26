using MediatR;
using MobileStore.Api.Model;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class UpdateOrderStatusCommand : IRequest
    {
        public int Id { get; set; }
        public UpdateStatusModel UpdateStatusModel { get; set; }
    }
}
