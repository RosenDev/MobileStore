using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.Customers.Domain;
using MobileStore.Customers.Infrastructure.Data;
using MobileStore.Services.Interfaces;

namespace MobileStore.Services
{
    internal sealed class CustomersService : ICustomersService
    {
        private readonly CustomersDbContext dbContext;
        private readonly CustomersAuthDbContext authDbContext;
        private readonly UserManager<MobileStoreUser> userManager;
        private readonly IMapper mapper;

        public CustomersService(
            CustomersDbContext dbContext,
            CustomersAuthDbContext authDbContext,
            UserManager<MobileStoreUser> userManager,
            IMapper mapper)
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

            var user = await authDbContext.Users.FirstAsync(x => x.Id == userId, ct);
            user.CustomerId = customerEntity.Id;

            authDbContext.Users.Update(user);
            await authDbContext.SaveChangesAsync(ct);

            await userManager.AddToRoleAsync(user, "Customer");

            return customerEntity.Id;
        }

        public async Task DeleteCustomerAsync(string userId, CancellationToken ct)
        {
            var user = await authDbContext.Users.FirstAsync(x => x.Id == userId, ct);

            if(user.CustomerId.HasValue)
            {
                var customer = await dbContext.Customers.FirstOrDefaultAsync(x => x.Id == user.CustomerId.Value, ct);
                if(customer is not null)
                {
                    dbContext.Customers.Remove(customer);
                    await dbContext.SaveChangesAsync(ct);
                }
            }

            authDbContext.Users.Remove(user);
            await authDbContext.SaveChangesAsync(ct);
        }

        public async Task<CustomerModel> GetCustomerAsync(string userId, CancellationToken ct)
        {
            var user = await authDbContext.Users.AsNoTracking().FirstAsync(x => x.Id == userId, ct);

            if(!user.CustomerId.HasValue)
            {
                throw new InvalidOperationException("User is not linked to customer.");
            }

            var customer = await dbContext.Customers.AsNoTracking().FirstAsync(x => x.Id == user.CustomerId.Value, ct);
            var model = mapper.Map<CustomerModel>(customer);
            model.Orders = new List<OrderModel>();

            return model;
        }

        public async Task<CustomerInfoModel> GetCustomerInfoByIdAsync(int customerId, CancellationToken ct)
        {
            var customer = await dbContext.Customers.AsNoTracking().FirstAsync(x => x.Id == customerId, ct);
            var user = await authDbContext.Users.AsNoTracking().FirstAsync(x => x.CustomerId == customerId, ct);

            return new CustomerInfoModel
            {
                Id = customer.Id,
                FirstName = customer.FirstName,
                LastName = customer.LastName,
                Address1Line = customer.Address1Line,
                Address2Line = customer.Address2Line,
                PhoneNumber = customer.PhoneNumber,
                City = customer.City,
                PostCode = customer.PostCode,
                EcontOfficeCode = customer.EcontOfficeCode,
                Email = user.Email ?? string.Empty
            };
        }

        public async Task<CustomerModel> UpdateCustomerAsync(UpdateCustomerModel customer, CancellationToken ct)
        {
            var customerEntity = mapper.Map<Customer>(customer);

            dbContext.Customers.Update(customerEntity);
            await dbContext.SaveChangesAsync(ct);

            var model = mapper.Map<CustomerModel>(customerEntity);
            model.Orders = new List<OrderModel>();
            return model;
        }

        public async Task<List<string>> GetCurrentUserRolesAsync(string userId)
        {
            var user = await authDbContext.Users.FirstAsync(x => x.Id == userId);
            return (await userManager.GetRolesAsync(user)).ToList();
        }

        public async Task DeleteCurrentUserAsync(string userId, CancellationToken ct)
        {
            var user = await authDbContext.Users.FirstAsync(x => x.Id == userId, ct);

            if(user.CustomerId.HasValue)
            {
                var customer = await dbContext.Customers.FirstOrDefaultAsync(x => x.Id == user.CustomerId.Value, ct);
                if(customer is not null)
                {
                    dbContext.Customers.Remove(customer);
                    await dbContext.SaveChangesAsync(ct);
                }
            }

            authDbContext.Users.Remove(user);
            await authDbContext.SaveChangesAsync(ct);
        }
    }
}

