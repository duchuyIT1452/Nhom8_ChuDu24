using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Nhom8_ChuDu.Models;
using PagedList;

namespace Nhom8_ChuDu.Controllers
{
    public class KhachSansController : Controller
    {
        private ChuDu24 db = new ChuDu24();

        // GET: KhachSans
        public ActionResult Index(string sortOrder, string searchString, string currentFilter, int ?page)
        {
            //các biến sắp xếp
            ViewBag.CurrentSort = sortOrder;

            ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";

            //lấy giá trị của bộ lọc dữ liệu hiện tại
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;

            var khachSans = db.KhachSans.Include(k => k.ThanhPho);

            //lọc theo tên hàng
            if (!String.IsNullOrEmpty(searchString))
            {
                khachSans = khachSans.Where(k => k.Ten.Contains(searchString));
            }
            switch (sortOrder)
            {
                case "ten_desc":
                    khachSans = khachSans.OrderByDescending(k => k.Ten);
                    break;
                default:
                    khachSans = khachSans.OrderBy(k => k.Ten);
                    break;
            }

            khachSans = khachSans.OrderBy(k => k.IDKS);
            int pageSize = 5;
            int pageNumber = (page ?? 1);

            return View(khachSans.ToPagedList(pageNumber,pageSize));
        }
        public PartialViewResult _DsKhachSan()
        {
            var khachSans = db.KhachSans.Select(p => p);
            return PartialView(khachSans);
        }

        public ActionResult Detail(string id)
        {
            int maKS = int.Parse(id);
            var phongKS = db.PhongKS.Where(p => p.IDKS.Equals(maKS));
            return View(phongKS.ToList());
        }

        // GET: KhachSans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachSan khachSan = db.KhachSans.Find(id);
            if (khachSan == null)
            {
                return HttpNotFound();
            }
            return View(khachSan);
        }

        // GET: KhachSans/Create
        public ActionResult Create()
        {
            ViewBag.IDThanhPho = new SelectList(db.ThanhPhoes, "IDThanhPho", "Ten");
            return View();
        }

        // POST: KhachSans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDKS,Ten,DiaChi,Anh,MoTa,IDThanhPho")] KhachSan khachSan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    khachSan.Anh = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UpLoadPath = Server.MapPath("~/Image/Khách Sạn/" + FileName);
                        f.SaveAs(UpLoadPath);
                        khachSan.Anh = FileName;
                    }
                    db.KhachSans.Add(khachSan);
                    db.SaveChanges();
                }
                    return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu !" + ex.Message;
                ViewBag.IDThanhPho = new SelectList(db.ThanhPhoes, "IDThanhPho", "Ten", khachSan.IDThanhPho);
                return View(khachSan);
            }
        }

        // GET: KhachSans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachSan khachSan = db.KhachSans.Find(id);
            if (khachSan == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDThanhPho = new SelectList(db.ThanhPhoes, "IDThanhPho", "Ten", khachSan.IDThanhPho);
            return View(khachSan);
        }

        // POST: KhachSans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDKS,Ten,DiaChi,Anh,MoTa,IDThanhPho")] KhachSan khachSan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    khachSan.Anh = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        string UpLoadPath = Server.MapPath("~/Image/Khách Sạn/" + FileName);
                        f.SaveAs(UpLoadPath);
                        khachSan.Anh = FileName;
                    }
                    db.Entry(khachSan).State = EntityState.Modified;
                    db.SaveChanges();
                }
                    return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu !" + ex.Message;
                ViewBag.IDThanhPho = new SelectList(db.ThanhPhoes, "IDThanhPho", "Ten", khachSan.IDThanhPho);
                return View(khachSan);
            }
        }

        // GET: KhachSans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachSan khachSan = db.KhachSans.Find(id);
            if (khachSan == null)
            {
                return HttpNotFound();
            }
            return View(khachSan);
        }

        // POST: KhachSans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            KhachSan khachSan = db.KhachSans.Find(id);
            try
            {
                db.KhachSans.Remove(khachSan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Không được xóa bản ghi này !" + ex.Message;
                return View("Delete", khachSan);
            }
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
