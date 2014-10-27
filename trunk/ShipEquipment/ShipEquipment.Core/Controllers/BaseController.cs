using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace ShipEquipment.Core.Controllers
{
    public class BaseController : Controller
    {
        public SiteContext SiteContext
        {
            get
            {
                return SiteContext.Current;
            }
        }
    }
}
