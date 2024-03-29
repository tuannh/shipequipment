﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class ProductOrder
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public int Quatity { get; set; }

        public float Price { get; set; }

        public virtual Product Product { get; set; }

        public virtual Order Order { get; set; }
    }
}
