using MassTransit;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using MobileStore.Api;
using MobileStore.CommandsAndQueries.Customers;
using MobileStore.Configuration;
using MobileStore.Entities;
using MobileStore.Services;
using MobileStore.Services.Interfaces;
using Stripe;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<MobileStoreContext>(opts =>
{
    opts.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

builder.Services.AddDbContext<AuthDbContext>(opts =>
{
    opts.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

builder.Services.AddAutoMapper(x => x.AddProfile(new MapperProfile()));
builder.Services.AddTransient<ICustomersService, CustomersService>();
builder.Services.AddTransient<IProductCategoriesService, ProductCategoriesService>();
builder.Services.AddTransient<IProductsService, ProductsService>();
builder.Services.AddTransient<IOrdersService, OrdersService>();
builder.Services.AddTransient<PaymentIntentService>();
builder.Services.AddTransient<IPaymentsService, PaymentsService>();
builder.Services.AddMediatR(x => x.RegisterServicesFromAssembly(typeof(CreateCustomerCommand).Assembly));

StripeConfiguration.ApiKey = builder.Configuration["StripePrivateKey"];

builder.Services.AddAuthentication().AddJwtBearer();
builder.Services.AddAuthorization();

builder.Services.AddIdentityApiEndpoints<MobileStoreUser>(opts =>
{
    opts.User.RequireUniqueEmail = true;
    opts.Password.RequireDigit = true;
    opts.Password.RequireLowercase = true;
    opts.Password.RequiredLength = 8;
    opts.Password.RequireUppercase = true;
    opts.Password.RequireNonAlphanumeric = true;
})
.AddRoles<IdentityRole>()
.AddEntityFrameworkStores<AuthDbContext>();


builder.Services.AddControllers(options =>
{
    options.Filters.Add<HttpResponseExceptionFilter>();
});

var rabbitMqSettings = builder.Configuration.GetSection("RabbitMQSettings").Get<RabbitMQSettings>()!;

builder.Services.AddMassTransit(x => x.UsingRabbitMq((context, cfg) =>
{
    cfg.Host(rabbitMqSettings.Host, rabbitMqSettings.Port, rabbitMqSettings.VHost, h =>
    {
        h.Username(rabbitMqSettings.User);
        h.Password(rabbitMqSettings.Pass);
    });

    cfg.ConfigureEndpoints(context);
}));

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "MoblieStoreAPI",
        Version = "v1"
    });
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
    {
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 1safsfsdfdfd\"",
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement {
        {
            new OpenApiSecurityScheme {
                Reference = new OpenApiReference {
                    Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});

builder.Services.AddCors(opts =>
{
    opts.AddDefaultPolicy(policy =>
    {
        policy.AllowAnyMethod()
        .AllowAnyHeader()
        .WithOrigins(builder.Configuration["FrontEndBaseUrl"]!)
        .SetIsOriginAllowedToAllowWildcardSubdomains();
    });
});

var app = builder.Build();

if(app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors();

app.UseAuthentication();

app.UseAuthorization();

app.MapGroup("/identity").MapIdentityApi<MobileStoreUser>();

app.MapPost("/identity/logout", async (SignInManager<IdentityUser> signInManager) =>
{
    await signInManager.SignOutAsync();
}).RequireAuthorization();

app.MapControllers();

app.Run();