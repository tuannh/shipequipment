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
using ShipEquipment.Core;
using ShipEquipment.Core.Extensions;
using System.IO;
using ShipEquipment.Core.Configurations;
using ShipEquipment.Core.Utility;
using System.Drawing;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class VideoController : AdminController
    {
        #region const

        public const string Folder = "~/Userfiles/Modules/Video/";
        public const string ThumbFolder = "~/Userfiles/Modules/Video/Thumb/";

        public const int Width = 379;
        public const int Height = 195;

        public const int ThumbWidth = 170;
        public const int ThumbHeight = 118;

        public const string UrlTemplate = "http://img.youtube.com/vi/{0}/hqdefault.jpg";

        private void MakeFolder()
        {
            var thumb = Globals.MapPath(ThumbFolder);
            if (!Directory.Exists(thumb))
                Directory.CreateDirectory(thumb);

            var path = Globals.MapPath(Folder);
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);
        }

        private void DownloadPhoto(string url, string savePath)
        {
            try
            {
                var client = new WebClient();
                client.DownloadFile(url, savePath);
            }
            catch (Exception exp)
            {
                exp.Log();
            }
        }

        #endregion

        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/Video/
        public ActionResult Index(string kw)
        {
            List<Video> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower();
                lst = db.Videos.ToList();
                lst = lst.Where(a => a.Name.ToLower().Contains(keyword) || (a.Description ?? "").ToLower().Contains(keyword))
                         .OrderBy(a => a.DisplayOrder)
                         .ThenByDescending(a => a.CreatedDate)
                         .ToList();

                if (lst.Count > 0)
                    ViewBag.SearchReseult = string.Format("<b>{0}</b> kết quả được tìm thấy", lst.Count);
                else
                    ViewBag.SearchReseult = string.Format("Không tìm thấy kết quả với từ khóa <b>{0}</b>", kw);
            }
            else
            {
                lst = db.Videos.ToList();
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

        // GET: /Admin/Video/Create
        public ActionResult Create()
        {
            return View(new Video());
        }

        // POST: /Admin/Video/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Alias,Description,Url,Active,DisplayOrder")] Video video)
        {
            if (ModelState.IsValid)
            {
                video.CreatedDate = DateTime.Now;
                video.VideoId = Globals.GetQueryStringValue(video.Url, "v");

                db.Videos.Add(video);
                db.SaveChanges();

                SaveVideoPhoto(video);

                return RedirectToAction("index");
            }

            return View(video);
        }

        private void SaveVideoPhoto(Video video)
        {
            MakeFolder();

            var url = string.Format(UrlTemplate, video.VideoId);

            var tmpPath = string.Format("{0}tmp-{1}.jpg", Folder, video.VideoId);
            tmpPath = Globals.MapPath(tmpPath);

            DownloadPhoto(url, tmpPath);

            if (System.IO.File.Exists(tmpPath))
            {
                var quality = SiteConfiguration.GetConfig().Quality;
                var bg = ColorTranslator.FromHtml(SiteConfiguration.GetConfig().Banner.Background);

                var thumb = string.Format("{0}{1}.jpg", ThumbFolder, video.VideoId);
                thumb = Globals.MapPath(thumb);

                var path = string.Format("{0}{1}.jpg", Folder, video.VideoId);
                path = Globals.MapPath(path);

                if (System.IO.File.Exists(thumb))
                    System.IO.File.Delete(thumb);

                if (System.IO.File.Exists(path))
                    System.IO.File.Delete(path);

                ImageTools.CreateThumbnail(tmpPath, thumb, ThumbWidth, ThumbHeight, bg, quality);
                ImageTools.CreateThumbnail(tmpPath, path, Width, Height, bg, quality);

                System.IO.File.Delete(tmpPath);
            }
        }

        // GET: /Admin/Video/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // POST: /Admin/Video/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Alias,Description,Url,Active,DisplayOrder,VideoId")] Video video)
        {
            if (ModelState.IsValid)
            {
                video.VideoId = Globals.GetQueryStringValue(video.Url, "v");
                db.Entry(video).State = EntityState.Modified;
                db.SaveChanges();

                SaveVideoPhoto(video);

                return RedirectToAction("index");
            }
            return View(video);
        }

        // GET: /Admin/Video/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // POST: /Admin/Video/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Video video = db.Videos.Find(id);
            db.Videos.Remove(video);
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
