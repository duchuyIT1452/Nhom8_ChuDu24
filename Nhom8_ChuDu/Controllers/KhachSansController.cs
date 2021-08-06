using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom8_ChuDu.Models;

namespace Nhom8_ChuDu.Controllers
{
    public class KhachSansController : Controller
    {
        private ChuDu24 db = new ChuDu24();

        // GET: KhachSans
        public ActionResult Index()
        {
            var khachSans = db.KhachSans.Select(p => p);
            return View(khachSans.ToList());
        }
        public PartialViewResult _DsKhachSan()
        {
            var khachSans = db.KhachSans.Select(p => p);
            return PartialView(khachSans);
        }

        // GET: KhachSans/Details/5

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
