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
using ShipEquipment.Core.Controllers;
using ShipEquipment.Core.Models;
using ShipEquipment.Core;
using System.IO;
using ShipEquipment.Core.Utility;
using System.Drawing;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class BannerController : AdminController
    {
        public const string Folder = "~/Userfiles/Upload/images/Modules/BannerRotators/";
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: Admin/Banner
        public ActionResult Index(string kw)
        {
            List<Banner> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower().Trim();
                lst = db.Banners.ToList();
                lst = lst.Where(a => a.Name.ToLower().Contains(keyword) || (a.Description ?? "").ToLower().Contains(keyword) ||
                                     (a.Url ?? "").ToLower().Contains(keyword) || (a.Target ?? "").ToLower().Contains(keyword))
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
                lst = db.Banners.OrderBy(a => a.DisplayOrder).ThenBy(a => a.Name).ToList();
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

        // GET: Admin/Banner/Create
        public ActionResult Create()
        {
            return View(new Banner());
        }

        // POST: Admin/Banner/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,Order,FileName,Active,Target,Url,DisplayOrder")] Banner banner, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.Banners.Add(banner);
                db.SaveChanges();

                if (file != null)
                {
                    var folerPath = Globals.MapPath(Folder);
                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    // delete old banner file
                    var path = string.Format("{0}{1}", folerPath, banner.FileName);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", banner.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);


                    var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), file.FileName);
                    var tmppath = string.Format("{0}{1}", folerPath, tmpname);
                    file.SaveAs(tmppath);

                    var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                    var bannerConfig = config.Banner;
                    ImageTools.FixResizeImage(tmppath, path, bannerConfig.Width, bannerConfig.Height, ColorTranslator.FromHtml(bannerConfig.Background), config.Quality);

                    try { System.IO.File.Delete(tmppath); }
                    catch { }

                    banner.FileName = filename;
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            return View(banner);
        }

        // GET: Admin/Banner/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // POST: Admin/Banner/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,FileName,Active,Target,Url,DisplayOrder")] Banner banner, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var folerPath = Globals.MapPath(Folder);
                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    var path = string.Format("{0}{1}", folerPath, banner.FileName);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", banner.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);

                    var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), file.FileName);
                    var tmppath = string.Format("{0}{1}", folerPath, tmpname);
                    file.SaveAs(tmppath);

                    var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                    var bannerConfig = config.Banner;
                    ImageTools.FixResizeImage(tmppath, path, bannerConfig.Width, bannerConfig.Height, ColorTranslator.FromHtml(bannerConfig.Background), config.Quality);

                    try { System.IO.File.Delete(tmppath); }
                    catch { }

                    banner.FileName = filename;
                }

                db.Entry(banner).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(banner);
        }

        // GET: Admin/Banner/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            // return View(banner);

            db.Banners.Remove(banner);
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
