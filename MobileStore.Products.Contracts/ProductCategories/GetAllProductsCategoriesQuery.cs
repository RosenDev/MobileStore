using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.ProductCategory;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class GetAllProductsCategoriesQuery : IRequest<PagedResponse<ProductCategoryModel>>
    {
        public Paging Paging { get; set; }
    }
}
