using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model.Customer;
using MobileStore.Entities;
using MobileStore.Services.Interfaces;

namespace MobileStore.Services
{
    public class CustomersService : ICustomersService
    {
        private readonly MobileStoreContext dbContext;
        private readonly AuthDbContext authDbContext;
        private readonly UserManager<MobileStoreUser> userManager;
        private readonly IMapper mapper;

        public CustomersService(
            MobileStoreContext dbContext,
            AuthDbContext authDbContext,
            UserManager<MobileStoreUser> userManager,
            IMapper mapper
            )
        {
            this.dbContext = dbContext;
            this.authDbContext = authDbContext;
            this.userManager = userManager;
            this.mapper = mapper;
        }

        public async Task<int> CreateCustomerAsync(string userId, CreateCustomerModel customer, CancellationToken ct)
        {
            var customerEntity = mapper.Map<Customer>(customer);

            dbContext.Customers.Add(customerEntity);

            await dbContext.SaveChangesAsync(ct);

            var user = (await authDbContext.Users.FindAsync(userId, ct))!;

            user.CustomerId = customerEntity.Id;

            authDbContext.Users.Update(user);

            await authDbContext.SaveChangesAsync(ct);

            await userManager.AddToRoleAsync(user, "Customer");

            return customerEntity.Id;
        }

        public async Task DeleteCustomerAsync(string userId, CancellationToken ct)
        {
            var user = (await authDbContext.Users.FindAsync(userId))!;

            var customer = await dbContext.Customers.FirstAsync(x => x.Id == user.CustomerId, ct);

            dbContext.Customers.Remove(customer);

            await dbContext.SaveChangesAsync(ct);

            authDbContext.Remove(user);

            await authDbContext.SaveChangesAsync(ct);
        }

        public async Task<CustomerModel> GetCustomerAsync(string userId, CancellationToken ct)
        {
            var user = (await authDbContext.Users.FindAsync(userId, ct))!;

            return mapper.Map<CustomerModel>(await dbContext.Customers
                .Include(x => x.Orders)
                .ThenInclude(x => x.ProductsOrders)
                .ThenInclude(x => x.Product)
                .FirstAsync(x => x.Id == user.CustomerId)
                );
        }

        public async Task<CustomerModel> UpdateCustomerAsync(UpdateCustomerModel customer, CancellationToken ct)
        {
            var customerEntity = mapper.Map<Customer>(customer);

            dbContext.Customers.Update(customerEntity);

            await dbContext.SaveChangesAsync(ct);

            return mapper.Map<CustomerModel>(customerEntity);
        }
    }
}
