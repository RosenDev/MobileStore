namespace MobileStore.Entities;

public partial class ProductsProductCategory : IEntity
{
    public int ProductId { get; set; }

    public int ProductCategoryId { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual ProductCategory ProductCategory { get; set; } = null!;
}
