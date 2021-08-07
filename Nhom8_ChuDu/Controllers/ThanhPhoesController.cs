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
    public class ThanhPhoesController : Controller
    {
        private ChuDu24 db = new ChuDu24();

        // GET: ThanhPhoes
        public ActionResult Index()
        {
            return View(db.ThanhPhoes.ToList());
        }

        // GET: ThanhPhoes/Details/5
        public PartialViewResult _DsThanhPho()
        {
            var thanhPhoes = db.ThanhPhoes.Select(p => p);
            return PartialView(thanhPhoes);
        }
        public PartialViewResult _SearchThanhPho()
        {
            var thanhPhoes = db.ThanhPhoes.Select(p => p);
            return PartialView(thanhPhoes);
        }
    }
}
