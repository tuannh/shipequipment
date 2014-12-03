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
using ShipEquipment.Core.Utility;
using System.Drawing;
using ShipEquipment.Core.Extensions;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class AlbumController : AdminController
    {
        #region const

        public const int Quality = 80;
        public Color Bgcolor = Color.White;

        public const int Width = 1024;
        public const int Height = 768;

        public const int ThumbWidth = 170;
        public const int ThumbHeight = 118;

        public const string Folder = "~/Userfiles/Modules/Album/";
        public const string ThumbFolder = "~/Userfiles/Modules/Album/Thumb/";

        public const string TmpFolder = "~/Userfiles/_temp/Modules/Album/";
        public const string TmpThumbFolder = "~/Userfiles/_temp/Modules/Album/thumb/";

        #endregion

        private ShipEquipmentContext db = new ShipEquipmentContext();

        private static void MakeFolder()
        {
            var folder = Globals.MapPath(Folder);
            var thumbFolder = Globals.MapPath(ThumbFolder);
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            if (!Directory.Exists(thumbFolder))
                Directory.CreateDirectory(thumbFolder);
        }

        // GET: Admin/Album
        public ActionResult Index(string kw)
        {
            List<Album> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower().Trim();

                lst = db.Albums.ToList();
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
                lst = db.Albums.OrderBy(a => a.DisplayOrder).ThenBy(a => a.Name).ToList();
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


        // GET: Admin/Album/Create
        public ActionResult Create()
        {
            return View(new Album());
        }

        // POST: Admin/Album/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Alias,DisplayOrder,CreatedDate,Photos")] Album album)
        {
            if (ModelState.IsValid)
            {
                db.Albums.Add(album);
                var photos = album.Photos;
                db.SaveChanges();

                if (photos != null)
                {
                    MakeFolder();

                    #region save photo

                    foreach (var photo in photos)
                    {
                        var tmpThumbPath = Globals.MapPath(TmpThumbFolder + photo.FileName);
                        var tmpPath = Globals.MapPath(TmpFolder + photo.FileName);
                        var ext = Path.GetExtension(photo.FileName);

                        photo.FileName = string.Format("{0}-Photo{1}{2}", album.Id, DateTime.Now.Ticks, ext);

                        var path = Globals.MapPath(Folder + photo.FileName);
                        var thumPath = Globals.MapPath(ThumbFolder + photo.FileName);

                        if (System.IO.File.Exists(tmpPath))
                            System.IO.File.Move(tmpPath, path);

                        if (System.IO.File.Exists(tmpThumbPath))
                            System.IO.File.Move(tmpThumbPath, thumPath);
                    }

                    #endregion

                    db.SaveChanges();
                }

                return RedirectToAction("index");
            }

            return View(album);
        }

        // GET: Admin/Album/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.Albums.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            return View(album);
        }

        // POST: Admin/Album/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Alias,DisplayOrder,CreatedDate,Photos")] Album album)
        {
            if (ModelState.IsValid)
            {
                var photos = album.Photos;
                var delPhotos = new List<int>();

                if (photos != null)
                {
                    MakeFolder();

                    #region save photo

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

                        photo.AlbumId = album.Id;

                        var tmpThumbPath = Globals.MapPath(TmpThumbFolder + photo.FileName);
                        var tmpPath = Globals.MapPath(TmpFolder + photo.FileName);
                        var ext = Path.GetExtension(photo.FileName);

                        photo.FileName = string.Format("{0}-Photo{1}{2}", album.Id, DateTime.Now.Ticks, ext);

                        var path = Globals.MapPath(Folder + photo.FileName);
                        var thumPath = Globals.MapPath(ThumbFolder + photo.FileName);

                        if (System.IO.File.Exists(tmpPath))
                            System.IO.File.Move(tmpPath, path);

                        if (System.IO.File.Exists(tmpThumbPath))
                            System.IO.File.Move(tmpThumbPath, thumPath);
                    }
                }

                    #endregion

                db.Entry(album).State = EntityState.Modified;
                db.SaveChanges();

                // delete photo
                foreach (var id in delPhotos)
                {
                    var photo = db.Photos.Find(id);

                    var path = Globals.MapPath(Folder + photo.FileName);
                    var thumPath = Globals.MapPath(ThumbFolder + photo.FileName);

                    try
                    {
                        if (System.IO.File.Exists(path))
                            System.IO.File.Delete(path);

                        if (System.IO.File.Exists(thumPath))
                            System.IO.File.Delete(thumPath);
                    }
                    catch (Exception exp)
                    {
                        exp.Log();
                    }

                    db.Photos.Remove(photo);
                }

                db.SaveChanges();

                return RedirectToAction("index");
            }
            return View(album);
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

                ImageTools.CreateThumbnail(tmppath, thumbpath, ThumbWidth, ThumbHeight, Bgcolor, Quality);
                ImageTools.ResizeImage(tmppath, path, Width, Height, Bgcolor, Quality);

                try { System.IO.File.Delete(tmppath); }
                catch { }

                var obj = new { Error = 0, Message = "", title = title, displayorder = 1000, filename = filename };

                return Json(obj);
            }

            var errObj = new { Error = 1, FileName = "", Message = "" };

            return Json(errObj);
        }

        // GET: Admin/Album/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.Albums.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }

            if (album.Photos != null)
            {
                foreach(var photo in album.Photos)
                {
                    var path = Globals.MapPath(Folder + photo.FileName);
                    var thumPath = Globals.MapPath(ThumbFolder + photo.FileName);

                    try
                    {
                        if (System.IO.File.Exists(path))
                            System.IO.File.Delete(path);

                        if (System.IO.File.Exists(thumPath))
                            System.IO.File.Delete(thumPath);
                    }
                    catch (Exception exp)
                    {
                        exp.Log();
                    }
                }
            }

            db.Albums.Remove(album);
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
    }
}
