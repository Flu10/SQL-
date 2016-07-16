using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazin.Model.Nomenclatures
{
    [Table("ProductCategory", Schema = "Nom")]
   public class ProductCategory
    {
        [Key]
        public virtual int CategoryId { get; set; }
        public virtual string CategoryName { get; set; }
    }
}
