using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Nhom8_ChuDu.Models;
namespace Nhom8_ChuDu.Controllers
{
    public class HomeController : Controller
    {
        private ChuDu24 db = new ChuDu24();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Content()
        {
            return View();
        }
        public ActionResult KhachSan()
        {
            var khachSans = db.KhachSans.Select(p => p);
            return View(khachSans.ToList());
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangNhap(string Ten, string MatKhau, RouteCollection routes)
        {
            if (ModelState.IsValid)
            {
                var user = db.TaiKhoans.Where(u => u.Ten.Equals(Ten) && u.MatKhau.Equals(MatKhau)).ToList();
                if (user.Count() > 0)
                {
                    Session["IDTK"] = user.FirstOrDefault().IDTK;
                    Session["MatKhau"] = user.FirstOrDefault().MatKhau;
                    Session["Ten"] = user.FirstOrDefault().Ten;
                    Session["DiaChi"] = user.FirstOrDefault().DiaChi;
                    Session["sodienthoai"] = user.FirstOrDefault().SDT;
                    Session["VaiTro"] = user.FirstOrDefault().VaiTro;
                    if (Session["VaiTro"].Equals(true))
                    {
                        return RedirectToAction("Index");
                    }
                }
                else
                {
                    ViewBag.error = "Sai tên đăng nhập hoặc mật khẩu";
                }
            }
            return View();
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }
    }
}