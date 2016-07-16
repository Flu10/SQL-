using Magazin.Model.Nomenclatures;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazin.Model
{
    [Table("Product", Schema = "Mkt")]
    public class Product
    {
        [Key]
        public virtual int  ProductId { get; set; }

        [Required]
        [MaxLength(30)]
        public virtual string ProductName { get; set; }

        [Required]
        public virtual int Category { get; set; }
        [ForeignKey("Category")]
        public virtual  ProductCategory ProductCategory { get; set; }
        [Required]
      //  [Index("ExpirationDateIndex")]
        public virtual DateTime ExpirationDate { get; set; }

        [Required]
        public virtual decimal Price { get; set; }

        [InverseProperty("Product")]
        public virtual ICollection<Stock> Stock { get; set; }

        [NotMapped]
        public string ProductPrice { get { return $"{ProductName}:{Price}"; } }
    }
}
