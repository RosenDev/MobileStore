using MediatR;
using MobileStore.Api.Model.ProductCategory;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class GetProductCategoryByIdQuery : IRequest<ProductCategoryModel>
    {
        public int Id { get; set; }
    }
}
