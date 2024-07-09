using MediatR;
using MobileStore.Api.Model;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class GetAllOrdersQuery : IRequest<PagedResponse<OrderModel>>
    {
        public Paging Paging { get; set; }
    }
}
