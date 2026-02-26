using MediatR;
using MobileStore.Api.Model.Customer;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class CreateCustomerCommand : IRequest<int>
    {
        public string UserId { get; set; }
        public CreateCustomerModel CreateCustomerModel { get; set; }
    }
}
