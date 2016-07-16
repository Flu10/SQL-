namespace Magazin.Migrations
{
    using MagazinContext;
    using Model.Nomenclatures;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Magazin.MagazinContext.MarketContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(Magazin.MagazinContext.MarketContext context)
        {
            populateProductCategoryEnum(context);
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
        }
        private void populateProductCategoryEnum(MarketContext context)
        {
            var ProductCategoryList = new List<ProductCategory>
            {
                new ProductCategory { CategoryId =1, CategoryName ="Bautura" },
                new ProductCategory { CategoryId =2, CategoryName ="Racoritoare" },
                new ProductCategory { CategoryId =3, CategoryName ="Alimente" },
                new ProductCategory { CategoryId =4, CategoryName ="Dulciuri" },
                new ProductCategory { CategoryId =5, CategoryName ="Utile" }
            };

            foreach (var ProductCategory in ProductCategoryList)
            {
                context.ProductCategory.AddOrUpdate(p => p.CategoryName, ProductCategory);


            }
        }
    }
}
