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
        public FAQ()
        {
            DisplayOrder = 1000;
            Active = true;
        }

        public int Id { get; set; }

        [StringLength(1000, ErrorMessage = "Câu hỏi không được quá 1000 kí tự")]
        [Required(ErrorMessage = "Câu hỏi không thể rỗng")]
        [Display(Name = "Câu hỏi")]
        public string Question { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Trả lời")]
        public string Answer { get; set; }

        [Display(Name = "Câu hỏi cha")]
        public int? ParentId { get; set; }

        public virtual FAQ Parent { get; set; }

        [Display(Name = "Hiển thị")]
        public bool Active { get; set; }

        [Range(0, 9999, ErrorMessage = "Thứ tự hiển thị là 1 số trong khoảng [0, 9999]")]
        [RegularExpression(@"^[0-9]{0,4}$", ErrorMessage = "Thứ tự hiển thị là 1 số trong khoảng [0, 9999]")]
        [Display(Name = "Thứ tự hiển thị")]
        public int DisplayOrder { get; set; }

    }
}
