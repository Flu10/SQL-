namespace Magazin.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ThirdMigration : DbMigration
    {
        public override void Up()
        {
            DropIndex("Mkt.Stock", new[] { "ProductId" });
            DropIndex("Mkt.Stock", new[] { "ProducerId" });
            AlterColumn("Mkt.Product", "Price", c => c.Decimal(nullable: false, precision: 10, scale: 2));
            AlterColumn("Nom.ProductCategory", "CategoryName", c => c.String(maxLength: 150));
            CreateIndex("Mkt.Producer", "ProducerId", unique: true, name: "ProducatorIndex");
            CreateIndex("Mkt.Product", "ExpirationDate", name: "ExpirationDateIndex");
            CreateIndex("Mkt.Stock", new[] { "ProductId", "ProducerId" }, unique: true, name: "MX_ProductProducer");
        }
        
        public override void Down()
        {
            DropIndex("Mkt.Stock", "MX_ProductProducer");
            DropIndex("Mkt.Product", "ExpirationDateIndex");
            DropIndex("Mkt.Producer", "ProducatorIndex");
            AlterColumn("Nom.ProductCategory", "CategoryName", c => c.String());
            AlterColumn("Mkt.Product", "Price", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            CreateIndex("Mkt.Stock", "ProducerId");
            CreateIndex("Mkt.Stock", "ProductId");
        }
    }
}
