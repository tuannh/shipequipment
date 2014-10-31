using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class Product
    {
        public int Id { get; set; }

        [Display(Name = "Alias(tên hiển thị trên trình duyệt)")]
        [Required(ErrorMessage = "Alias không thể rỗng")]
        public string Alias { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không thể rỗng")]
        [Display(Name = "Tên sản phẩm")]
        public string Name { get; set; }

        [Display(Name = "Mã sản phẩm")]
        public string Code { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả ngắn")]
        public string ShortDescription { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả đầy đủ")]
        public string Description { get; set; }

        [Display(Name = "Hiển thị")]
        public bool Active { get; set; }

        [Display(Name = "Giá sản phẩm")]
        [Range(0, float.MaxValue, ErrorMessage = "Hãy nhập giá sản phẩm")]
        [RegularExpression(@"^[0-9]{1,9}$", ErrorMessage = "Giá là một số dương")]
        public float Price { get; set; }

        [Display(Name = "Giá khuyến mãi")]
        [Range(0, float.MaxValue, ErrorMessage = "Hãy nhập giá khuyến mãi")]
        [RegularExpression(@"^[0-9]{1,9}$", ErrorMessage = "Giá là một số dương")]
        public float SalePrice { get; set; }

        [Display(Name = "Nơi sản xuất")]
        public string MadeIn { get; set; }

        [Display(Name = "Thứ tự hiển thị")]
        public string DislayOrder { get; set; }

        [Display(Name = "Loại sản phẩm")]
        public int CategoryId { get; set; }

        [Display(Name = "Nhãn hiệu")]
        public int BrandId { get; set; }

        public virtual Brand Brand { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<ProductPhoto> Photos { get; set; } 
    }
}
