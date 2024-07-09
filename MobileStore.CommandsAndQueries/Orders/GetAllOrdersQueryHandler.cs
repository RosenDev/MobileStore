using MediatR;
using MobileStore.Api.Model;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Orders
{
    public class GetAllOrdersQueryHandler : IRequestHandler<GetAllOrdersQuery, PagedResponse<OrderModel>>
    {
        private readonly IOrdersService ordersService;

        public GetAllOrdersQueryHandler(
            IOrdersService ordersService)
        {
            this.ordersService = ordersService;
        }

        public async Task<PagedResponse<OrderModel>> Handle(GetAllOrdersQuery request, CancellationToken cancellationToken)
        {
            return await ordersService.GetAllOrdersAsync(request.Paging.Page, request.Paging.Size, cancellationToken);
        }
    }
}