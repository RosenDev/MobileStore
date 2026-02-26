using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MobileStore.Orders.Infrastructure.Data;
using MobileStore.Services;
using MobileStore.Services.Interfaces;
using Stripe;

namespace MobileStore.Orders;

public static class OrdersModuleServiceCollectionExtensions
{
    public static IServiceCollection AddOrdersModule(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        services.AddDbContext<OrdersDbContext>(opts => opts.UseSqlServer(connectionString));

        services.AddTransient<IOrdersService, OrdersService>();
        services.AddTransient<PaymentIntentService>();
        services.AddTransient<IPaymentsService, PaymentsService>();

        services.AddMediatR(x => x.RegisterServicesFromAssembly(typeof(OrdersModuleServiceCollectionExtensions).Assembly));

        return services;
    }
}
