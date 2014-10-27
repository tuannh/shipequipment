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

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class UserGuideController : Controller
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/UserGuide/
        public ActionResult Index()
        {
            return View(db.UserGuides.ToList());
        }

        // GET: /Admin/UserGuide/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGuide userguide = db.UserGuides.Find(id);
            if (userguide == null)
            {
                return HttpNotFound();
            }
            return View(userguide);
        }

        // GET: /Admin/UserGuide/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/UserGuide/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Name,Content")] UserGuide userguide)
        {
            if (ModelState.IsValid)
            {
                db.UserGuides.Add(userguide);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userguide);
        }

        // GET: /Admin/UserGuide/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGuide userguide = db.UserGuides.Find(id);
            if (userguide == null)
            {
                return HttpNotFound();
            }
            return View(userguide);
        }

        // POST: /Admin/UserGuide/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Name,Content")] UserGuide userguide)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userguide).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userguide);
        }

        // GET: /Admin/UserGuide/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGuide userguide = db.UserGuides.Find(id);
            if (userguide == null)
            {
                return HttpNotFound();
            }
            return View(userguide);
        }

        // POST: /Admin/UserGuide/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserGuide userguide = db.UserGuides.Find(id);
            db.UserGuides.Remove(userguide);
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
