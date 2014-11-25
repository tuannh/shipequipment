using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class Video
    {
        public Video()
        {
            Active = true;
            DisplayOrder = 1000;
        }

        public int Id { get; set; }

        [Display(Name = "Alias")]
        [Required(ErrorMessage = "Alias không thể rỗng")]
        [StringLength(150, ErrorMessage = "Alias không được quá 150 kí tự")]
        public string Alias { get; set; }

        [StringLength(150, ErrorMessage = "Tên video không được quá 150")]
        [Required(ErrorMessage = "Tên video không thể rỗng")]
        [Display(Name = "Tên video")]
        public string Name { get; set; }

        [StringLength(50, ErrorMessage = "Video id không được quá 50")]
        [Display(Name = "Video id")]
        public string VideoId { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        [Display(Name = "Hiển thị")]
        public bool Active { get; set; }

        [Range(0, 9999, ErrorMessage = "Thứ tự hiển thị là 1 số trong khoảng [0, 9999]")]
        [RegularExpression(@"^[0-9]{0,4}$", ErrorMessage = "Thứ tự hiển thị là 1 số trong khoảng [0, 9999]")]
        [Display(Name = "Thứ tự hiển thị")]
        public int DisplayOrder { get; set; }

        [Display(Name = "Link video")]
        public string Url { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }
    }
}
