using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShipEquipment.Biz.Domain
{
    public class Photo
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string FileName { get; set; }

        public int AlbumId { get; set; }

        public virtual Album Album { get; set; }
    }
}
