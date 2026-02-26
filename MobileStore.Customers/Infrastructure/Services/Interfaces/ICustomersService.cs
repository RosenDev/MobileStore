using MobileStore.Api.Model.Customer;

namespace MobileStore.Services.Interfaces
{
    internal interface ICustomersService
    {
        Task<int> CreateCustomerAsync(string userId, CreateCustomerModel customer, CancellationToken ct);

        Task DeleteCustomerAsync(string userId, CancellationToken ct);

        Task<CustomerModel> UpdateCustomerAsync(UpdateCustomerModel customer, CancellationToken ct);

        Task<CustomerModel> GetCustomerAsync(string userId, CancellationToken ct);

        Task<CustomerInfoModel> GetCustomerInfoByIdAsync(int customerId, CancellationToken ct);

        Task<List<string>> GetCurrentUserRolesAsync(string userId);

        Task DeleteCurrentUserAsync(string userId, CancellationToken ct);
    }
}
