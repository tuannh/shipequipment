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
using System.IO;
using ShipEquipment.Core.Utility;
using System.Drawing;

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class NewsController : AdminController
    {
        public const string Folder = "~/Userfiles/Upload/images/Modules/News/";

        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: /Admin/News/
        public ActionResult Index(string kw)
        {
            var newsarticles = db.NewsArticles.Include(n => n.Category);
            //return View(newsarticles.ToList());
            List<NewsArticle> lst = null;

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower().Trim();
                lst = db.NewsArticles.ToList();
                lst = lst.Where(a => a.Title.ToLower().Contains(keyword) || (a.Summary ?? "").ToLower().Contains(keyword) || (a.Content ?? "").ToLower().Contains(keyword))
                         .OrderBy(a => a.DisplayOrder)
                         .ThenBy(a => a.Title)
                         .ToList();

                if (lst.Count > 0)
                    ViewBag.SearchReseult = string.Format("<b>{0}</b> kết quả được tìm thấy", lst.Count);
                else
                    ViewBag.SearchReseult = string.Format("Không tìm thấy kết quả với từ khóa <b>{0}</b>", kw);
            }
            else
            {
                lst = db.NewsArticles.ToList();
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

        // GET: /Admin/News/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.NewsCategories, "Id", "Name");
            return View(new NewsArticle());
        }

        // POST: /Admin/News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Alias,Title,Summary,Content,Active,CategoryId")] NewsArticle newsarticle, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                newsarticle.CreatedDate = DateTime.Now;
                db.NewsArticles.Add(newsarticle);
                db.SaveChanges();

                if (file != null)
                {
                    var folerPath = Globals.MapPath(Folder);
                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    // delete old banner file
                    var path = string.Format("{0}{1}", folerPath, newsarticle.Photo);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", newsarticle.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);


                    var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), file.FileName);
                    var tmppath = string.Format("{0}{1}", folerPath, tmpname);
                    file.SaveAs(tmppath);

                    var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                    var bannerConfig = config.News;
                    ImageTools.FixResizeImage(tmppath, path, bannerConfig.ThumbWidth, bannerConfig.ThumbHeight, ColorTranslator.FromHtml(bannerConfig.Background), config.Quality);

                    try { System.IO.File.Delete(tmppath); }
                    catch { }

                    newsarticle.Photo = filename;
                    db.SaveChanges();
                }



                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.NewsCategories, "Id", "Name", newsarticle.CategoryId);
            return View(newsarticle);
        }

        // GET: /Admin/News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsArticle newsarticle = db.NewsArticles.Find(id);
            if (newsarticle == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.NewsCategories, "Id", "Name", newsarticle.CategoryId);
            return View(newsarticle);
        }

        // POST: /Admin/News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Alias,Title,Summary,Content,Active,CategoryId,CreatedDate,Photo")] NewsArticle newsarticle, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var folerPath = Globals.MapPath(Folder);
                    if (!Directory.Exists(folerPath))
                        Directory.CreateDirectory(folerPath);

                    var path = string.Format("{0}{1}", folerPath, newsarticle.Photo);
                    if (System.IO.File.Exists(path))
                        System.IO.File.Delete(path);

                    var filename = string.Format("{0}-{1}", newsarticle.Id, file.FileName);
                    path = string.Format("{0}{1}", folerPath, filename);

                    var tmpname = string.Format("{0}-{1}", Guid.NewGuid().ToString(), file.FileName);
                    var tmppath = string.Format("{0}{1}", folerPath, tmpname);
                    file.SaveAs(tmppath);

                    var config = ShipEquipment.Core.Configurations.SiteConfiguration.GetConfig();
                    var newsConfig = config.News;
                    ImageTools.FixResizeImage(tmppath, path, newsConfig.ThumbWidth, newsConfig.ThumbHeight, ColorTranslator.FromHtml(newsConfig.Background), config.Quality);

                    try { System.IO.File.Delete(tmppath); }
                    catch { }

                    newsarticle.Photo = filename;
                }

                newsarticle.UpdatedDate = DateTime.Now;
                db.Entry(newsarticle).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.NewsCategories, "Id", "Alias", newsarticle.CategoryId);
            return View(newsarticle);
        }

        // GET: /Admin/News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsArticle newsarticle = db.NewsArticles.Find(id);
            if (newsarticle == null)
            {
                return HttpNotFound();
            }

            db.NewsArticles.Remove(newsarticle);
            db.SaveChanges();
            return RedirectToAction("Index");

            //return View(newsarticle);
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
