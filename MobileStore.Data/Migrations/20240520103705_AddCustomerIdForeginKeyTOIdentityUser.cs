using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MobileStore.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddCustomerIdForeginKeyTOIdentityUser : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CustomerId",
                schema: "20114101",
                table: "AspNetUsers",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CustomerId",
                schema: "20114101",
                table: "AspNetUsers");
        }
    }
}
