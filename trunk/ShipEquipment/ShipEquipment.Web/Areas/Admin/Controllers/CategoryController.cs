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
    public class CategoryController : AdminController
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/Category/
        public ActionResult Index(string kw)
        {
            List<Category> lst = null;


            if (!string.IsNullOrEmpty(kw))
            {
                lst = db.Categories.Where(a => (a.Name ?? "").ToLower().Contains(kw)).ToList();
            }
            else
            {
                lst = db.Categories.ToList();
            }

            var pagingModel = new PagingModel();
            pagingModel.ItemsPerPage = PageSize;
            pagingModel.CurrentPage = PageIndex;
            pagingModel.TotalItems = lst.Count();
            pagingModel.RequestUrl = ControllerContext.RequestContext.HttpContext.Request.RawUrl;

            ViewBag.PagingModel = pagingModel;
            ViewBag.Keyword = kw;

            return View(lst);
        }

        // GET: /Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: /Admin/Category/Create
        public ActionResult Create()
        {
            // ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name");
            ViewBag.SelectCategory = SelectCategoryList();

            return View(new Category());
        }

        // POST: /Admin/Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Alias,Description,Active,ParentId,DisplayOrder")] Category category)
        {
            if (!category.IsValidName())
            {
                ViewBag.Error = "Tên danh mục tồn tại";
                ViewBag.SelectCategory = SelectCategoryList();
                return View(category);
            }

            if (!category.IsValidAlias())
            {
                ViewBag.Error = "Alias tồn tại";
                ViewBag.SelectCategory = SelectCategoryList();
                return View(category);
            }

            if (ModelState.IsValid)
            {
                if (category.ParentId == 0)
                    category.ParentId = null;

                db.Categories.Add(category);
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            // ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            ViewBag.SelectCategory = SelectCategoryList();
            return View(category);
        }

        // GET: /Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            return View(category);
        }

        // POST: /Admin/Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,Active,ParentId,DisplayOrder")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            return View(category);
        }

        // GET: /Admin/Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: /Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
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

        #region support methods

        private List<SelectListItem> SelectCategoryList()
        {
            var root = db.Categories.Where(p => p.Parent == null).ToList();
            var selectList = new List<SelectListItem>();
            var itemNone = new SelectListItem()
            {
                Text = "None",
                Value = "0"
            };
            selectList.Add(itemNone);

            if (root != null)
            {
                foreach (var cate in root)
                {
                    var item = new SelectListItem()
                    {
                        Text = cate.Name,
                        Value = cate.Id.ToString()
                    };
                    selectList.Add(item);
                    SubCategoryList(selectList, cate, "----");
                }
            }

            return selectList;
        }

        private void SubCategoryList(List<SelectListItem> selectList, Category parent, string indexText)
        {
            var subCates = parent.GetSubCategory();
            if (subCates != null)
            {
                foreach (var cate in subCates)
                {
                    var item = new SelectListItem()
                    {
                        Text = string.Format("{0}{1}", indexText, cate.Name),
                        Value = cate.Id.ToString()
                    };
                    selectList.Add(item);
                    var newIndex = indexText + indexText;
                    SubCategoryList(selectList, cate, newIndex);
                }
            }

        }

        #endregion
    }
}
