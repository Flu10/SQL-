namespace Magazin.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SecondMigration : DbMigration
    {
        public override void Up()
        {
            CreateIndex("Mkt.Product", "Category");
            CreateIndex("Mkt.Stock", "ProductId");
            CreateIndex("Mkt.Stock", "ProducerId");
            AddForeignKey("Mkt.Product", "Category", "Nom.ProductCategory", "CategoryId");
            AddForeignKey("Mkt.Stock", "ProducerId", "Mkt.Producer", "ProducerId");
            AddForeignKey("Mkt.Stock", "ProductId", "Mkt.Product", "ProductId");
        }
        
        public override void Down()
        {
            DropForeignKey("Mkt.Stock", "ProductId", "Mkt.Product");
            DropForeignKey("Mkt.Stock", "ProducerId", "Mkt.Producer");
            DropForeignKey("Mkt.Product", "Category", "Nom.ProductCategory");
            DropIndex("Mkt.Stock", new[] { "ProducerId" });
            DropIndex("Mkt.Stock", new[] { "ProductId" });
            DropIndex("Mkt.Product", new[] { "Category" });
        }
    }
}
