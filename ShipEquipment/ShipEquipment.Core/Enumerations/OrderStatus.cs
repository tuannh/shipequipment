using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Core.Enumerations
{
    public enum OrderStatus : int
    {
        None = 0,
        New = 1,
        Confirm = 3,
        Delivery = 4,
        Cancel = 5
    }
}
