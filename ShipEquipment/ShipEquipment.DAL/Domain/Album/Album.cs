using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        }

        public int Id { get; set; }

        [Required(ErrorMessage = "Tên album không thể rỗng")]
        [Display(Name = "Tên album")]
        [StringLength(150, ErrorMessage = "Tên album không được quá 150 kí tự")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Alias không thể rỗng")]
        [Display(Name = "Alias")]
        [StringLength(150, ErrorMessage = "Tên album không được quá 150 kí tự")]
        public string Alias { get; set; }

        [Required(ErrorMessage = "Alias không thể rỗng")]
        [Display(Name = "Alias")]
        [StringLength(150, ErrorMessage = "Tên album không được quá 150 kí tự")]
        public int DisplayOrder { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime CreatedDate { get; set; }

        public ICollection<Photo> Photos { get; set; }
    }
}
