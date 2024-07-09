using Microsoft.AspNetCore.Identity;

namespace MobileStore.Entities
{
    public class MobileStoreUser : IdentityUser
    {
        public int? CustomerId { get; set; }
    }
}
