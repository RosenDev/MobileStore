using MobileStore.Api.Model.ProductCategory;

namespace MobileStore.Api.Model.Product
{
    public class ProductModel
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Description { get; set; } = null!;

        public int Quantity { get; set; }

        public bool InStock { get; set; }

        public decimal Price { get; set; }

        public DateTime? Updated20114101 { get; set; }

        public List<ProductCategoryModel> Categories { get; set; }
    }
}
