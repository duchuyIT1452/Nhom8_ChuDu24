using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
    }
}