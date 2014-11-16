using ShipEquipment.Biz.DAL;
using ShipEquipment.Core;
using ShipEquipment.Core.Providers;
using ShipEquipment.Web.Areas.Common.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ShipEquipment.Web.Areas.Common.Controllers
{
    public class UserController : Controller
    {
        private ShipEquipmentContext db = new ShipEquipmentContext();

        public string Index()
        {
            RedirectToAction("Login");

            return "";
        }

        public ActionResult Login()
        {
            return View(new UserModel());
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UserModel model)
        {
            if (ModelState.IsValid)
            {
                var user = db.Users.Where(a => string.Compare(a.Username, model.Username, true) == 0).FirstOrDefault();

                if (user != null)
                {
                    var password = EncryptProvider.EncryptPassword(model.Password, user.PasswordSalt);

                    if (user.Active && user.Password == password)
                    {
                        var userInfo = string.Format("{0}-{1}", user.Id, user.Username);
                        FormsAuthentication.SetAuthCookie(userInfo, model.RememberMe);

                        var key = SiteContext.Current.ReturnUrlQueryKey;
                        var returnUrl = SiteContext.Current.QueryString[key] ?? "";

                        if (string.IsNullOrEmpty(returnUrl))
                            return Redirect(SiteUrls.Instance.DefaultAdminUrl());

                        return Redirect(Globals.ResolveUrl(returnUrl));
                    }
                    else
                    {
                        ViewBag.Error = "Tên đăng nhập/mật khẩu không đúng.";
                        return View(model);
                    }
                }
            }

            ViewBag.Error = "Thông tin không hợp lệ. Xin kiểm tra lại";
            return View(model);
        }

        [HttpGet]
        public ActionResult Logout()
        {
            var returnUrl = string.Empty;

            if (Request.UrlReferrer != null && Request.UrlReferrer.AbsolutePath.ToLower().IndexOf("/logout") < 0)
            {
                returnUrl = Globals.UrlEncode(Request.UrlReferrer.AbsolutePath);
            }

            FormsAuthentication.SignOut();

            var url = SiteUrls.Instance.LoginUrl(returnUrl);

            return Redirect(Globals.ResolveUrl(url));
        }

        public ActionResult ForgotPw()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotPw(string email)
        {
            if (!string.IsNullOrEmpty(email))
            {

            }
            return View(email);
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