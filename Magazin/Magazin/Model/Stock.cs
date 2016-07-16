using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazin.Model
{
    [Table("Stock", Schema = "Mkt")]
  public  class Stock
    {   [Key]
        public virtual int StockId { get; set; }
        [Required]

        [Index("MX_ProductProducer", 1, IsUnique = true)]
        public virtual int  ProductId { get; set; }
        [Required]
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }

        [Index("MX_ProductProducer", 2, IsUnique = true)]
        public virtual int ProducerId { get; set; }
        [ForeignKey("ProducerId")]
        public virtual Producer Producer { get; set; }
        [Required]
        public virtual int NumberProduct { get; set; }
    }
}
