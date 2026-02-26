namespace MobileStore.Api.Model
{
    public class CreateOrderModel
    {
        public int CustomerId { get; set; }
        public List<ProductInOrderEditModel> Products { get; set; }
    }
}
