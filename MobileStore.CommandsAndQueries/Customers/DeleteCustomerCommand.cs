using MediatR;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class DeleteCustomerCommand : IRequest
    {
        public string UserId { get; set; }
    }
}
