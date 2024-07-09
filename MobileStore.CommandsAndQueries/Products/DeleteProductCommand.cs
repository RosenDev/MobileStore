using MediatR;

namespace MobileStore.CommandsAndQueries.Products
{
    public class DeleteProductCommand : IRequest
    {
        public int Id { get; set; }
    }
}
