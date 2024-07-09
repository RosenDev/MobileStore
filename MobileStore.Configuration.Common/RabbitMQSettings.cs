namespace MobileStore.Configuration
{
    public class RabbitMQSettings
    {
        public string User { get; set; } = null!;
        public string Pass { get; set; } = null!;
        public string Host { get; set; } = null!;
        public ushort Port { get; set; }
        public string VHost { get; set; } = null!;
    }
}
