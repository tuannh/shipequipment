using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class District
    {
        public int Id { get; set; }

        public int Name { get; set; }

        public int Order { get; set; }

        public int? ProvinceId { get; set; }

        public Province Province { get; set; }
    }
}
