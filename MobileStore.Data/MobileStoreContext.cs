using Microsoft.EntityFrameworkCore;

namespace MobileStore.Entities;

public partial class MobileStoreContext : DbContext
{
    public MobileStoreContext()
    {
    }

    public MobileStoreContext(DbContextOptions<MobileStoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductCategory> ProductCategories { get; set; }

    public virtual DbSet<ProductsOrder> ProductsOrders { get; set; }

    public virtual DbSet<ProductsProductCategory> ProductsProductCategories { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=ConnectionStrings:DefaultConnection");

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


            entity.HasOne(d => d.Customer).WithMany(p => p.Orders)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_Orders_Customers");
        });

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

        modelBuilder.Entity<ProductsOrder>(entity =>
        {
            entity.HasKey(e => new { e.ProductId, e.OrderId });

            entity.ToTable("ProductsOrders", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");

            entity.HasOne(d => d.Order).WithMany(p => p.ProductsOrders)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsOrders_Orders");

            entity.HasOne(d => d.Product).WithMany(p => p.Orders)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsOrders_Products");
        });

        modelBuilder.Entity<ProductsProductCategory>(entity =>
        {
            entity.HasKey(e => new { e.ProductId, e.ProductCategoryId });

            entity.ToTable("ProductsProductCategories", "20114101", tb => tb.UseSqlOutputClause(false));

            entity.Property(e => e.Updated20114101).HasColumnName("Updated_20114101");

            entity.HasOne(d => d.ProductCategory).WithMany(p => p.ProductCategories)
                .HasForeignKey(d => d.ProductCategoryId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsProductCategories_ProductCategories");

            entity.HasOne(d => d.Product).WithMany(p => p.ProductCategories)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_ProductsProductCategories_Products");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);


    public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        ApplyAuditInfoRules();

        return base.SaveChangesAsync(cancellationToken);
    }

    private void ApplyAuditInfoRules()
    {
        var changedEntries = this.ChangeTracker
            .Entries()
            .Where(e => e.State == EntityState.Added || e.State == EntityState.Modified);

        foreach(var entry in changedEntries)
        {
            var entity = (IEntity)entry.Entity;

            entity.Updated20114101 = DateTime.UtcNow;
        }
    }
}
