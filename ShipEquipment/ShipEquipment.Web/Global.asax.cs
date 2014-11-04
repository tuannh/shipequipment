using ShipEquipment.Biz.DAL;
using ShipEquipment.Core.Configurations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using WebApp;

namespace ShipEquipment.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            var dbContext = new ShipEquipmentContext();

#if  DEBUG
            dbContext.Initialize();
#endif

            SiteConfiguration.GetConfig();

            MvcHandler.DisableMvcResponseHeader = true;
            AreaRegistration.RegisterAllAreas();

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleTable.Bundles.RegisterConfigurationBundles();
            // BundleConfig.RegisterBundles(BundleTable.Bundles);

            // force using Razor view engine with cshtml extension.
            ViewEngines.Engines.Clear();
            var razorEngine = new RazorViewEngine() { FileExtensions = new string[] { "cshtml" } };
            ViewEngines.Engines.Add(razorEngine);
        }
    }
}
