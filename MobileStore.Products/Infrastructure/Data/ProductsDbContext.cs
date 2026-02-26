using Microsoft.EntityFrameworkCore;
using MobileStore.Products.Domain;

namespace MobileStore.Products.Infrastructure.Data;

internal sealed class ProductsDbContext : DbContext
{
    public ProductsDbContext(DbContextOptions<ProductsDbContext> options)
        : base(options)
    {
    }

    public DbSet<Product> Products => Set<Product>();

    public DbSet<ProductCategory> ProductCategories => Set<ProductCategory>();

    public DbSet<ProductsProductCategory> ProductsProductCategories => Set<ProductsProductCategory>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Product>(entity =>
        {
            entity.ToTable("Products", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Price).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");
        });

        modelBuilder.Entity<ProductCategory>(entity =>
        {
            entity.ToTable("ProductCategories", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.HasIndex(e => new { e.Id, e.Name }, "IX_ProductCategories_Id_Name").IsUnique();

            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");
        });

        modelBuilder.Entity<ProductsProductCategory>(entity =>
        {
            entity.HasKey(e => new { e.ProductId, e.ProductCategoryId });

            entity.ToTable("ProductsProductCategories", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");

            entity.HasOne(d => d.ProductCategory)
                .WithMany(p => p.ProductCategories)
                .HasForeignKey(d => d.ProductCategoryId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsProductCategories_ProductCategories");

            entity.HasOne(d => d.Product)
                .WithMany(p => p.ProductCategories)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsProductCategories_Products");
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
