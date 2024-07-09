using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Options;
using MobileStore.Configuration;
using MobileStore.Services.Interfaces;

namespace MobileStore.Services
{
    public class EmailSender : IEmailSender
    {
        private readonly IOptions<MailTrapSettings> mailTrapOptions;
        private readonly IOptions<EmailSettings> emailOptions;

        public EmailSender(IOptions<MailTrapSettings> mailTrapOptions, IOptions<EmailSettings> emailOptions)
        {
            this.mailTrapOptions = mailTrapOptions;
            this.emailOptions = emailOptions;
        }

        public async Task SendEmailAsync(string to, string subject, string body, CancellationToken ct)
        {
            var receiver = emailOptions.Value.IsDevelopmentMode ?
                emailOptions.Value.DevelopmentEmailOverride :
                to;

            var email = new MailMessage(mailTrapOptions.Value.SmtpFrom!, receiver, subject, body);

            using(var smtp = new SmtpClient(mailTrapOptions.Value.Host, mailTrapOptions.Value.Port)
            {
                Credentials = new NetworkCredential(mailTrapOptions.Value.SmtpUsername!, mailTrapOptions.Value.SmtpPassword!),
                EnableSsl = true
            })
            {
                await smtp.SendMailAsync(email, ct);
            }
        }
    }
}
