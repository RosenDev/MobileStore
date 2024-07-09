namespace MobileStore.Entities;

public partial class Product : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public decimal Price { get; set; }

    public int Quantity { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public virtual ICollection<ProductsOrder> Orders { get; set; } = new List<ProductsOrder>();

    public virtual ICollection<ProductsProductCategory> ProductCategories { get; set; } = new List<ProductsProductCategory>();
}
