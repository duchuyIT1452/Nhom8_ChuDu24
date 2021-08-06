namespace Nhom8_ChuDu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietKhuyenMai")]
    public partial class ChiTietKhuyenMai
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDKhuyenMai { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDPhongKS { get; set; }

        [Column(TypeName = "money")]
        public decimal? Gia { get; set; }

        public string ThoiGian { get; set; }

        public virtual KhuyenMai KhuyenMai { get; set; }

        public virtual PhongK PhongK { get; set; }
    }
}
