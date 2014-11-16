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
        public Product()
        {
            Active = true;
            DislayOrder = 1000;
            Photos = new List<ProductPhoto>();
        }

        public int Id { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không thể rỗng")]
        [Display(Name = "Tên sản phẩm")]
        [StringLength(150, ErrorMessage = "Tên sản phẩm không được quá 150 kí tự")]
        public string Name { get; set; }

        [Display(Name = "Alias")]
        [Required(ErrorMessage = "Alias không thể rỗng")]
        [StringLength(150, ErrorMessage = "Alias không được quá 150 kí tự")]
        public string Alias { get; set; }

        [Display(Name = "Mã sản phẩm")]
        [StringLength(50, ErrorMessage = "Mã sản phẩm không được quá 50 kí tự")]
        public string Code { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả ngắn")]
        public string ShortDescription { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả đầy đủ")]
        public string Description { get; set; }

        [Display(Name = "Hiển thị")]
        public bool Active { get; set; }

        [Display(Name = "Giá")]
        [Range(0, float.MaxValue, ErrorMessage = "Hãy nhập giá sản phẩm")]
        [RegularExpression(@"^[0-9]{1,9}$", ErrorMessage = "Giá là một số dương")]
        public float Price { get; set; }

        [Display(Name = "Giá khuyến mãi")]
        [Range(0, float.MaxValue, ErrorMessage = "Hãy nhập giá khuyến mãi")]
        [RegularExpression(@"^[0-9]{1,9}$", ErrorMessage = "Giá là một số dương")]
        public float SalePrice { get; set; }

        [Display(Name = "Nơi sản xuất")]
        [StringLength(100, ErrorMessage = "Nơi sản xuất không được quá 100 kí tự")]
        public string MadeIn { get; set; }

        [Display(Name = "Thứ tự hiển thị")]
        [Range(1, 9999, ErrorMessage = "Số thứ tự nằm trong khoảng [1, 9999]")]
        [RegularExpression(@"^[0-9]{0,9}$", ErrorMessage = "Số thứ tự phải một số dương")]
        public int DislayOrder { get; set; }

        [Display(Name = "Loại danh mục")]
        [Required(ErrorMessage = "Chưa chọn loại danh mục")]
        public int CategoryId { get; set; }

        [Display(Name = "Nhãn hiệu")]
        [Required(ErrorMessage = "Chưa chọn nhãn hiệu")]
        public int BrandId { get; set; }

        [Display(Name = "Loại sản phẩm")]
        [Required(ErrorMessage = "Chưa chọn loại sản phẩm")]
        public int Type { get; set; }

        public virtual Brand Brand { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<ProductPhoto> Photos { get; set; }

        public virtual ProductPhoto GetPhoto()
        {
            return Photos.FirstOrDefault();
        }

        public virtual string GetPrice()
        {
            return string.Format("{0:N0} VND", Price);
        }

        public virtual string GetSalePrice()
        {
            return string.Format("{0:N0} VND", SalePrice);
        }
    }
}
