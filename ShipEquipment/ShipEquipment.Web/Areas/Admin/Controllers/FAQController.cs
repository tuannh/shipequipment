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
using ShipEquipment.Core.Models;
using ShipEquipment.Core.Controllers;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class FAQController : AdminController
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/FAQ/
        public ActionResult Index(string kw)
        {
            List<FAQ> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower().Trim();
                lst = db.FAQs.ToList();
                lst = lst.Where(a => a.Question.ToLower().Contains(keyword) || (a.Answer ?? "").ToLower().Contains(keyword))
                         .OrderBy(a => a.DisplayOrder)
                         .ThenBy(a => a.Question)
                         .ToList();

                if (lst.Count > 0)
                    ViewBag.SearchReseult = string.Format("<b>{0}</b> kết quả được tìm thấy", lst.Count);
                else
                    ViewBag.SearchReseult = string.Format("Không tìm thấy kết quả với từ khóa <b>{0}</b>", kw);
            }
            else
            {
                lst = db.FAQs.OrderBy(a => a.DisplayOrder).ThenBy(a => a.Question).ToList();
            }

            var pagingModel = new PagingModel();
            pagingModel.ItemsPerPage = PageSize;
            pagingModel.CurrentPage = PageIndex;
            pagingModel.TotalItems = lst.Count();
            pagingModel.RequestUrl = ControllerContext.RequestContext.HttpContext.Request.RawUrl;

            lst = lst.Skip((PageIndex - 1) * PageSize).Take(PageSize).ToList();

            ViewBag.PagingModel = pagingModel;
            ViewBag.Keyword = kw;

            return View(lst);
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
            // ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question");
            return View(new FAQ());
        }

        // POST: /Admin/FAQ/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Question,Answer,Active,DisplayOrder")] FAQ faq)
        {
            if (ModelState.IsValid)
            {
                db.FAQs.Add(faq);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            // ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question", faq.ParentId);
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
            // ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question", faq.ParentId);
            return View(faq);
        }

        // POST: /Admin/FAQ/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Question,Answer,Active,DisplayOrder")] FAQ faq)
        {
            if (ModelState.IsValid)
            {
                db.Entry(faq).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            // ViewBag.ParentId = new SelectList(db.FAQs, "Id", "Question", faq.ParentId);
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
            // return View(faq);

            db.FAQs.Remove(faq);
            db.SaveChanges();
            return RedirectToAction("Index");
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
