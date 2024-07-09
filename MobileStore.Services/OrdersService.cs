using AutoMapper;
using Microsoft.EntityFrameworkCore;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.Entities;
using MobileStore.Services.Interfaces;
using ApiOrderStatus = MobileStore.Api.Model.OrderStatus;
using OrderStatus = MobileStore.Entities.OrderStatus;

namespace MobileStore.Services
{

    public class OrdersService : IOrdersService
    {
        private readonly MobileStoreContext dbContext;
        private readonly AuthDbContext authDbContext;
        private readonly IMapper mapper;

        public OrdersService(
            MobileStoreContext dbContext,
            AuthDbContext authDbContext,
            IMapper mapper
            )
        {
            this.mapper = mapper;
            this.dbContext = dbContext;
            this.authDbContext = authDbContext;
        }

        public async Task<int> CreateOrderAsync(CreateOrderModel orderModel, CancellationToken ct)
        {
            var orderEntity = new Order
            {
                CustomerId = orderModel.CustomerId,
                Status = OrderStatus.Created,
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
            var order = (await dbContext.Orders.FindAsync(id, ct))!;

            dbContext.Orders.Remove(order);

            await dbContext.SaveChangesAsync(ct);
        }

        public async Task<PagedResponse<OrderModel>> GetAllOrdersAsync(int page, int size, CancellationToken ct)
        {
            var orders = await dbContext.Orders
                .Include(x => x.Customer)
                .Include(x => x.ProductsOrders)
                .ThenInclude(x => x.Product)
                .Skip(page - 1)
                .Take(size)
                .ToListAsync(ct);

            return new PagedResponse<OrderModel>(
                orders.Select(mapper.Map<OrderModel>).ToList(),
                page,
                size,
                await dbContext.Orders.CountAsync()
                );
        }

        public async Task<OrderModel> GetOrderAsync(int id, CancellationToken ct)
        {
            return mapper.Map<OrderModel>(
                await dbContext.Orders
                .Include(x => x.Customer)
                .Include(x => x.ProductsOrders)
                .ThenInclude(x => x.Product)
                .FirstAsync(x => x.Id == id, ct)
                );
        }

        public async Task<CustomerModel> GetCustomerInfoOrderIdAsync(int orderId, CancellationToken ct)
        {
            return mapper.Map<CustomerModel>((await dbContext.Orders.Include(x => x.Customer).FirstOrDefaultAsync(x => x.Id == orderId, ct))!.Customer);
        }

        public async Task<List<OrderModel>> GetOrdersByCustomerIdAsync(int customerId, CancellationToken ct)
        {
            var data = await dbContext.Orders
                .Include(x => x.Customer)
                .Include(x => x.ProductsOrders)
                .ThenInclude(x => x.Product)
                .Where(x => x.CustomerId == customerId)
                .ToListAsync(ct);

            return data.Select(mapper.Map<OrderModel>).ToList();
        }

        public async Task<OrderModel> UpdateOrderAsync(UpdateOrderModel orderToUpdate, CancellationToken ct)
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


            var updatedEntity = await dbContext.Orders
                .Include(x => x.Customer)
                .Include(x => x.ProductsOrders)
                .ThenInclude(x => x.Product)
                .FirstAsync(x => x.Id == orderToUpdate.Id, ct);

            return mapper.Map<OrderModel>(updatedEntity);
        }

        public async Task UpdateOrderStatusAsync(int id, UpdateStatusModel updateStatusModel, CancellationToken ct)
        {
            var updatedEntity = await dbContext.Orders
                .Include(x => x.Customer)
                .Include(x => x.ProductsOrders)
                .ThenInclude(x => x.Product)
                .FirstAsync(x => x.Id == id, ct);

            updatedEntity.Status = (OrderStatus)updateStatusModel.Status;

            await dbContext.SaveChangesAsync(ct);

            if(updateStatusModel.Status == ApiOrderStatus.Paid)
            {
                var productsAndQuatityToReduce = updatedEntity.ProductsOrders
                    .Select(x => new { x.ProductId, QuantityToReduce = x.Quantity })
                    .ToList();

                var productIds = productsAndQuatityToReduce.Select(x => x.ProductId);

                var products = await dbContext.Products.Where(x => productIds.Contains(x.Id)).ToListAsync();

                products.ForEach(x => x.Quantity -= productsAndQuatityToReduce.First(pq => pq.ProductId == x.Id).QuantityToReduce);

                dbContext.Products.UpdateRange(products);

                await dbContext.SaveChangesAsync();
            }
        }
    }
}
