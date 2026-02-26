using MediatR;

namespace MobileStore.CommandsAndQueries.Payments
{
    public class GetPaymentTokenForOrderQuery : IRequest<string>
    {
        public int OrderId { get; set; }
    }
}
