﻿using ShipEquipment.Biz.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShipEquipment.Web.Models
{
    public class MyCart
    {
        public MyCart(Product pro)
        {
            ProductId = pro.Id.ToString();
            Name = pro.Name;
            Code = pro.Code;
            Photo = pro.GetPhoto() != null ? pro.GetPhoto().FileName : "";
            Alias = pro.Alias;
            Price = pro.SalePrice > 0 ? pro.SalePrice : pro.Price;
        }

        public string ProductId { get; set; }

        public string Name { get; set; }

        public string Code { get; set; }

        public string Photo { get; set; }

        public string Alias { get; set; }

        public double Price { get; set; }

        public int Quatity { get; set; }

        public double Sum { get { return Price * Quatity; } }
    }
}