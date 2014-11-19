using ShipEquipment.Biz.DAL;
using ShipEquipment.Core;
using ShipEquipment.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ShipEquipment.Web.Controllers
{
    public class CartController : ApiController
    {
        // POST: api/Cart
        [HttpPost]
        [ActionName("add")]
        public IHttpActionResult Add([FromBody]string productId)
        {
            var session = SiteContext.Current.Context.Session;
            var lst = session["Cart"] as List<MyCart>;
            var msg = "";
            var total = 0;

            if (lst == null)
            {
                lst = new List<MyCart>();
                session["Cart"] = lst;
            }

            var cart = lst.FirstOrDefault(a => a.ProductId == productId);
            if (cart == null)
            {
                var db = new ShipEquipmentContext();
                var id = int.Parse(productId);

                var product = db.Products.Find(id);
                if (product != null)
                {
                    cart = new MyCart(product);
                    lst.Add(cart);
                }
            }

            cart.Quatity++;
            total = lst.Sum(a => a.Quatity);

            return Json(new { error = 0, message = msg, total = total }); ;
        }

        [HttpPost]
        [ActionName("remove")]
        public IHttpActionResult Remove([FromBody]string productId)
        {
            var session = SiteContext.Current.Context.Session;
            var lst = session["Cart"] as List<MyCart>;
            var msg = "Xóa sản phảm ra khỏi giỏ hàng thành công";

            if (lst != null)
            {
                var cart = lst.FirstOrDefault(a => a.ProductId == productId);
                if (cart != null)
                {
                    lst.Remove(cart);
                    return Json(new { error = 0, message = msg, total = lst.Count() }); ;
                }
            }

            msg = "Sản phẩm không tồn tại trong giỏ hàng";
            return Json(new { error = 0, message = msg, total = 0 }); ;
        }

    }
}
