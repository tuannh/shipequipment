using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class NewsCategory
    {
        public NewsCategory()
        {
            DisplayOrder = 1000;
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string Alias { get; set; }

        public int DisplayOrder { get; set; }
    }
}
