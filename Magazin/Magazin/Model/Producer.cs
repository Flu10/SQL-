using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazin.Model
{
    [Table("Producer", Schema = "Mkt")]
   public class Producer
    {
        [Key]
        [Index("ProducatorIndex",IsUnique=true)]
        public virtual int ProducerId { get; set; }

        [Required]
        [MaxLength(30)]
        public virtual string ProducerName { get; set; }

    }
}
