namespace MobileStore.Products.Domain;

internal class Product
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public decimal Price { get; set; }

    public int Quantity { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public ICollection<ProductsProductCategory> ProductCategories { get; set; } = new List<ProductsProductCategory>();
}
