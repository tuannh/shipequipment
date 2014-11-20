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
                    var rowId = string.Format("#tr{0}", cart.ProductId);
                    lst.Remove(cart);

                    return Json(new { error = 0, message = msg, rowid = rowId });
                }
            }

            return Json(new { error = 1, message = "Sản phẩm không tồn tại trong giỏ hàng", rowid = "" }); ;
        }

        [HttpPost]
        [ActionName("update")]
        public IHttpActionResult Update()
        {
            var id = SiteContext.Current.Context.Request.Form["id"] ?? "0";
            var strQuatity = SiteContext.Current.Context.Request.Form["quatity"] ?? "0";

            var quatity = 0;
            int.TryParse(strQuatity, out quatity);


            var session = SiteContext.Current.Context.Session;
            var lst = session["Cart"] as List<MyCart>;
            var msg = "";
            var rowid = "";

            if (lst != null)
            {
                var item = lst.FirstOrDefault(a => a.ProductId == id);
                if (item != null)
                {
                    item.Quatity = quatity;

                    var total = item.Price * quatity;
                    var sum = lst.Sum(a => a.Price * a.Quatity);
                    var qty = lst.Sum(a => a.Quatity);

                    return Json(new { error = 0, message = "success", rowid = string.Format("#tr{0}", id), total = total.ToString("N0"), sum = sum.ToString("N0"), quatity = qty.ToString("N0") });
                }
            }

            return Json(new { error = 0, message = "Sản phẩn không tồn tại trong giỏ hàng" });
        }


    }
}
