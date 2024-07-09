using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Product;
using MobileStore.CommandsAndQueries.Products;

namespace MobileStore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IMediator mediator;

        public ProductsController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet]
        public async Task<PagedResponse<ProductModel>> GetAsync([FromQuery] Paging paging, CancellationToken ct)
        {
            return await mediator.Send(new GetAllProductsQuery
            {
                Paging = paging
            }
            , ct);
        }

        [HttpGet("{id}")]
        public async Task<ApiResponse<ProductModel>> GetAsync(int id, CancellationToken ct)
        {
            return new ApiResponse<ProductModel>(await mediator.Send(new GetProductByIdQuery
            {
                Id = id
            }, ct));
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpPost]
        public async Task<ApiResponse<int>> PostAsync([FromBody] CreateProductModel createProductModel, CancellationToken ct)
        {
            return ApiResponse.Created(await mediator.Send(new CreateProductCommand
            {
                CreateProductModel = createProductModel
            }, ct));
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpPut]
        public async Task<ApiResponse<ProductModel>> PutAsync([FromBody] UpdateProductModel updateProductModel, CancellationToken ct)
        {
            return new ApiResponse<ProductModel>(await mediator.Send(new UpdateProductCommand
            {
                UpdateProductModel = updateProductModel
            }, ct));
        }

        [Authorize(Roles = "SiteOwner, Administrator")]
        [HttpDelete("{id}")]
        public async Task<ApiResponse> DeleteAsync(int id, CancellationToken ct)
        {
            await mediator.Send(new DeleteProductCommand
            {
                Id = id
            }, ct);

            return ApiResponse.NoContent;
        }
    }
}
