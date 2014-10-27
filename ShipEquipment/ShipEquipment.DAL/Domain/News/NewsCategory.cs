using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class NewsCategory
    {
        public int Id { get; set; }

        public string Alias { get; set; }

        [Required(ErrorMessage = "Tên không thể rỗng")]
        public string Name { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Description { get; set; }

        public int Order { get; set; }
    }
}
