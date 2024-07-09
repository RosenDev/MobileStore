using MediatR;
using MobileStore.Api.Model.ProductCategory;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class UpdateProductCategoryCommand : IRequest<ProductCategoryModel>
    {
        public UpdateProductCategoryModel UpdateProductCategoryModel { get; set; }
    }
}
