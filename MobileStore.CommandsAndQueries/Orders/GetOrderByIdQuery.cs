using MediatR;
using MobileStore.Api.Model;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class GetOrderByIdQuery : IRequest<ApiResponse<OrderModel>>
    {
        public int Id { get; set; }
    }
}
