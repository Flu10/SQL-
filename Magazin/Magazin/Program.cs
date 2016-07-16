using Magazin.MagazinContext;
using Magazin.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazin
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new MarketContext())
            {
                #region Read
                /*
                 * Returnam numele produselor 
                 *  Detinute de producatorul  "Vel Pitar"
                 */
                var producerID = context.Producer.FirstOrDefault(x => x.ProducerName == "Vel Pitar").ProducerId;
                var listNrProduct = context.Stock.Where(x => x.ProducerId == producerID).ToList();

                List<string> Products = new List<string>();

                foreach (var prod in listNrProduct)
                {
                    var numeprod = context.Product.Where(x => x.ProductId == prod.ProductId).FirstOrDefault().ProductName;
                    Products.Add(numeprod);
                }

                foreach (var p in Products)
                {
                    Console.WriteLine(p);
                }
                #endregion
                #region Update
                ///Modificam pretul produselor cu numele "Bere".
                var pretModificat = context.Product.Where(x => x.ProductName == "Bere").ToList();
                foreach (var p in pretModificat)
                {
                    p.Price = 7;
                    context.Product.AddOrUpdate(p);
                }

                context.SaveChanges();
                #endregion
                #region Delete
                ///Stergem produsele care sunt expirate

                DateTime dateTime = DateTime.Today;
                DateTime datex = new DateTime(dateTime.Year, dateTime.Month, dateTime.Day + 2);

                var expirationProdusDelete = context.Product.Where(x => x.ExpirationDate < dateTime).ToList();
                context.Product.RemoveRange(expirationProdusDelete);
                context.SaveChanges();
                #endregion
                #region Procedura Stocata
                ///Procedura imi scade pretul produselor care mai au maxim  
                ///2 zile de valabilitate cu 50% .
                var expirationDate = context.Product.Where(x => x.ExpirationDate <= datex).ToList();
                if (expirationDate != null)
                {
                    foreach (var expdate in expirationDate)
                    {
                        Console.WriteLine ("ID-produs :{0}",expdate.ProductId);
                        var reduceProductId = new SqlParameter("@reduceProductId", expdate.ProductId);
                        context.Database.Connection.Close();
                        context.Database.Connection.Open();

                        var mada= context.Database.SqlQuery<Product>("exec [Mkt].[ChangePrice] @reduceProductId", reduceProductId);
                        mada.ToList();
                    }

                    #endregion


                    Console.ReadKey();
                }
            }
        }
    }
}
