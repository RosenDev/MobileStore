using MediatR;
using MobileStore.Api.Model.Customer;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class UpdateCustomerCommand : IRequest<CustomerModel>
    {
        public UpdateCustomerModel UpdateCustomerModel { get; set; }
    }
}
