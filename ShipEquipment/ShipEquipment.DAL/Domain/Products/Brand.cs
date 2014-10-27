
using System;
using System.Collections;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShipEquipment.Biz.Domain
{
    public class Brand
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Tên không thể rỗng")]
        public string Name { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Description { get; set; }

        public bool Active { get; set; }

        public int DisplayOrder { get; set; }
    }
}
