﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShipEquipment.Biz.DAL;
using ShipEquipment.Biz.Domain;
using ShipEquipment.Core;
using System.IO;
using ShipEquipment.Core.Utility;
using System.Drawing;
using ShipEquipment.Core.Models;
using ShipEquipment.Core.Controllers;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class ProductController : AdminController
    {

        public const string Folder = "~/Userfiles/Modules/Products/";
        public const string ThumbFolder = "~/Userfiles/Modules/Products/Thumb/";

        public const string TmpFolder = "~/Userfiles/_temp/Modules/Product/";
        public const string TmpThumbFolder = "~/Userfiles/_temp/Modules/Product/thumb/";

        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: Admin/Product
        public ActionResult Index(string kw)
        {
            List<Product> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower();
                lst = db.Products.ToList();
                lst = lst.Where(a => a.Name.ToLower().Contains(keyword) || (a.Description ?? "").ToLower().Contains(keyword))
                         .OrderBy(a => a.DislayOrder)
                         .ThenBy(a => a.Name)
                         .ToList();

                if (lst.Count > 0)
                    ViewBag.SearchReseult = string.Format("<b>{0}</b> kết quả được tìm thấy", lst.Count);
                else
                    ViewBag.SearchReseult = string.Format("Không tìm thấy kết quả với từ khóa <b>{0}</b>", kw);
            }
            else
            {
                lst = db.Products.ToList();
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

        // GET: Admin/Product/Create
        public ActionResult Create()
        {
            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Alias");
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Alias");

            return View(new Product());
        }

        // POST: Admin/Product/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Alias,Code,ShortDescription,Description,Active,Price,SalePrice,MadeIn,DislayOrder,CategoryId,BrandId,Type,Photos")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                var photos = product.Photos;
                db.SaveChanges();

                if (photos != null)
                {
                    MakeFolder();

                    foreach (var photo in photos)
                    {
                        var tmpThumbPath = Globals.MapPath(TmpThumbFolder + photo.FileName);
                        var tmpPath = Globals.MapPath(TmpFolder + photo.FileName);
                        var ext = Path.GetExtension(photo.FileName);

                        photo.FileName = string.Format("{0}-Photo{1}{2}", product.Id, DateTime.Now.Ticks, ext);

                        var path = Globals.MapPath(Folder + photo.FileName);
                        var thumPath = Globals.MapPath(ThumbFolder + photo.FileName);

                        if (System.IO.File.Exists(tmpPath))
                            System.IO.File.Move(tmpPath, path);

                        if (System.IO.File.Exists(tmpThumbPath))
                            System.IO.File.Move(tmpThumbPath, thumPath);
                    }

                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Alias", product.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Alias", product.CategoryId);

            return View(product);
        }

        private static void MakeFolder()
        {
            var folder = Globals.MapPath(Folder);
            var thumbFolder = Globals.MapPath(ThumbFolder);
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            if (!Directory.Exists(thumbFolder))
                Directory.CreateDirectory(thumbFolder);
        }

        [HttpPost]
        public ActionResult UploadFile()
        {
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];

                var folderPath = Globals.MapPath(TmpFolder);
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                var thumbFolderPath = Globals.MapPath(TmpThumbFolder);
                if (!Directory.Exists(thumbFolderPath))
                    Directory.CreateDirectory(thumbFolderPath);

                var title = Path.GetFileName(file.FileName);
                var filename = string.Format("tmp-{0}-{1}", DateTime.Now.Ticks, Path.GetFileName(file.FileName));
                var path = string.Format("{0}{1}", folderPath, filename);
                var thumbpath = string.Format("{0}{1}", thumbFolderPath, filename);

                var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), Path.GetFileName(file.FileName));
                var tmppath = string.Format("{0}{1}", folderPath, tmpname);
                file.SaveAs(tmppath);

                var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                var imgConfig = config.Product;
                ImageTools.FixResizeImage(tmppath, thumbpath, imgConfig.ThumbWidth, imgConfig.ThumbHeight, ColorTranslator.FromHtml(imgConfig.Background), config.Quality);
                ImageTools.FixResizeImage(tmppath, path, imgConfig.Width, imgConfig.Height, ColorTranslator.FromHtml(imgConfig.Background), config.Quality);

                try { System.IO.File.Delete(tmppath); }
                catch { }

                var obj = new { Error = 0, Message = "", title = title, displayorder = 1000, filename = filename };

                return Json(obj);
            }

            var errObj = new { Error = 1, FileName = "", Message = "" };

            return Json(errObj);
        }


        // GET: Admin/Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Alias", product.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Alias", product.CategoryId);
            return View(product);
        }

        // POST: Admin/Product/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Alias,Code,ShortDescription,Description,Active,Price,SalePrice,MadeIn,DislayOrder,CategoryId,BrandId,Type,Photos")] Product product)
        {
            if (ModelState.IsValid)
            {
                var photos = product.Photos;
                var delPhotos = new List<int>();

                if (photos != null)
                {
                    MakeFolder();

                    foreach (var photo in photos)
                    {
                        if (photo.Id > 0)
                            db.Entry(photo).State = EntityState.Modified;
                        else if (photo.Id == 0)
                            db.Entry(photo).State = EntityState.Added;
                        else if (photo.Id < 0)
                        {
                            photo.Id = Math.Abs(photo.Id);
                            delPhotos.Add(photo.Id);
                        }

                        if (!photo.FileName.StartsWith("tmp"))
                            continue;

                        photo.ProductId = product.Id;

                        var tmpThumbPath = Globals.MapPath(TmpThumbFolder + photo.FileName);
                        var tmpPath = Globals.MapPath(TmpFolder + photo.FileName);
                        var ext = Path.GetExtension(photo.FileName);

                        photo.FileName = string.Format("{0}-Photo{1}{2}", product.Id, DateTime.Now.Ticks, ext);

                        var path = Globals.MapPath(Folder + photo.FileName);
                        var thumPath = Globals.MapPath(ThumbFolder + photo.FileName);

                        if (System.IO.File.Exists(tmpPath))
                            System.IO.File.Move(tmpPath, path);

                        if (System.IO.File.Exists(tmpThumbPath))
                            System.IO.File.Move(tmpThumbPath, thumPath);
                    }
                }
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();

                // delete photo
                foreach (var id in delPhotos)
                {
                    var photo = db.ProductPhotos.Find(id);
                    db.ProductPhotos.Remove(photo);
                }
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Alias", product.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Alias", product.CategoryId);
            return View(product);
        }

        // GET: Admin/Product/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
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