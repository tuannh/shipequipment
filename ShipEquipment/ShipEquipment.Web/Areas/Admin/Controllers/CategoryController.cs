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
                var keyword = kw.ToLower().Trim();
                lst = db.Categories.ToList();
                lst = lst.Where(a => a.Name.ToLower().Contains(keyword) || (a.Description ?? "").ToLower().Contains(keyword))
                         .OrderBy(a => a.DisplayOrder)
                         .ThenBy(a => a.Name)
                         .ToList();

                if (lst.Count > 0)
                    ViewBag.SearchReseult = string.Format("<b>{0}</b> kết quả được tìm thấy", lst.Count);
                else
                    ViewBag.SearchReseult = string.Format("Không tìm thấy kết quả với từ khóa <b>{0}</b>", kw);
            }
            else
            {
                lst = GetShowList();
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
            ViewBag.SelectCategory = SelectCategoryList(0);

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
                ViewBag.SelectCategory = SelectCategoryList(0);
                return View(category);
            }

            if (!category.IsValidAlias())
            {
                ViewBag.Error = "Alias tồn tại";
                ViewBag.SelectCategory = SelectCategoryList(0);
                return View(category);
            }

            if (ModelState.IsValid)
            {
                if (category.ParentId == 0)
                    category.ParentId = null;

                db.Categories.Add(category);
                db.SaveChanges();

                return RedirectToAction("index");
            }

            // ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            ViewBag.SelectCategory = SelectCategoryList(0);
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
            // ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            ViewBag.SelectCategory = SelectCategoryList(category.Id);
            return View(category);
        }

        // POST: /Admin/Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Alias,Description,Active,ParentId,DisplayOrder")] Category category)
        {
            if (ModelState.IsValid)
            {
                if (category.ParentId == 0)
                    category.ParentId = null;

                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("index");
            }
            //ViewBag.ParentId = new SelectList(db.Categories, "Id", "Name", category.ParentId);
            ViewBag.SelectCategory = SelectCategoryList(category.Id);
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

            if (category.GetSubCategory().Count() == 0)
            {
                db.Categories.Remove(category);
                db.SaveChanges();
            }
            return RedirectToAction("index");

            // return View(category);
        }

        // POST: /Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();
            return RedirectToAction("index");
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

        private List<SelectListItem> SelectCategoryList(int editId)
        {
            var root = db.Categories.Where(p => p.Parent == null && editId != p.Id)
                                    .OrderBy(p => p.DisplayOrder)
                                    .ThenBy(p => p.Name)
                                    .ToList();

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
                    SubCategoryList(editId, selectList, cate, "----");
                }
            }

            return selectList;
        }

        private void SubCategoryList(int cateId, List<SelectListItem> selectList, Category parent, string indexText)
        {
            var subCates = parent.GetSubCategory();

            if (subCates != null)
            {
                subCates = subCates.Where(p => p.Id != cateId);

                foreach (var cate in subCates)
                {
                    var item = new SelectListItem()
                    {
                        Text = string.Format("{0}{1}", indexText, cate.Name),
                        Value = cate.Id.ToString()
                    };
                    selectList.Add(item);
                    var newIndex = indexText + indexText;
                    SubCategoryList(cateId, selectList, cate, newIndex);
                }
            }

        }

        private List<Category> GetShowList()
        {
            var lst = db.Categories.Where(p => p.Parent == null)
                                   .OrderBy(p => p.DisplayOrder)
                                   .ThenBy(p => p.Name)
                                   .ToList();
            var lstResult = new List<Category>();

            if (lst != null)
            {
                var count = lst.Count;
                for (var i = 0; i < count; i++)
                {
                    var cate = lst.ElementAt(i);
                    lstResult.Add(cate);
                    GetSubCategoryList(lstResult, cate, "----");
                }
            }

            return lstResult;

        }

        private void GetSubCategoryList(List<Category> selectList, Category parent, string indexText)
        {
            var subCates = parent.GetSubCategory();

            if (subCates != null)
            {
                for (var i = 0; i < subCates.Count(); i++)
                {
                    var cate = subCates.ElementAt(i);
                    var newIndex = indexText + indexText;

                    cate.Name = indexText + cate.Name;
                    selectList.Add(cate);
                    GetSubCategoryList(selectList, cate, newIndex);
                }
            }

        }


        #endregion
    }
}
