using Microsoft.EntityFrameworkCore;
using MobileStore.Orders.Domain;

namespace MobileStore.Orders.Infrastructure.Data;

internal sealed class OrdersDbContext : DbContext
{
    public OrdersDbContext(DbContextOptions<OrdersDbContext> options)
        : base(options)
    {
    }

    public DbSet<Order> Orders => Set<Order>();

    public DbSet<ProductsOrder> ProductsOrders => Set<ProductsOrder>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Order>(entity =>
        {
            entity.ToTable("Orders", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.HasIndex(e => new { e.Id, e.CustomerId }, "IX_Orders_Id_CustomerId").IsUnique();

            entity.Property(x => x.Status).HasConversion(
                x => x.ToString(),
                x => Enum.Parse<OrderStatus>(x)
            );

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");
            entity.Property(e => e.OrderDate).HasDefaultValue(DateTime.Now);
        });

        modelBuilder.Entity<ProductsOrder>(entity =>
        {
            entity.HasKey(e => new { e.ProductId, e.OrderId });

            entity.ToTable("ProductsOrders", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");

            entity.HasOne(d => d.Order)
                .WithMany(p => p.ProductsOrders)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsOrders_Orders");
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
