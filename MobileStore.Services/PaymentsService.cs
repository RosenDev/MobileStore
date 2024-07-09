using MobileStore.Services.Interfaces;
using Stripe;

namespace MobileStore.Services
{
    public class PaymentsService : IPaymentsService
    {
        private readonly PaymentIntentService paymentIntentService;

        public PaymentsService(PaymentIntentService paymentIntentService)
        {
            this.paymentIntentService = paymentIntentService;
        }
        public async Task<string> GeneratePaymentTokenAsync(string description, decimal amount)
        {
            var options = new PaymentIntentCreateOptions
            {
                Amount = (long)amount * 100,
                Currency = "bgn",
                Description = description,
                AutomaticPaymentMethods = new PaymentIntentAutomaticPaymentMethodsOptions
                {
                    Enabled = true,
                },
            };
            var paymentIntent = await paymentIntentService.CreateAsync(options);
            return paymentIntent.ClientSecret;
        }
    }
}
