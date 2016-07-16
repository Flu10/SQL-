namespace Magazin.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FourthMigration : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("Mkt.Product", "Category", "Nom.ProductCategory");
            DropForeignKey("Mkt.Stock", "ProductId", "Mkt.Product");
            DropForeignKey("Mkt.Stock", "ProducerId", "Mkt.Producer");
            AddForeignKey("Mkt.Product", "Category", "Nom.ProductCategory", "CategoryId", cascadeDelete: true);
            AddForeignKey("Mkt.Stock", "ProductId", "Mkt.Product", "ProductId", cascadeDelete: true);
            AddForeignKey("Mkt.Stock", "ProducerId", "Mkt.Producer", "ProducerId", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("Mkt.Stock", "ProducerId", "Mkt.Producer");
            DropForeignKey("Mkt.Stock", "ProductId", "Mkt.Product");
            DropForeignKey("Mkt.Product", "Category", "Nom.ProductCategory");
            AddForeignKey("Mkt.Stock", "ProducerId", "Mkt.Producer", "ProducerId");
            AddForeignKey("Mkt.Stock", "ProductId", "Mkt.Product", "ProductId");
            AddForeignKey("Mkt.Product", "Category", "Nom.ProductCategory", "CategoryId");
        }
    }
}
