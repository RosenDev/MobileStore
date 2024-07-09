using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;

namespace MobileStore.Services.Interfaces
{
    public interface IOrdersService
    {
        Task<int> CreateOrderAsync(CreateOrderModel orderModel, CancellationToken ct);
        Task<PagedResponse<OrderModel>> GetAllOrdersAsync(int page, int size, CancellationToken ct);
        Task DeleteOrderAsync(int id, CancellationToken ct);
        Task<OrderModel> UpdateOrderAsync(UpdateOrderModel orderToUpdate, CancellationToken ct);
        Task UpdateOrderStatusAsync(int id, UpdateStatusModel updateStatusModel, CancellationToken ct);
        Task<CustomerModel> GetCustomerInfoOrderIdAsync(int orderId, CancellationToken ct);
        Task<OrderModel> GetOrderAsync(int id, CancellationToken ct);
        Task<List<OrderModel>> GetOrdersByCustomerIdAsync(int customerId, CancellationToken ct);
    }
}
