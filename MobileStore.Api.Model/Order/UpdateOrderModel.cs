namespace MobileStore.Api.Model
{
    public class UpdateOrderModel
    {
        public int Id { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public List<ProductInOrderEditModel> Products { get; set; }
    }
}
