namespace Nhom8_ChuDu.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [Key]
        public int IDTK { get; set; }

        [Required]
        [StringLength(16)]
        public string MatKhau { get; set; }

        [Required]
        public string Ten { get; set; }

        [Required]
        public string DiaChi { get; set; }

        [Required]
        [StringLength(16)]
        public string SDT { get; set; }

        public bool VaiTro { get; set; }
    }
}
