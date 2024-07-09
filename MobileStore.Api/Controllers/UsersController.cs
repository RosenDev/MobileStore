using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.Entities;

namespace MobileStore.Api.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly SignInManager<MobileStoreUser> signInManager;
        private readonly RoleManager<IdentityRole> roleManager;

        public UsersController(SignInManager<MobileStoreUser> signInManager, RoleManager<IdentityRole> roleManager)
        {
            this.signInManager = signInManager;
            this.roleManager = roleManager;
        }

        [Route("roles")]
        [HttpGet]
        public async Task<ApiResponse<List<string>>> GetUserRoles()
        {
            var currentUser = await signInManager.UserManager.GetUserAsync(signInManager.Context.User)!;

            return new ApiResponse<List<string>>((await signInManager.UserManager.GetRolesAsync(currentUser)).ToList());
        }

        [HttpDelete]
        public async Task<ApiResponse> DeleteUserAsync()
        {
            var currentUser = (await signInManager.UserManager.GetUserAsync(signInManager.Context.User))!;
            await signInManager.UserManager.DeleteAsync(currentUser);
            await signInManager.SignOutAsync();
            return ApiResponse.NoContent;
        }
    }
}
