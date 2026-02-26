using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MobileStore.Products.Infrastructure.Data;
using MobileStore.Services;
using MobileStore.Services.Interfaces;

namespace MobileStore.Products;

public static class ProductsModuleServiceCollectionExtensions
{
    public static IServiceCollection AddProductsModule(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        services.AddDbContext<ProductsDbContext>(opts => opts.UseSqlServer(connectionString));

        services.AddAutoMapper(x => x.AddProfile(new ProductsMapperProfile()));

        services.AddTransient<IProductsService, ProductsService>();
        services.AddTransient<IProductCategoriesService, ProductCategoriesService>();

        services.AddMediatR(x => x.RegisterServicesFromAssembly(typeof(ProductsModuleServiceCollectionExtensions).Assembly));

        return services;
    }
}
