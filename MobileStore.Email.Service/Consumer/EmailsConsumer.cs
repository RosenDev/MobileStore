using MassTransit;
using MobileStore.Email.Service.Model;
using MobileStore.Email.Service.Services;

namespace MobileStore.Email.Service.Consumer
{
    internal sealed class EmailsConsumer : IConsumer<EmailModel>
    {
        private readonly IEmailSender emailSender;

        public EmailsConsumer(IEmailSender emailSender)
        {
            this.emailSender = emailSender;
        }

        public async Task Consume(ConsumeContext<EmailModel> context)
        {
            await emailSender.SendEmailAsync(context.Message.To, context.Message.Subject, context.Message.Body, default);
        }
    }
}
