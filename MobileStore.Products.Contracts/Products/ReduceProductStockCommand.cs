using MediatR;
using MobileStore.Api.Model.Product;

namespace MobileStore.CommandsAndQueries.Products
{
    public class ReduceProductStockCommand : IRequest
    {
        public List<ProductStockReductionModel> Reductions { get; set; } = new List<ProductStockReductionModel>();
    }
}
