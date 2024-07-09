namespace MobileStore.Api.Model
{
    public class ProductInOrderModel
    {
        public int Id { get; set; }

        public string Name { get; set; }
        public decimal Price { get; set; }

        public int Quantity { get; set; }
    }
}
