namespace Nhom8_ChuDu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhongKS")]
    public partial class PhongK
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhongK()
        {
            ChiTietKhuyenMais = new HashSet<ChiTietKhuyenMai>();
            DatPhongs = new HashSet<DatPhong>();
        }

        [Key]
        public int IDPhongKS { get; set; }

        public string Ten { get; set; }

        public string Loai { get; set; }

        [Column(TypeName = "money")]
        public decimal? Gia { get; set; }

        public string MoTa { get; set; }

        public int IDKS { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietKhuyenMai> ChiTietKhuyenMais { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DatPhong> DatPhongs { get; set; }

        public virtual KhachSan KhachSan { get; set; }
    }
}
