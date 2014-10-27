using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ShipEquipment.Core.BaseObjects;
using ShipEquipment.Core.Configurations;
using ShipEquipment.Core.Models;
using ShipEquipment.Core.Utility;

namespace ShipEquipment.Core.Extensions
{
    public static class HtmlExtensions
    {
        public static SiteControl Controls(this HtmlHelper html)
        {
            SiteControl.Instance.SetHtmlHelper(html);
            return SiteControl.Instance;
        }

        public static SiteUrls SiteUrls(this HtmlHelper html)
        {
            return ShipEquipment.Core.SiteUrls.Instance;
        }
    }
}
