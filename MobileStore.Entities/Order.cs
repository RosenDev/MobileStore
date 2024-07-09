namespace MobileStore.Entities;

public partial class Order : IEntity
{
    public int Id { get; set; }

    public OrderStatus Status { get; set; }

    public int CustomerId { get; set; }

    public DateTime OrderDate { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual ICollection<ProductsOrder> ProductsOrders { get; set; } = new List<ProductsOrder>();
}
