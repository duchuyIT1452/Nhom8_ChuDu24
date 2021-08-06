namespace Nhom8_ChuDu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachSan")]
    public partial class KhachSan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachSan()
        {
            PhongKS = new HashSet<PhongK>();
            LoaiKS = new HashSet<LoaiK>();
        }

        [Key]
        public int IDKS { get; set; }

        public string Ten { get; set; }

        public string ThanhPho { get; set; }

        public string DiaChi { get; set; }

        public string Anh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhongK> PhongKS { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoaiK> LoaiKS { get; set; }
    }
}
