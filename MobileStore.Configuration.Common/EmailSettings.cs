namespace MobileStore.Configuration
{
    public class EmailSettings
    {
        public string DevelopmentEmailOverride { get; set; } = null!;

        public bool IsDevelopmentMode { get; set; }
    }
}
