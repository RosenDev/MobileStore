namespace MobileStore.Api.Model.Customer
{
    public class UpdateCustomerModel : CreateCustomerModel
    {
        public int Id { get; set; }
        public string? EcontOfficeCode { get; set; }
    }
}
