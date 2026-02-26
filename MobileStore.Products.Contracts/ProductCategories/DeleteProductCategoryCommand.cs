using MediatR;

namespace MobileStore.CommandsAndQueries.ProductCategories
{
    public class DeleteProductCategoryCommand : IRequest
    {
        public int Id { get; set; }
    }
}
