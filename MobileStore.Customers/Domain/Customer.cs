namespace MobileStore.Customers.Domain;

internal class Customer
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string Address1Line { get; set; } = null!;

    public string? Address2Line { get; set; }

    public string City { get; set; } = null!;

    public string PostCode { get; set; } = null!;

    public string? EcontOfficeCode { get; set; }

    public DateTime? Updated20114101 { get; set; }
}
