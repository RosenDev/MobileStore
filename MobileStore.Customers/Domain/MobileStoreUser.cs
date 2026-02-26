using Microsoft.AspNetCore.Identity;

namespace MobileStore.Customers.Domain;

internal class MobileStoreUser : IdentityUser
{
    public int? CustomerId { get; set; }
}
