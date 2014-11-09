using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShipEquipment.Core.Extensions;
using ShipEquipment.Biz.DAL;
using ShipEquipment.Biz.Domain;
using ShipEquipment.Core.Controllers;

namespace ShipEquipment.Web.Controllers
{
    public class HomeController : FrontController
    {
        public ActionResult Index()
        {
            var dbContext = new ShipEquipmentContext();
            var alias = ControllerContext.RouteData.Values["frontendpage"].ToString() ?? "index";
            var page = dbContext.Pages
                                .Where(p => string.Compare(p.Alias, alias, true) == 0)
                                .FirstOrDefault();

            ViewBag.PageAlias = alias;


            if (page != null)
                return View(page);

            if (alias == "index")
            {
                page = dbContext.Pages.Where(p => p.IsDefault)
                                      .FirstOrDefault();

                if (page != null)
                    return View(page);
            }

            return View();
        }
    }
}
