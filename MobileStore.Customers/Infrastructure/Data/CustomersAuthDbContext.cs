using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MobileStore.Customers.Domain;

namespace MobileStore.Customers.Infrastructure.Data;

internal sealed class CustomersAuthDbContext : IdentityDbContext<MobileStoreUser, IdentityRole, string>
{
    public CustomersAuthDbContext(DbContextOptions<CustomersAuthDbContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.HasDefaultSchema("20114101");
        builder.Entity<MobileStoreUser>().ToTable(x => x.UseSqlOutputClause(false));
    }
}
