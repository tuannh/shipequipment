using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class Content
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Alias không thể rỗng")]
        public string Alias { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Value { get; set; }

        public string Page { get; set; }
    }
}
