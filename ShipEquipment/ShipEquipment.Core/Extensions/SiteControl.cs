using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using ShipEquipment.Core.Extensions;
using ShipEquipment.Core.Models;
using ShipEquipment.Core.Utility;
using System.Web;
using ShipEquipment.Core.BaseObjects;
using ShipEquipment.Biz.DAL;
using ShipEquipment.Biz.Domain;

namespace ShipEquipment.Core.Extensions
{
    public static class SiteControlExtensions
    {
        public static MvcHtmlString Pager(this SiteControl control, PagingModel pagingInfo)
        {
            if (pagingInfo.TotalPages <= 1)
                return new MvcHtmlString("");

            #region recheck page info

            var defaultInfo = new PagingModel();
            if (pagingInfo.ItemsPerPage <= 0)
                pagingInfo.ItemsPerPage = defaultInfo.ItemsPerPage;

            if (pagingInfo.PageCount <= 0)
                pagingInfo.PageCount = defaultInfo.PageCount;

            if (pagingInfo.CurrentPage <= 0 || pagingInfo.CurrentPage > pagingInfo.TotalPages)
                pagingInfo.CurrentPage = 1;

            var startPage = 0;
            if (pagingInfo.CurrentPage % pagingInfo.PageCount == 0)
                startPage = (int)(pagingInfo.CurrentPage / pagingInfo.PageCount) * pagingInfo.PageCount - pagingInfo.PageCount + 1;
            else
                startPage = (int)(pagingInfo.CurrentPage / pagingInfo.PageCount) * pagingInfo.PageCount + 1;

            var endPage = startPage + pagingInfo.PageCount - 1;
            if (endPage > pagingInfo.TotalPages)
                endPage = pagingInfo.TotalPages;

            #endregion

            var result = new StringBuilder();

            if (pagingInfo.ShowAllPages)
            {
                #region Enable full paging

                for (int i = 1; i <= pagingInfo.TotalPages; i++)
                {
                    var tag = new TagBuilder("a");
                    var cssClass = "";

                    if (i == 1)
                        cssClass = !string.IsNullOrEmpty(pagingInfo.FirstPageNumberCssClass) ? pagingInfo.FirstPageNumberCssClass : defaultInfo.FirstPageNumberCssClass;

                    else if (i == pagingInfo.CurrentPage)
                        cssClass = !string.IsNullOrEmpty(pagingInfo.CurrentPageCssClass) ? pagingInfo.CurrentPageCssClass : defaultInfo.CurrentPageCssClass;

                    else
                        cssClass = !string.IsNullOrEmpty(pagingInfo.PageNumberCssClass) ? pagingInfo.PageNumberCssClass : defaultInfo.PageNumberCssClass;

                    tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, i.ToString()));
                    tag.InnerHtml = i.ToString();
                    tag.AddCssClass(cssClass);

                    result.Append(tag.ToString());
                }

                #endregion
            }
            else
            {
                #region show paging with current paging length settings

                for (int i = startPage; i <= endPage; i++)
                {
                    var tag = new TagBuilder("a");
                    var cssClass = "";
                    var href = "";

                    if (i == pagingInfo.CurrentPage)
                    {
                        cssClass = !string.IsNullOrEmpty(pagingInfo.CurrentPageCssClass) ? pagingInfo.CurrentPageCssClass : defaultInfo.CurrentPageCssClass;
                        href = "javascript:void(0);";
                    }
                    else
                    {
                        cssClass = !string.IsNullOrEmpty(pagingInfo.PageNumberCssClass) ? pagingInfo.PageNumberCssClass : defaultInfo.PageNumberCssClass;
                        href = Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, i.ToString());
                    }

                    tag.MergeAttribute("href", href);
                    tag.InnerHtml = i.ToString();
                    tag.AddCssClass(cssClass);

                    result.Append(tag.ToString());
                }

