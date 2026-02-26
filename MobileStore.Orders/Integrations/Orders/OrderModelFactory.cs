using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.Api.Model.Product;
using MobileStore.Orders.Domain;
using ApiOrderStatus = MobileStore.Api.Model.OrderStatus;

namespace MobileStore.CommandsAndQueries.Orders;

internal static class OrderModelFactory
{
    public static OrderModel Create(Order order, CustomerInfoModel customer, IReadOnlyDictionary<int, ProductModel> productsById)
    {
        var products = order.ProductsOrders
            .Select(x =>
            {
                productsById.TryGetValue(x.ProductId, out var product);

                return new ProductInOrderModel
                {
                    Id = x.ProductId,
                    Name = product?.Name ?? string.Empty,
                    Price = product?.Price ?? 0,
                    Quantity = x.Quantity
                };
            })
            .ToList();

        return new OrderModel
        {
            Id = order.Id,
            Status = (ApiOrderStatus)order.Status,
            OrderDate = order.OrderDate,
            Updated20114101 = order.Updated20114101,
            CustomerName = $"{customer.FirstName} {customer.LastName}",
            CustomerPhone = customer.PhoneNumber,
            EcontOfficeCode = customer.EcontOfficeCode,
            CustomerAddress = $"{customer.Address1Line}\r\n{customer.Address2Line}\r\n\r\n{customer.City}\r\n\r\n{customer.PostCode}",
            Products = products
        };
    }
}
