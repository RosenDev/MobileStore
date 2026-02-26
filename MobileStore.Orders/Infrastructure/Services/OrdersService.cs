using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model;
using MobileStore.Orders.Domain;
using MobileStore.Orders.Infrastructure.Data;
using MobileStore.Services.Interfaces;
using DomainOrderStatus = MobileStore.Orders.Domain.OrderStatus;

namespace MobileStore.Services
{
    internal sealed class OrdersService : IOrdersService
    {
        private readonly OrdersDbContext dbContext;

        public OrdersService(OrdersDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<int> CreateOrderAsync(CreateOrderModel orderModel, CancellationToken ct)
        {
            var orderEntity = new Order
            {
                CustomerId = orderModel.CustomerId,
                Status = DomainOrderStatus.Created,
                ProductsOrders = orderModel.Products
                    .Select(x => new ProductsOrder { ProductId = x.Id, Quantity = x.QuantityOrdered })
                    .ToList()
            };

            dbContext.Orders.Add(orderEntity);
            await dbContext.SaveChangesAsync(ct);

            return orderEntity.Id;
        }

        public async Task DeleteOrderAsync(int id, CancellationToken ct)
        {
            var order = await dbContext.Orders.FirstAsync(x => x.Id == id, ct);
            dbContext.Orders.Remove(order);
            await dbContext.SaveChangesAsync(ct);
        }

        public async Task<List<Order>> GetAllOrdersAsync(int page, int size, CancellationToken ct)
        {
            return await dbContext.Orders
                .AsNoTracking()
                .Include(x => x.ProductsOrders)
                .OrderByDescending(x => x.OrderDate)
                .Skip(page - 1)
                .Take(size)
                .ToListAsync(ct);
        }

        public Task<int> GetTotalOrdersAsync(CancellationToken ct)
        {
            return dbContext.Orders.CountAsync(ct);
        }

        public async Task<Order> GetOrderAsync(int id, CancellationToken ct)
        {
            return await dbContext.Orders
                .AsNoTracking()
                .Include(x => x.ProductsOrders)
                .FirstAsync(x => x.Id == id, ct);
        }

        public async Task<List<Order>> GetOrdersByCustomerIdAsync(int customerId, CancellationToken ct)
        {
            return await dbContext.Orders
                .AsNoTracking()
                .Include(x => x.ProductsOrders)
                .Where(x => x.CustomerId == customerId)
                .OrderByDescending(x => x.OrderDate)
                .ToListAsync(ct);
        }

        public async Task<Order> UpdateOrderAsync(UpdateOrderModel orderToUpdate, CancellationToken ct)
        {
            var orderEntity = await dbContext.Orders
                .Include(x => x.ProductsOrders)
                .FirstAsync(x => x.Id == orderToUpdate.Id, ct);

            orderEntity.ProductsOrders = orderToUpdate.Products
                .Select(x => new ProductsOrder
                {
                    ProductId = x.Id,
                    Quantity = x.QuantityOrdered
                })
                .ToList();

            dbContext.Orders.Update(orderEntity);
            await dbContext.SaveChangesAsync(ct);

            return await dbContext.Orders
                .AsNoTracking()
                .Include(x => x.ProductsOrders)
                .FirstAsync(x => x.Id == orderToUpdate.Id, ct);
        }

        public async Task<Order> UpdateOrderStatusAsync(int id, UpdateStatusModel updateStatusModel, CancellationToken ct)
        {
            var orderEntity = await dbContext.Orders
                .Include(x => x.ProductsOrders)
                .FirstAsync(x => x.Id == id, ct);

            orderEntity.Status = (DomainOrderStatus)updateStatusModel.Status;

            await dbContext.SaveChangesAsync(ct);

            return await dbContext.Orders
                .AsNoTracking()
                .Include(x => x.ProductsOrders)
                .FirstAsync(x => x.Id == id, ct);
        }
    }
}
