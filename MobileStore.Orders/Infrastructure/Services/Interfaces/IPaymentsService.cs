namespace MobileStore.Services.Interfaces
{
    internal interface IPaymentsService
    {
        Task<string> GeneratePaymentTokenAsync(string description, decimal amount);
    }
}
