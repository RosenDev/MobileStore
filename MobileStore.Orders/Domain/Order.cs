namespace MobileStore.Orders.Domain;

internal class Order
{
    public int Id { get; set; }

    public OrderStatus Status { get; set; }

    public int CustomerId { get; set; }

    public DateTime OrderDate { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public ICollection<ProductsOrder> ProductsOrders { get; set; } = new List<ProductsOrder>();
}
