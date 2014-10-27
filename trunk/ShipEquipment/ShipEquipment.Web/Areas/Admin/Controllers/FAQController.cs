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
    public class FAQController : Controller
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/FAQ/
        public ActionResult Index()
        {
            var faqs = db.FAQs.Include(f => f.Parent);
            return View(faqs.ToList());
        }

        // GET: /Admin/FAQ/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FAQ faq = db.FAQs.Find(id);
            if (faq == null)
            {
                return HttpNotFound();
            }
            return View(faq);
        }

        // GET: /Admin/FAQ/Create
        public ActionResult Create()
        {
            ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question");
            return View();
        }

        // POST: /Admin/FAQ/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Question,Answer,ParentId")] FAQ faq)
        {
            if (ModelState.IsValid)
            {
                db.FAQs.Add(faq);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question", faq.ParentId);
            return View(faq);
        }

        // GET: /Admin/FAQ/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FAQ faq = db.FAQs.Find(id);
            if (faq == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question", faq.ParentId);
            return View(faq);
        }

        // POST: /Admin/FAQ/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Question,Answer,ParentId")] FAQ faq)
        {
            if (ModelState.IsValid)
            {
                db.Entry(faq).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question", faq.ParentId);
            return View(faq);
        }

        // GET: /Admin/FAQ/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FAQ faq = db.FAQs.Find(id);
            if (faq == null)
            {
                return HttpNotFound();
            }
            return View(faq);
        }

        // POST: /Admin/FAQ/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FAQ faq = db.FAQs.Find(id);
            db.FAQs.Remove(faq);
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
