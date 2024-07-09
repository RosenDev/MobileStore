namespace MobileStore.Services.Interfaces
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string to, string topic, string body, CancellationToken ct);
    }
}
