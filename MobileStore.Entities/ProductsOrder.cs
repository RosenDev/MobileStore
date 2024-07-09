namespace MobileStore.Entities;

public partial class ProductsOrder : IEntity
{
    public int ProductId { get; set; }

    public int OrderId { get; set; }

    public int Quantity { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
