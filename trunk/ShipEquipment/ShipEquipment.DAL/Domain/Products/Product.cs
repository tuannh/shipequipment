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

        public string Alias { get; set; }

        public string Name { get; set; }

        public string Code { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string ShortDescription { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Description { get; set; }

        public bool Active { get; set; }

        public float Price { get; set; }

        public float SalePrice { get; set; }

        public string MadeIn { get; set; }

        public string DislayOrder { get; set; }

        public int CategoryId { get; set; }

        public int BrandId { get; set; }

        public virtual Brand Brand { get; set; }

        public virtual Category Category { get; set; }
    }
}
