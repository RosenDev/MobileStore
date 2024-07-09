namespace MobileStore.Services.Interfaces
{
    public interface IPaymentsService
    {
        Task<string> GeneratePaymentTokenAsync(string description, decimal amount);
    }
}
