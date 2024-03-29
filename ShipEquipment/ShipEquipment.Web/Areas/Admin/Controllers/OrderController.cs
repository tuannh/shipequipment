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

namespace ShipEquipment.Web.Areas.Admin.Controllers
{
    public class OrderController : AdminController
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        // GET: Admin/Order
        public ActionResult Index(string kw, int? status)
        {
            var lst = db.Orders.ToList();
            if (status.HasValue && status.Value > 0)
                lst = lst.Where(o => o.Status == status).ToList();

            if (!string.IsNullOrEmpty(kw))
            {
                var keyword = kw.ToLower().Trim();
                lst = lst.Where(a => a.CustomerName.ToLower().Contains(keyword) || (a.Address ?? "").ToLower().Contains(keyword) || (a.Phone ?? "").ToLower().Contains(keyword))
                         .OrderByDescending(a => a.OrderDate)
                         .ThenBy(a => a.CustomerName)
                         .ToList();

                if (lst.Count > 0)
                    ViewBag.SearchReseult = string.Format("<b>{0}</b> kết quả được tìm thấy", lst.Count);
                else
                    ViewBag.SearchReseult = string.Format("Không tìm thấy kết quả với từ khóa <b>{0}</b>", kw);
            }
            else
            {
                lst = lst.OrderByDescending(a => a.OrderDate)
                         .ThenBy(a => a.CustomerName)
                         .ToList();
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

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var order = db.Orders.Include(a => a.ProductOrders.Select(b => b.Product))
                                         .Where(c => c.Id == id)
                                         .FirstOrDefault();

            ViewBag.ProvinceId = new SelectList(db.Provinces, "Id", "Name", order.ProvinceId);
            ViewBag.DistrictId = new SelectList(db.Districts, "Id", "Name", order.DistrictId);

            return View(order);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserId,CustomerName,Phone,Email,Address,DistrictId,Note,OrderDate,ProvinceId,Status")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("index");
            }

            ViewBag.ProvinceId = new SelectList(db.Districts, "Id", "Name", order.ProvinceId);
            ViewBag.DistrictId = new SelectList(db.Districts, "Id", "Name", order.DistrictId);

            return View(order);
        }


        // GET: Admin/Order/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var order = db.Orders.Include(a => a.ProductOrders.Select(b => b.Product)).Include(a => a.District).Include(a => a.Province)
                                         .Where(c => c.Id == id)
                                         .FirstOrDefault();

            if (order == null)
            {
                return HttpNotFound();
            }

            return View(order);
        }

        // GET: Admin/Order/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }

            db.Orders.Remove(order);
            db.SaveChanges();

            return RedirectToAction("index");

            // return View(order);
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
