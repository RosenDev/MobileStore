using System.Security.Claims;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.CommandsAndQueries.Customers;

namespace MobileStore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly IMediator mediator;

        public CustomersController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet]
        public async Task<ApiResponse> GetAsync(CancellationToken ct)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;

            return await mediator.Send(new GetCustomerQuery { UserId = userId }, ct);
        }

        [HttpPost]
        public async Task<ApiResponse> PostAsync([FromBody] CreateCustomerModel customerModel, CancellationToken ct)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;

            var customerId = await mediator.Send(new CreateCustomerCommand
            {
                CreateCustomerModel = customerModel,
                UserId = userId
            }, ct);

            return ApiResponse.Created(customerId);
        }

        [HttpPut]
        public async Task<ApiResponse<CustomerModel>> PutAsync([FromBody] UpdateCustomerModel customerModel, CancellationToken ct)
        {
            var updatedCustomer = await mediator.Send(new UpdateCustomerCommand { UpdateCustomerModel = customerModel }, ct);

            return new ApiResponse<CustomerModel>(updatedCustomer);
        }

        [HttpDelete]
        public async Task<ApiResponse> DeleteAsync(CancellationToken ct)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;

            await mediator.Send(new DeleteCustomerCommand { UserId = userId }, ct);

            return ApiResponse.NoContent;
        }
    }
}
