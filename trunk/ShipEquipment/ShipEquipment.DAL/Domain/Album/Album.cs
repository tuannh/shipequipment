using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class Album
    {
        public Album()
        {
            DisplayOrder = 1000;
            CreatedDate = DateTime.Now;
            Photos = new List<Photo>();
        }

        public int Id { get; set; }

        [Required(ErrorMessage = "Tên album không thể rỗng")]
        [Display(Name = "Tên album")]
        [StringLength(150, ErrorMessage = "Tên album không được quá 150 kí tự")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Alias không thể rỗng")]
        [Display(Name = "Alias")]
        [StringLength(150, ErrorMessage = "Alias không được quá 150 kí tự")]
        public string Alias { get; set; }

        [Required(ErrorMessage = "Số thứ tự phải là một số dương")]
        [Range(1, 9999, ErrorMessage = "Số thứ tự nằm trong khoảng [1, 9999]")]
        [RegularExpression(@"^[0-9]{0,9}$", ErrorMessage = "Số thứ tự phải một số dương")]
        [Display(Name = "Thứ tự hiển thị")]
        public int DisplayOrder { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime CreatedDate { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        public virtual ICollection<Photo> Photos { get; set; }

        public Photo GetPhoto()
        {
            var photo = Photos.FirstOrDefault();
            if (photo == null)
                photo = new Photo();

            return photo;
        }
    }
}
