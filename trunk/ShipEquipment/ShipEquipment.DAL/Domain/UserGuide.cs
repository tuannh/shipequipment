using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class UserGuide
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Tiêu đề không thể rỗng")]
        public string Name { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Content { get; set; }
    }
}
