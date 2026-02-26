using MediatR;
using MobileStore.Api.Model;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class GetAllOrdersByCustomerIdQuery : IRequest<List<OrderModel>>
    {
        public int CustomerId { get; set; }
    }
}
