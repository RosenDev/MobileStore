using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class GetCustomerQuery : IRequest<ApiResponse<CustomerModel>>
    {
        public string UserId { get; set; }
    }
}
