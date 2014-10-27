using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShipEquipment.Biz.Domain;
using ShipEquipment.Biz.DAL;
using ShipEquipment.Core;
using System.IO;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class BannerController : Controller
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/Banner/
        public ActionResult Index()
        {
            return View(db.Banners.ToList());
        }

        // GET: /Admin/Banner/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // GET: /Admin/Banner/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/Banner/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,Order,FileName,Active,Target")] Banner banner, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {

                db.Banners.Add(banner);
                db.SaveChanges();

                if (file != null)
                {
                    var folder = "~/Userfiles/Upload/images/Modules/BannerRotators/";
                    var folerPath = Globals.MapPath(folder);

                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    // delete old banner file
                    var path = string.Format("{0}{1}", folerPath, banner.FileName);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", banner.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);

                    file.SaveAs(path);

                    banner.FileName = filename;
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }

            return View(banner);
        }

        // GET: /Admin/Banner/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // POST: /Admin/Banner/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,Order,FileName,Active,Target")] Banner banner, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.Entry(banner).State = EntityState.Modified;
                db.SaveChanges();

                if (file != null)
                {
                    var folder = "~/Userfiles/Upload/images/Modules/BannerRotators/";
                    var folerPath = Globals.MapPath(folder);

                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    var filename = string.Format("{0}-{1}", banner.Id, file.FileName);
                    var path = string.Format("{0}{1}", folerPath, filename);

                    file.SaveAs(path);

                    banner.FileName = filename;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            return View(banner);
        }

        // GET: /Admin/Banner/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // POST: /Admin/Banner/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Banner banner = db.Banners.Find(id);
            db.Banners.Remove(banner);
            db.SaveChanges();
            return RedirectToAction("Index");
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
