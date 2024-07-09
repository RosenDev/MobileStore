using MediatR;
using MobileStore.Api.Model.ProductCategory;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class CreateProductCategoryCommand : IRequest<int>
    {
        public CreateProductCategoryModel CreateProductCategoryModel { get; set; }
    }
}
