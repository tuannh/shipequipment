using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShipEquipment.Core.Extensions;
using ShipEquipment.Biz.DAL;
using ShipEquipment.Biz.Domain;
using ShipEquipment.Core.Controllers;
using ShipEquipment.Core.Enumerations;
using ShipEquipment.Web.Models;

namespace ShipEquipment.Web.Controllers
{
    public class HomeController : FrontController
    {
        ShipEquipmentContext db = new ShipEquipmentContext();

        public ActionResult Index()
        {
            var alias = ControllerContext.RouteData.Values["frontendpage"] != null ? ControllerContext.RouteData.Values["frontendpage"].ToString() : "index";
            var page = db.Pages
                                .Where(p => string.Compare(p.Alias, alias, true) == 0)
                                .FirstOrDefault();

            ViewBag.PageAlias = alias;


            if (page != null)
                return View(page);

            if (alias == "index")
            {
                page = db.Pages.Where(p => p.IsDefault)
                                      .FirstOrDefault();

                if (page != null)
                    return View(page);
            }

            return View();
        }

        public ActionResult PageContent()
        {
            var dbContext = new ShipEquipmentContext();
            var alias = ControllerContext.RouteData.Values["frontendpage"].ToString() ?? "index";
            var page = dbContext.Pages
                                .Where(p => string.Compare(p.Alias, alias, true) == 0)
                                .FirstOrDefault();

            ViewBag.PageAlias = alias;


            if (page != null)
            {
                var pageType = PageType.None;
                Enum.TryParse<PageType>(page.UniqueKey, true, out pageType);
                ViewBag.PageType = pageType;

                if (pageType == PageType.Order)
                {
                    var provinces = db.Provinces.Select(a => new SelectListItem() { Value = a.Id.ToString(), Text = a.Name }).ToList();
                    provinces.Insert(0, new SelectListItem() { Value = "0", Text = "Chọn tỉnh/thành phố" });

                    ViewData["Order"] = new Order();
                    ViewData["Provinces"] = provinces;
                }

                return View(page);
            }

            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Order([Bind(Include = "CustomerName,Phone,Email,Address,DistrictId,ProviceId,Note")] Order order)
        {
            if (ModelState.IsValid)
            {
                order.ProviceId = order.ProviceId == 0 ? null : order.ProviceId;
                order.DistrictId = order.DistrictId == 0 ? null : order.DistrictId;

                order.OrderDate = DateTime.Now;

                var cartList = Session[MyCart.ShopCart] as List<MyCart>;
                if (cartList != null && cartList.Count > 0)
                {
                    foreach(var cart in cartList)
                    {
                        var productOrder = new ProductOrder()
                        {
                            ProductId = int.Parse(cart.ProductId),
                            Quatity = cart.Quatity,
                            Price = cart.Price                            
                        };

                        order.ProductOrders.Add(productOrder);
                    }

                    db.Orders.Add(order);
                    db.SaveChanges();

                    Session[MyCart.ShopCart] = null;

                    return Redirect("/san-pham/?status=1");
                }
            }

            return Redirect("/san-pham/?status=0");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
