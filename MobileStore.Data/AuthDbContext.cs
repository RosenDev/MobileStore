using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace MobileStore.Entities;
public class AuthDbContext : IdentityDbContext<MobileStoreUser, IdentityRole, string>
{
    public AuthDbContext(DbContextOptions<AuthDbContext> options) :
    base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.HasDefaultSchema("20114101");

        builder.Entity<MobileStoreUser>().ToTable(x => x.UseSqlOutputClause(false));
    }
}

