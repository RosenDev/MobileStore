using MediatR;
using MobileStore.Api.Model.Customer;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class GetCustomerInfoByIdQuery : IRequest<CustomerInfoModel>
    {
        public int CustomerId { get; set; }
    }
}
