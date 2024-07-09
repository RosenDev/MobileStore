using MassTransit;
using MobileStore.Configuration;
using MobileStore.Email.Service.Consumer;
using MobileStore.Services;
using MobileStore.Services.Interfaces;

var builder = Host.CreateApplicationBuilder(args);
builder.Services.AddOptions();
builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));
builder.Services.Configure<MailTrapSettings>(builder.Configuration.GetSection("MailTrapSettings"));
var rabbitMqSettings = builder.Configuration.GetSection("RabbitMQSettings").Get<RabbitMQSettings>()!;

builder.Services.AddSingleton<IEmailSender, EmailSender>();
builder.Services.AddOptions<RabbitMqTransportOptions>()
    .Configure(x =>
    {
        x.Host = rabbitMqSettings.Host;
        x.Port = rabbitMqSettings.Port;
        x.User = rabbitMqSettings.User;
        x.Pass = rabbitMqSettings.Pass;
        x.VHost = rabbitMqSettings.VHost;
    });

builder.Services.AddMassTransit(x =>
{
    x.AddConsumer<EmailsConsumer>();
    x.UsingRabbitMq((ctx, cfg) =>
    {
        cfg.ConfigureEndpoints(ctx);
    });
});

var host = builder.Build();
host.Run();
