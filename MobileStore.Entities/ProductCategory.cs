namespace MobileStore.Entities;

public partial class ProductCategory : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateTime? Updated20114101 { get; set; }

    public virtual ICollection<ProductsProductCategory> ProductCategories { get; set; } = new List<ProductsProductCategory>();
}
