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
using ShipEquipment.Core;
using System.IO;
using ShipEquipment.Core.Utility;
using System.Drawing;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        public const string Folder = "~/Userfiles/Upload/images/Modules/Product/";
        public const string ThumbFolder = "~/Userfiles/Upload/_thumbs/images/Modules/Product/";

        public const string TmpFolder = "~/Userfiles/_temp/UserfilesModules/Product/";
        public const string TmpThumbFolder = "~/Userfiles/_temp/Modules/Product/thumb/";

        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: Admin/Product
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Brand).Include(p => p.Category);
            return View(products.ToList());
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
                product.Photos = new List<ProductPhoto>();
                db.SaveChanges();

                if (photos != null)
                {
                    foreach(var photo in photos)
                    {
                        var tmpThumbPath = Globals.MapPath( TmpThumbFolder + photo.FileName);
                        var tmpPath =  Globals.MapPath( TmpFolder + photo.FileName);

                        photo.FileName = string.Format("{0}-Photo{1}", product.Id, Globals.GenerateAlias(Guid.NewGuid().ToString()));

                        var path = Folder + photo.FileName;
                        var thumPath = ThumbFolder + photo.FileName;

                        if (System.IO.File.Exists(tmpPath))
                            System.IO.File.Move(tmpPath, path);

                        if (System.IO.File.Exists(tmpThumbPath))
                            System.IO.File.Move(tmpThumbPath, tmpPath);
                    }

                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Alias", product.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Alias", product.CategoryId);
            return View(product);
        }

        [HttpPost]
        public ActionResult UploadFile(string title, int displayOrder)
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

                var filename = string.Format("tmp-{0}-{1}", Globals.GenerateAlias(Guid.NewGuid().ToString()), Path.GetFileName(file.FileName));
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

                var obj = new { Error = 0, Message = "", title = title, displayorder = displayOrder, filename = filename };

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
        public ActionResult Edit([Bind(Include = "Id,Name,Alias,Code,ShortDescription,Description,Active,Price,SalePrice,MadeIn,DislayOrder,CategoryId,BrandId,Type")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
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
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
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
