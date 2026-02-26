using System.Security.Claims;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.CommandsAndQueries.Customers;

namespace MobileStore.Api.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IMediator mediator;

        public UsersController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [Route("roles")]
        [HttpGet]
        public async Task<ApiResponse<List<string>>> GetUserRoles(CancellationToken ct)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;
            var roles = await mediator.Send(new GetCurrentUserRolesQuery { UserId = userId }, ct);

            return new ApiResponse<List<string>>(roles);
        }

        [HttpDelete]
        public async Task<ApiResponse> DeleteUserAsync(CancellationToken ct)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;
            await mediator.Send(new DeleteCurrentUserCommand { UserId = userId }, ct);
            return ApiResponse.NoContent;
        }
    }
}
