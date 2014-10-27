using ShipEquipment.Core.Web.Mvc.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ShipEquipment.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.RouteExistingFiles = true;

            // new in mvc5
            routes.MapMvcAttributeRoutes();

            RouteTableRegister.RegisterRoutes(routes);

          //  routes.MapRoute(
          //    name: "FrontEnd_DefaultPage",
          //    url: "{frontendpage}",
          //    defaults: new { controller = "Home", action = "Index", frontendpage = "index", id = UrlParameter.Optional }
          //);

            //routes.MapRoute(
            //    name: "Default",
            //    url: "{controller}/{action}/{id}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //);
        }
    }
}
