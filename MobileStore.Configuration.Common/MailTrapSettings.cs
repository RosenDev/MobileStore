namespace MobileStore.Configuration
{
    public class MailTrapSettings
    {
        public string SmtpFrom { get; set; } = null!;
        public string SmtpUsername { get; set; } = null!;
        public string SmtpPassword { get; set; } = null!;
        public string Host { get; set; } = null!;
        public int Port { get; set; }
    }
}
