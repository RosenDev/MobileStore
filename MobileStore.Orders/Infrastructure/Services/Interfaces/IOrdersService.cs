using MobileStore.Api.Model;
using MobileStore.Orders.Domain;

namespace MobileStore.Services.Interfaces
{
    internal interface IOrdersService
    {
        Task<int> CreateOrderAsync(CreateOrderModel orderModel, CancellationToken ct);

        Task<List<Order>> GetAllOrdersAsync(int page, int size, CancellationToken ct);

        Task<int> GetTotalOrdersAsync(CancellationToken ct);

        Task DeleteOrderAsync(int id, CancellationToken ct);

        Task<Order> UpdateOrderAsync(UpdateOrderModel orderToUpdate, CancellationToken ct);

        Task<Order> UpdateOrderStatusAsync(int id, UpdateStatusModel updateStatusModel, CancellationToken ct);

        Task<Order> GetOrderAsync(int id, CancellationToken ct);

        Task<List<Order>> GetOrdersByCustomerIdAsync(int customerId, CancellationToken ct);
    }
}
