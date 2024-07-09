using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.CommandsAndQueries.Orders;

namespace MobileStore.Orders.Service.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IMediator mediator;

        public OrdersController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpGet]
        public async Task<PagedResponse<OrderModel>> GetAsync([FromQuery] Paging paging, CancellationToken ct)
        {
            return await mediator.Send(new GetAllOrdersQuery { Paging = paging }, ct);
        }

        [HttpGet("byCustomerId/{customerId}")]
        public async Task<ApiResponse<List<OrderModel>>> GetByCustomerIdAsync(int customerId, CancellationToken ct)
        {
            return new ApiResponse<List<OrderModel>>(await mediator.Send(new GetAllOrdersByCustomerIdQuery { CustomerId = customerId }, ct));
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<OrderModel>> GetAsync(int id, CancellationToken ct)
        {
            return await mediator.Send(new GetOrderByIdQuery { Id = id }, ct);
        }

        [HttpPost]
        public async Task<ApiResponse> PostAsync([FromBody] CreateOrderModel createOrderModel, CancellationToken ct)
        {
            return ApiResponse.Created(await mediator.Send(
                new CreateOrderCommand
                {
                    CreateOrderModel = createOrderModel
                },
                ct));
        }

        [HttpPut]
        public async Task<ApiResponse<OrderModel>> PutAsync([FromBody] UpdateOrderModel orderToUpdate, CancellationToken ct)
        {
            return new ApiResponse<OrderModel>(await mediator.Send(
                new UpdateOrderCommand
                {
                    UpdateOrderModel = orderToUpdate
                },
                ct));
        }


        [HttpPut("status/{id}")]
        public async Task<ApiResponse> PutAsync([FromRoute] int id, [FromBody] UpdateStatusModel updateStatusModel, CancellationToken ct)
        {
            await mediator.Send(new UpdateOrderStatusCommand
            {
                Id = id,
                UpdateStatusModel = updateStatusModel
            }, ct);

            return ApiResponse.NoContent;
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpDelete("{id}")]
        public async Task<ApiResponse> DeleteAsync(int id, CancellationToken ct)
        {
            await mediator.Send(new DeleteOrderCommand { Id = id }, ct);
            return ApiResponse.NoContent;
        }
    }
}
