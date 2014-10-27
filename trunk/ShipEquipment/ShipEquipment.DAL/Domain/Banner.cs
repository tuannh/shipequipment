using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class Banner
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Tiêu đề không thể rỗng")]
        public string Name { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Số thứ tự phải là một số dương")]
        [Range(1, 9999, ErrorMessage = "Số thứ tự nằm trong khoảng [1, 9999]")]
        [RegularExpression(@"^[0-9]{0,9}$", ErrorMessage = "Số thứ tự phải một số dương")]
        public int Order { get; set; }

        public string FileName { get; set; }

        public bool Active { get; set; }

        public string Target { get; set; }

        public string Url { get; set; }
    }
}
