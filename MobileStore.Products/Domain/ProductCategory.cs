namespace MobileStore.Products.Domain;

internal class ProductCategory
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateTime? Updated20114101 { get; set; }

    public ICollection<ProductsProductCategory> ProductCategories { get; set; } = new List<ProductsProductCategory>();
}
