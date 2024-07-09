using MediatR;
using MobileStore.Api.Model;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class UpdateOrderCommand : IRequest<OrderModel>
    {
        public UpdateOrderModel UpdateOrderModel { get; set; }
    }
}
