using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShipEquipment.Biz.DAL;
using ShipEquipment.Biz.Domain;
using ShipEquipment.Core.Models;
using ShipEquipment.Core.Controllers;
using ShipEquipment.Core;
using System.IO;
using System.Drawing;
using ShipEquipment.Core.Utility;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class BrandController : AdminController
    {
        public const string Folder = "~/Userfiles/Upload/images/Modules/Brand/";
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: Admin/Brand
        public ActionResult Index(string kw)
        {
            List<Brand> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower();
                lst = db.Brands.ToList();
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
                lst = db.Brands.OrderBy(a => a.DisplayOrder).ThenBy(a => a.Name).ToList();
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

        // GET: Admin/Brand/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Brand brand = db.Brands.Find(id);
            if (brand == null)
            {
                return HttpNotFound();
            }
            return View(brand);
        }

        // GET: Admin/Brand/Create
        public ActionResult Create()
        {
            return View(new Brand());
        }

        // POST: Admin/Brand/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Alias,Description,Active,DisplayOrder")] Brand brand, HttpPostedFileBase file)
        {
            if (!brand.IsValidName())
            {
                ViewBag.Error = "Tên nhãn hiệu tồn tại";
                return View(brand);
            }

            if (!brand.IsValidAlias())
            {
                ViewBag.Error = "Alias tồn tại";
                return View(brand);
            }

            if (ModelState.IsValid)
            {
                db.Brands.Add(brand);
                db.SaveChanges();

                if (file != null)
                {
                    var folerPath = Globals.MapPath(Folder);
                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    // delete old banner file
                    var path = string.Format("{0}{1}", folerPath, brand.Photo);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", brand.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);

                    var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), file.FileName);
                    var tmppath = string.Format("{0}{1}", folerPath, tmpname);
                    file.SaveAs(tmppath);

                    var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                    // var brandConfig = config.Brand;
                    //ImageTools.FixResizeImage(tmppath, path, brandConfig.Width, brandConfig.Height, ColorTranslator.FromHtml(brandConfig.Background), config.Quality);
                    ImageTools.SaveImage(tmppath, path, config.Quality);

                    try { System.IO.File.Delete(tmppath); }
                    catch { }

                    brand.Photo = filename;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            return View(brand);
        }

        // GET: Admin/Brand/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Brand brand = db.Brands.Find(id);
            if (brand == null)
            {
                return HttpNotFound();
            }
            return View(brand);
        }

        // POST: Admin/Brand/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Alias,Description,Active,DisplayOrder, Photo")] Brand brand, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var folerPath = Globals.MapPath(Folder);
                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    var path = string.Format("{0}{1}", folerPath, brand.Photo);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", brand.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);

                    var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), file.FileName);
                    var tmppath = string.Format("{0}{1}", folerPath, tmpname);
                    file.SaveAs(tmppath);

                    var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                    //var brandConfig = config.Brand;
                    //ImageTools.FixResizeImage(tmppath, path, brandConfig.Width, brandConfig.Height, ColorTranslator.FromHtml(brandConfig.Background), config.Quality);
                    ImageTools.SaveImage(tmppath, path);

                    try { System.IO.File.Delete(tmppath); }
                    catch { }

                    brand.Photo = filename;
                }

                db.Entry(brand).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(brand);
        }

        // GET: Admin/Brand/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Brand brand = db.Brands.Find(id);
            if (brand == null)
            {
                return HttpNotFound();
            }

            db.Brands.Remove(brand);
            db.SaveChanges();
            return RedirectToAction("Index");

            // return View(brand);
        }

        // POST: Admin/Brand/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Brand brand = db.Brands.Find(id);
            db.Brands.Remove(brand);
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
