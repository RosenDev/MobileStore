namespace MobileStore.Api.Model.Customer
{
    public class CustomerModel
    {
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Address1Line { get; set; } = null!;

        public string? Address2Line { get; set; }

        public string PhoneNumber { get; set; }

        public string City { get; set; } = null!;

        public string PostCode { get; set; } = null!;

        public string EcontOfficeCode { get; set; } = null!;

        public List<OrderModel> Orders { get; set; }
    }
}
