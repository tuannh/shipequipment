using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class NewsArticle
    {
        public int Id { get; set; }

        public string Alias { get; set; }

        [Required(ErrorMessage = "Tiêu đề không thể rỗng")]
        public string Title { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Summary { get; set; }

        [MaxLength, Column(TypeName = "ntext")]
        public string Content { get; set; }

        public bool Active { get; set; }

        public int? CategoryId { get; set; }

        public NewsCategory Category {get;set;}

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }
    }
}
