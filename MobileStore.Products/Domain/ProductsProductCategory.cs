namespace MobileStore.Products.Domain;

internal class ProductsProductCategory
{
    public int ProductId { get; set; }

    public int ProductCategoryId { get; set; }

    public DateTime? Updated20114101 { get; set; }

    public Product Product { get; set; } = null!;

    public ProductCategory ProductCategory { get; set; } = null!;
}
