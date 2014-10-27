
using ShipEquipment.Biz.DAL;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShipEquipment.Biz.Domain
{
    public class Category
    {
        public Category()
        {
            DisplayOrder = 1000;
            Active = true;
        }

        public int Id { get; set; }

        [Display(Name = "Alias(tên hiển thị trên trình duyệt)")]
        [Required(ErrorMessage = "Alias không thể rỗng")]
        public string Alias { get; set; }

        [Required(ErrorMessage = "Tên danh mục không thể rỗng")]
        [Display(Name = "Tên danh mục")]
        public string Name { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        [Display(Name = "Hiển thị")]
        public bool Active { get; set; }

        [Display(Name = "Danh mục cha")]
        public int? ParentId { get; set; }

        [Range(0, 9999, ErrorMessage = "Thứ tự hiển thị là 1 số trong khoảng [0, 9999]")]
        [RegularExpression(@"^[0-9]{0,4}$", ErrorMessage = "Thứ tự hiển thị là 1 số trong khoảng [0, 9999]")]
        public int DisplayOrder { get; set; }

        public virtual Category Parent { get; set; }

        public IEnumerable<Category> GetSubCategory()
        {
            var db = new ShipEquipmentContext();
            var lst = db.Categories
                        .Where(p => p.Parent != null && p.Parent.Id == this.Id && p.Active)
                        .OrderBy(p => p.DisplayOrder)
                        .ThenBy(p => p.Name)
                        .ToList();

            return lst;
        }

        public bool IsValidAlias()
        {
            var db = new ShipEquipmentContext();
            var cate = db.Categories.SingleOrDefault(a => string.Compare(a.Alias, this.Alias, true) == 0);

            // add new
            if (Id == 0)
                return cate == null;

            // update 
            return cate == null || cate.Id != Id;
        }

        public bool IsValidName()
        {
            var db = new ShipEquipmentContext();
            var cate = db.Categories.SingleOrDefault(a => string.Compare(a.Name, this.Name, true) == 0);

            // add new
            if (this.Id == 0)
                return cate == null;

            // update 
            return cate == null || cate.Id != this.Id;
        }

    }
}
