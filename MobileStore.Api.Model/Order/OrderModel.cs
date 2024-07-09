namespace MobileStore.Api.Model
{
    public class OrderModel
    {
        public int Id { get; set; }

        public decimal Price => Products.Sum(x => x.Quantity * x.Price);

        public int Quantity => Products.Sum(x => x.Quantity);

        public string CustomerName { get; set; } = null!;

        public string CustomerAddress { get; set; } = null!;

        public string CustomerPhone { get; set; } = null!;

        public string? EcontOfficeCode { get; set; }

        public DateTime OrderDate { get; set; }

        public OrderStatus Status { get; set; }
        public List<ProductInOrderModel> Products { get; set; } = new List<ProductInOrderModel>();

        public DateTime? Updated20114101 { get; set; }
    }
}
