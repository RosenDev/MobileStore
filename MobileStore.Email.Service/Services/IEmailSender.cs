namespace MobileStore.Email.Service.Services
{
    internal interface IEmailSender
    {
        Task SendEmailAsync(string to, string subject, string body, CancellationToken ct);
    }
}
