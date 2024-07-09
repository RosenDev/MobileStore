using MediatR;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.CommandsAndQueries.Payments;

namespace MobileStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentsController : ControllerBase
    {
        private readonly IMediator mediator;

        public PaymentsController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet("getToken/{orderId}")]
        public async Task<ApiResponse<string>> GetPaymentTokenForOrderAsync(int orderId, CancellationToken ct)
        {
            return new ApiResponse<string>(await mediator.Send(new GetPaymentTokenForOrderQuery
            {
                OrderId = orderId
            }, ct));
        }
    }
}
