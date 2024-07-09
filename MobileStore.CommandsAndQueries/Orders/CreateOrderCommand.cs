using MediatR;
using MobileStore.Api.Model;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class CreateOrderCommand : IRequest<int>
    {
        public CreateOrderModel CreateOrderModel { get; set; }
    }
}
