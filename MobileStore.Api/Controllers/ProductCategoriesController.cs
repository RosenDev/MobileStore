using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.CommandsAndQueries.ProductCategories;

namespace MobileStore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductCategoriesController : ControllerBase
    {
        private readonly IMediator mediator;

        public ProductCategoriesController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet]
        public async Task<PagedResponse<ProductCategoryModel>> GetAsync([FromQuery] Paging paging, CancellationToken ct)
        {
            return await mediator.Send(new GetAllProductsCategoriesQuery
            {
                Paging = paging
            }, ct);
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpGet("{id}")]
        public async Task<ApiResponse<ProductCategoryModel>> GetAsync(int id, CancellationToken ct)
        {
            return new ApiResponse<ProductCategoryModel>(
                await mediator.Send(new GetProductCategoryByIdQuery
                {
                    Id = id
                }, ct)
                );
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpPost]
        public async Task<ApiResponse<int>> PostAsync([FromBody] CreateProductCategoryModel createProductCategoryModel, CancellationToken ct)
        {
            return ApiResponse.Created(
                await mediator.Send(new CreateProductCategoryCommand
                {
                    CreateProductCategoryModel = createProductCategoryModel
                }, ct)
                );
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpPut]
        public async Task<ApiResponse<ProductCategoryModel>> PutAsync([FromBody] UpdateProductCategoryModel updateProductCategoryModel, CancellationToken ct)
        {
            return new ApiResponse<ProductCategoryModel>(
                await mediator.Send(new UpdateProductCategoryCommand
                {
                    UpdateProductCategoryModel = updateProductCategoryModel
                }, ct)
                );
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpDelete("{id}")]
        public async Task<ApiResponse> DeleteAsync(int id, CancellationToken ct)
        {
            await mediator.Send(new DeleteProductCategoryCommand
            {
                Id = id
            }, ct);

            return ApiResponse.NoContent;
        }
    }
}
