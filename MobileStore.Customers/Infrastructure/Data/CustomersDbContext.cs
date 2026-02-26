using Microsoft.EntityFrameworkCore;
using MobileStore.Customers.Domain;

namespace MobileStore.Customers.Infrastructure.Data;

internal sealed class CustomersDbContext : DbContext
{
    public CustomersDbContext(DbContextOptions<CustomersDbContext> options)
        : base(options)
    {
    }

    public DbSet<Customer> Customers => Set<Customer>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Customers_1");

            entity.ToTable("Customers", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.FirstName).HasMaxLength(200);
            entity.Property(e => e.LastName).HasMaxLength(200);
            entity.Property(e => e.PhoneNumber).HasMaxLength(100);
            entity.Property(e => e.Address1Line).HasMaxLength(255);
            entity.Property(e => e.Address2Line).HasMaxLength(255);
            entity.Property(e => e.City).HasMaxLength(100);
            entity.Property(e => e.EcontOfficeCode).HasMaxLength(50);
            entity.Property(e => e.PostCode).HasMaxLength(50);
            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");
        });
    }

    public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        ApplyAuditInfoRules();
        return base.SaveChangesAsync(cancellationToken);
    }

    private void ApplyAuditInfoRules()
    {
        var changedEntries = ChangeTracker.Entries()
            .Where(e => e.State == EntityState.Added || e.State == EntityState.Modified);

        foreach(var entry in changedEntries)
        {
            var property = entry.Properties.FirstOrDefault(p => p.Metadata.Name == "Updated20114101");
            if(property is not null)
            {
                property.CurrentValue = DateTime.UtcNow;
            }
        }
    }
}
