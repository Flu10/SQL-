using Magazin.Model;
using Magazin.Model.Nomenclatures;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazin.MagazinContext
{
    class MarketContext:DbContext
    {
        public DbSet<Product> Product { get; set; }

        public DbSet<Producer> Producer { get; set; }

        public DbSet<Stock> Stock { get; set; }
        public DbSet<ProductCategory> ProductCategory { get; set; }



        public MarketContext() : base("Mrk")
        {
            Configuration.LazyLoadingEnabled = true;
            Configuration.ProxyCreationEnabled = true;
        }
        
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
            modelBuilder.Conventions.Remove<ManyToManyCascadeDeleteConvention>();


            ApplyCustomConventions(modelBuilder);

        }
        private void ApplyCustomConventions(DbModelBuilder modelBuilder)
        {
            modelBuilder.Properties<decimal>().Configure(c => c.HasPrecision(10, 2));
            modelBuilder.Properties<string>().Configure(x => x.HasMaxLength(150));
        }
    }
}