                #endregion
            }

            var controlBuilder = new StringBuilder();

            #region show first/preview/compact link

            #region  Show first Page

            if (pagingInfo.CurrentPage > 1 && pagingInfo.ShowFirstLast)
            {
                var tag = new TagBuilder("a");
                tag.AddCssClass(defaultInfo.FirstPageLinkCssClass);
                if (!string.IsNullOrEmpty(pagingInfo.FirstPageLinkCssClass) && string.Compare(defaultInfo.FirstPageLinkCssClass, pagingInfo.FirstPageLinkCssClass, true) != 0)
                {
                    tag.AddCssClass(pagingInfo.FirstPageLinkCssClass);
                }

                tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, "1"));
                tag.InnerHtml = "paging_First".Localize("First");

                controlBuilder.Append(tag.ToString());
            }

            #endregion

            #region Show previous Page

            if (pagingInfo.CurrentPage > 1 && pagingInfo.ShowNextPrevious)
            {
                var tag = new TagBuilder("a");
                tag.AddCssClass(defaultInfo.PrePageCssClass);
                if (!string.IsNullOrEmpty(pagingInfo.PrePageCssClass) && string.Compare(defaultInfo.PrePageCssClass, pagingInfo.PrePageCssClass, true) != 0)
                {
                    tag.AddCssClass(pagingInfo.PrePageCssClass);
                }

                tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, (pagingInfo.CurrentPage - 1).ToString()));
                tag.InnerHtml = "paging_Previous".Localize("Previous");

                controlBuilder.Append(tag.ToString());
            }

            #endregion

            #region show compact link

            if (pagingInfo.ShowCompactLink && startPage > 1)
            {
                var tag = new TagBuilder("a");
                var css = !string.IsNullOrEmpty(pagingInfo.CompactPageLinkCssClass) ? pagingInfo.CompactPageLinkCssClass : defaultInfo.FirstPageLinkCssClass;
                var pageIndex = (startPage - 1).ToString();

                tag.AddCssClass(css);
                tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, pageIndex));
                tag.InnerHtml = "paging_CompactLink".Localize("...");

                controlBuilder.Append(tag.ToString());
            }

            if (controlBuilder.Length > 0)
                result.Insert(0, controlBuilder);

            #endregion

            #endregion

            #region show compact/next/last link

            controlBuilder = new StringBuilder();

            #region show compact link

            if (pagingInfo.ShowCompactLink && endPage < pagingInfo.TotalPages)
            {
                var tag = new TagBuilder("a");
                var css = !string.IsNullOrEmpty(pagingInfo.CompactPageLinkCssClass) ? pagingInfo.CompactPageLinkCssClass : defaultInfo.FirstPageLinkCssClass;
                var pageIndex = (endPage + 1).ToString();

                tag.AddCssClass(css);
                tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, pageIndex));
                tag.InnerHtml = "paging_CompactLink".Localize("...");

                controlBuilder.Append(tag.ToString());
            }

            #endregion

            #region Show next Page

            if (pagingInfo.CurrentPage < pagingInfo.TotalPages && pagingInfo.ShowNextPrevious)
            {
                var tag = new TagBuilder("a");
                tag.AddCssClass(defaultInfo.NextPageCssClass);
                if (!string.IsNullOrEmpty(pagingInfo.NextPageCssClass) && string.Compare(defaultInfo.NextPageCssClass, pagingInfo.NextPageCssClass, true) != 0)
                {
                    tag.AddCssClass(pagingInfo.NextPageCssClass);
                }

                tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, (pagingInfo.CurrentPage + 1).ToString()));
                tag.InnerHtml = "paging_Next".Localize("Next");

                controlBuilder.Append(tag.ToString());
            }

            #endregion

            #region Show last Page

            if (pagingInfo.CurrentPage < pagingInfo.TotalPages && pagingInfo.ShowFirstLast)
            {
                var tag = new TagBuilder("a");
                tag.AddCssClass(defaultInfo.LastPageLinkCssClass);
                if (!string.IsNullOrEmpty(pagingInfo.LastPageLinkCssClass) && string.Compare(defaultInfo.LastPageLinkCssClass, pagingInfo.LastPageLinkCssClass, true) != 0)
                {
                    tag.AddCssClass(pagingInfo.LastPageLinkCssClass);
                }

                tag.MergeAttribute("href", Globals.AppendQueryStringValue(pagingInfo.RequestUrl, pagingInfo.PageIndexQueryKeyName, pagingInfo.TotalPages.ToString()));
                tag.InnerHtml = "paging_Last".Localize("Last");

                controlBuilder.Append(tag.ToString());
            }

            #endregion

            if (controlBuilder.Length > 0)
                result.Append(controlBuilder);

            #endregion

            #region show summary Info

            if (pagingInfo.ShowSummaryInfo)
            {
                var infoTemplate = pagingInfo.SummaryInfoTemplate;
                infoTemplate = !string.IsNullOrEmpty(infoTemplate) ? infoTemplate : "paging_summaryInfoText".Localize("Page {0} of {1} pages ({2} items)");

                var summary = string.Format(infoTemplate, pagingInfo.CurrentPage, pagingInfo.TotalPages, pagingInfo.TotalItems);
                result.Insert(0, summary);
            }

            #endregion

            return MvcHtmlString.Create(result.ToString());
        }

        public static MvcHtmlString Slider(this SiteControl control, string viewName = "Slider.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var banners = db.Banners.Where(a => a.Active).OrderBy(a => a.DisplayOrder).ThenBy(a => a.Name).ToList();

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, banners);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString MenuNavigator(this SiteControl control, string viewName = "MenuNavigator.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var pages = db.Pages.Where(p => p.Active).ToList();
            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, pages);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString CategoryList(this SiteControl control, string viewName = "CategoryList.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var rootCategories = db.Categories
                                   .Where(p => p.Parent == null && p.Active)
                                   .OrderBy(p => p.DisplayOrder)
                                   .ThenBy(p => p.Name)
                                   .ToList();

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, rootCategories);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString ProductList(this SiteControl control, bool isSaleList, string viewName = "ProductList.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var lst = new List<Product>();

            #region get product list

            if (isSaleList)
            {
                lst = db.Products.Where(p => p.Active && p.SalePrice > 0)
                                     .OrderBy(p => p.DislayOrder)
                                     .ThenBy(p => "Name")
                                     .ToList();
            }
            else
            {
                lst = db.Products.Where(p => p.Active)
                                     .OrderBy(p => p.DislayOrder)
                                     .ThenBy(p => p.Name)
                                     .ToList();
            }

            #endregion

            #region check and filter category

            var cateAlias = "";
            var routeData = SiteContext.Current.RouteData;
            if (routeData != null && routeData.Values != null && routeData.Values["categoryalias"] != null)
                cateAlias = routeData.Values["categoryalias"].ToString();

            if (!string.IsNullOrEmpty(cateAlias))
            {
                lst = lst.Where(p => p.Category != null && string.Compare(p.Category.Alias, cateAlias, true) == 0)
                         .ToList();
            }


            #endregion

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, lst);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString LastViewProduct(this SiteControl control, bool isSaleList, string viewName = "LastViewProduct.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var lst = new List<Product>();

            var lastView = HttpContext.Current.Request.Cookies["lastview"];
            if (lastView != null)
            {
                var value = lastView.Value ?? "";
                var arrIds = value.Trim().Replace("&", "").Split(';');
                if (arrIds.Length > 0)
                {
                    var lstIds = arrIds.Select(a => int.Parse(a)).ToList();

                    var db = new ShipEquipmentContext();
                    lst = db.Products.Where(p => lstIds.Contains(p.Id)).ToList();
                }
            }

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, lst);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString ProductDetail(this SiteControl control, string viewName = "ProductDetail.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            #region check and filter category

            var alias = "";
            var routeData = SiteContext.Current.RouteData;
            if (routeData != null && routeData.Values != null && routeData.Values["productalias"] != null)
                alias = routeData.Values["productalias"].ToString();

            var product = db.Products
                            .FirstOrDefault(p => p.Active && string.Compare(p.Alias, alias, true) == 0);

            #endregion

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, product);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString NewsList(this SiteControl control, string viewName = "NewsList.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var lst = db.NewsArticles.Where(p => p.Active)
                                 .OrderByDescending(p => p.CreatedDate)
                                 .ThenBy(p => p.Title)
                                 .ToList();

            #region check and filter category

            var cateAlias = "";
            var routeData = SiteContext.Current.RouteData;
            if (routeData != null && routeData.Values != null && routeData.Values["newscategoryalias"] != null)
                cateAlias = routeData.Values["newscategoryalias"].ToString();

            if (!string.IsNullOrEmpty(cateAlias))
            {
                lst = lst.Where(p => p.Category != null && string.Compare(p.Category.Alias, cateAlias, true) == 0)
                         .ToList();
            }


            #endregion

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, lst);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString NewsDetail(this SiteControl control, string viewName = "NewsDetail.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var newsalias = "";
            var routeData = SiteContext.Current.RouteData;
            if (routeData != null && routeData.Values != null && routeData.Values["newsalias"] != null)
                newsalias = routeData.Values["newsalias"].ToString();

            var news = db.NewsArticles.FirstOrDefault(p => p.Active && string.Compare(p.Alias, newsalias, true) == 0);

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, news);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString CategoryBreadcum(this SiteControl control, string viewName = "CategoryBreadcum.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var cateAlias = "";
            var routeData = SiteContext.Current.RouteData;
            if (routeData != null && routeData.Values != null && routeData.Values["categoryalias"] != null)
                cateAlias = routeData.Values["categoryalias"].ToString();

            var cate = db.Categories.FirstOrDefault(p => p.Active && string.Compare(p.Alias, cateAlias, true) == 0);

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, cate);

            return new MvcHtmlString(result);
        }

        public static MvcHtmlString BrandList(this SiteControl control, string viewName = "BrandList.cshtml")
        {
            var viewPath = string.Format("~/Views/Shared/Controls/{0}", viewName);
            var db = new ShipEquipmentContext();

            var lst = db.Brands
                                   .Where(p => p.Active)
                                   .OrderBy(p => p.DisplayOrder)
                                   .ThenBy(p => p.Name)
                                   .ToList();

            var result = RenderViewToString(control.HtmlHelper.ViewContext.Controller, viewPath, lst);

            return new MvcHtmlString(result);
        }




        #region render view

        private static string RenderViewToString(ControllerBase controller, string viewPath, object model)
        {
            var path = Globals.MapPath(viewPath);

            if (File.Exists(path))
            {
                controller.ViewData.Model = model;

                using (var sw = new StringWriter())
                {
                    var view = new RazorView(controller.ControllerContext, viewPath, string.Empty, false, null);
                    var viewContext = new ViewContext(controller.ControllerContext, view, controller.ViewData, controller.TempData, sw);

                    view.Render(viewContext, sw);

                    return sw.ToString();
                }
            }

            return string.Empty;
        }

        #endregion
    }
}
