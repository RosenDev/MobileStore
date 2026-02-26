using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Routing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MobileStore.Customers.Domain;
using MobileStore.Customers.Infrastructure.Data;
using MobileStore.Services;
using MobileStore.Services.Interfaces;

namespace MobileStore.Customers;

public static class CustomersModuleServiceCollectionExtensions
{
    public static IServiceCollection AddCustomersModule(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        services.AddDbContext<CustomersDbContext>(opts => opts.UseSqlServer(connectionString));
        services.AddDbContext<CustomersAuthDbContext>(opts => opts.UseSqlServer(connectionString));

        services.AddAutoMapper(x => x.AddProfile(new CustomersMapperProfile()));
        services.AddTransient<ICustomersService, CustomersService>();

        services.AddIdentityApiEndpoints<MobileStoreUser>(opts =>
        {
            opts.User.RequireUniqueEmail = true;
            opts.Password.RequireDigit = true;
            opts.Password.RequireLowercase = true;
            opts.Password.RequiredLength = 8;
            opts.Password.RequireUppercase = true;
            opts.Password.RequireNonAlphanumeric = true;
        })
        .AddRoles<IdentityRole>()
        .AddEntityFrameworkStores<CustomersAuthDbContext>();

        services.AddMediatR(x => x.RegisterServicesFromAssembly(typeof(CustomersModuleServiceCollectionExtensions).Assembly));

        return services;
    }

    public static IEndpointRouteBuilder MapCustomersModuleIdentityEndpoints(this IEndpointRouteBuilder endpoints)
    {
        endpoints.MapGroup("/identity").MapIdentityApi<MobileStoreUser>();

        endpoints.MapPost("/identity/logout", async (SignInManager<MobileStoreUser> signInManager) =>
        {
            await signInManager.SignOutAsync();
        }).RequireAuthorization();

        return endpoints;
    }
}

