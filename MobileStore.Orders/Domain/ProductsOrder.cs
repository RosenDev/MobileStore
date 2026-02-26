namespace MobileStore.Orders.Domain;

internal class ProductsOrder
{
    public int ProductId { get; set; }

    public int OrderId { get; set; }

    public int Quantity { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public Order Order { get; set; } = null!;
}
