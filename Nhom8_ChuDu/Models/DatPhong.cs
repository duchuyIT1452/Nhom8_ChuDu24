namespace Nhom8_ChuDu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DatPhong")]
    public partial class DatPhong
    {
        [Key]
        public int IDDatPhong { get; set; }

        public int IDPhongKS { get; set; }

        public string Email { get; set; }

        public string SDT { get; set; }

        public string ThoiGian { get; set; }

        public int? SoLuong { get; set; }

        public virtual PhongK PhongK { get; set; }
    }
}
