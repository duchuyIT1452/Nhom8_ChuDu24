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
            return View();
        }
        public PartialViewResult _DsKhachSan()
        {
            var khachSans = db.KhachSans.Select(p => p);
            return PartialView(khachSans);
        }
        public ActionResult TopKhuyenMai()
        {
            return View();
        }
        public PartialViewResult _SearchKhachSan()
        {
            int ID = int.Parse(Request["city"]);
            var khachSans = db.KhachSans.Where(p => p.IDThanhPho == ID);
            return PartialView(khachSans);
        }

        public ActionResult Detail(string id)
        {
            int maKS = int.Parse(id);
            var phongKS = db.PhongKS.Where(p => p.IDKS.Equals(maKS));
            return View(phongKS.ToList());
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
