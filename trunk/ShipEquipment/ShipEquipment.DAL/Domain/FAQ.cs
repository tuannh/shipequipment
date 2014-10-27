using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class FAQ
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Câu hỏi không thể rỗng")]
        public string Question { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Answer { get; set; }

        public int? ParentId { get; set; }

        public virtual FAQ Parent { get; set; }
    }
}
