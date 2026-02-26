namespace MobileStore.Api.Model.Product
{
    public class CreateProductModel
    {
        public string Name { get; set; } = null!;

        public string Description { get; set; } = null!;

        public int Quantity { get; set; }

        public decimal Price { get; set; }

        public List<int> CategoryIds { get; set; }
    }
}
