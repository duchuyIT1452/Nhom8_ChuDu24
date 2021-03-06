USE [master]
GO
/****** Object:  Database [CHUDU]    Script Date: 8/6/2021 12:23:25 PM ******/
CREATE DATABASE [CHUDU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CHUDU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CHUDU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CHUDU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CHUDU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CHUDU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHUDU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHUDU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CHUDU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CHUDU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CHUDU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CHUDU] SET ARITHABORT OFF 
GO
ALTER DATABASE [CHUDU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CHUDU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CHUDU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CHUDU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CHUDU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CHUDU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CHUDU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CHUDU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CHUDU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CHUDU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CHUDU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CHUDU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CHUDU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CHUDU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CHUDU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CHUDU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CHUDU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CHUDU] SET RECOVERY FULL 
GO
ALTER DATABASE [CHUDU] SET  MULTI_USER 
GO
ALTER DATABASE [CHUDU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CHUDU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CHUDU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CHUDU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CHUDU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CHUDU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CHUDU', N'ON'
GO
ALTER DATABASE [CHUDU] SET QUERY_STORE = OFF
GO
USE [CHUDU]
GO
/****** Object:  Table [dbo].[ChiTietKhuyenMai]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKhuyenMai](
	[IDKhuyenMai] [int] NOT NULL,
	[IDPhongKS] [int] NOT NULL,
	[Gia] [money] NULL,
	[ThoiGian] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChiTietKhuyenMai] PRIMARY KEY CLUSTERED 
(
	[IDKhuyenMai] ASC,
	[IDPhongKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLoaiKS]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLoaiKS](
	[IDKS] [int] NOT NULL,
	[IDLoaiKS] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietLoaiKS] PRIMARY KEY CLUSTERED 
(
	[IDKS] ASC,
	[IDLoaiKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatPhong](
	[IDDatPhong] [int] IDENTITY(1,1) NOT NULL,
	[IDPhongKS] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[SDT] [nvarchar](max) NULL,
	[ThoiGian] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[IDDatPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachSan]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachSan](
	[IDKS] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[ThanhPho] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Anh] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachSan] PRIMARY KEY CLUSTERED 
(
	[IDKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[IDKhuyenMai] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[IDKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKS]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKS](
	[IDLoaiKs] [int] IDENTITY(1,1) NOT NULL,
	[Loai] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiKS] PRIMARY KEY CLUSTERED 
(
	[IDLoaiKs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongKS]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongKS](
	[IDPhongKS] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[Loai] [nvarchar](max) NULL,
	[Gia] [money] NULL,
	[MoTa] [nvarchar](max) NULL,
	[IDKS] [int] NOT NULL,
 CONSTRAINT [PK_PhongKS] PRIMARY KEY CLUSTERED 
(
	[IDPhongKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/6/2021 12:23:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IDTK] [int] IDENTITY(1,1) NOT NULL,
	[MatKhau] [nchar](16) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [nchar](16) NOT NULL,
	[VaiTro] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DatPhong] ON 

INSERT [dbo].[DatPhong] ([IDDatPhong], [IDPhongKS], [Email], [SDT], [ThoiGian], [SoLuong]) VALUES (7, 145, N'duchuy@gmail.com', N'9482377877', N'1 ngày', 2)
INSERT [dbo].[DatPhong] ([IDDatPhong], [IDPhongKS], [Email], [SDT], [ThoiGian], [SoLuong]) VALUES (8, 146, N'tienhuy@gmail.com', N'9698789878', N'2 ngày', 2)
INSERT [dbo].[DatPhong] ([IDDatPhong], [IDPhongKS], [Email], [SDT], [ThoiGian], [SoLuong]) VALUES (9, 147, N'huudung@gmail.com', N'3867845673', N'3 ngày', 2)
SET IDENTITY_INSERT [dbo].[DatPhong] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachSan] ON 

INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (30, N'InterContinental Đà Nẵng Sun Peninsula Resort', N'Đà Nẵng', N'Bãi Bắc, bán đảo Sơn Trà, Đà Nẵng  ', N'130505661.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (31, N'Sheraton Grand Đà Nẵng Resort', N'Đà Nẵng', N'35 Trường Sa, Phường Hòa Hải, Quận Ngũ Hành Sơn, Đà Nẵng', N'46753234781-eb34a58a12-k-1152533.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (32, N'Hyatt Regency Danang Resort & Spa', N'Đà Nẵng', N'Phường Hòa Hải, Ngũ Hành Sơn, Đà Nẵng ', N'4c48b87b87ca7e9427db15-1021494.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (33, N'Furama Đà Nẵng Resort', N'Đà Nẵng', N'Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Đà Nẵng ', N'amanoi-khanh-hoa-3.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (34, N'Pullman Danang Beach Resort', N'Đà Nẵng', N'Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Đà Nẵng ', N'amanoi-resort-ninh-thuan-1.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (35, N'Premier Village Danang Resort Managed by Accor', N'Đà Nẵng', N'Đường Võ Nguyên Giáp, Quận Ngũ Hành Sơn, Đà Nẵng ', N'anantara-mui-ne-resort.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (36, N'Khách sạn Mường Thanh Luxury Đà Nẵng', N'Đà Nẵng', N'270 Võ Nguyên Giáp, P. Mỹ An, Q. Ngũ Hành Sơn, Đà Nẵng', N'deluxe-villa-exterior-1600166.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (37, N'Vinpearl Đà Nẵng Resort & Spa', N'Đà Nẵng', N'Đường Trường Sa, Phường Hòa Hải, Quận Ngũ Hành Sơn, Đà Nẵng', N'khach-san-fusion-suites-vung-tau-8.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (38, N'Khách sạn Golden Bay Đà Nẵng', N'Đà Nẵng', N'01 Lê Văn Duyệt, Quận Sơn Trà, Đà Nẵng', N'khach-san-intercontinental-nha-trang-0.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (39, N'Khách sạn Four Points by Sheraton Danang', N'Đà Nẵng', N'118 - 120 Võ Nguyên Giáp, Phường Phước Mỹ, Quận Sơn Trà, Đà Nẵng', N'khach-san-seashells-phu-quoc-1.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (40, N'InterContinental Nha Trang', N'Đà Nẵng', N'118 - Võ Thị Sáu - Liên Chiểu', N'melia-ho-tram-6701-1632578.jpg')
INSERT [dbo].[KhachSan] ([IDKS], [Ten], [ThanhPho], [DiaChi], [Anh]) VALUES (41, N'Vinoasis Phú Quốc', N'Kiên Giang', N'Phú Quốc', N'minera-binh-chau-hot-spring-resort.jpg')
SET IDENTITY_INSERT [dbo].[KhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (11, N'Khuyến mãi InterContinental Đà Nẵng Sun Peninsula Resort', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (12, N'Khuyến mãi Sheraton Grand Đà Nẵng Resort', N'Khuyến mãi mừng khai trương')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (13, N'Khuyến mãi Hyatt Regency Danang Resort & Spa', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (14, N'Khuyến mãi Furama Đà Nẵng Resort', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (15, N'Khuyến mãi Pullman Danang Beach Resort', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (16, N'Khuyến mãi Premier Village Danang Resort Managed by Accor', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (17, N'Khuyến mãi khách sạn Mường Thanh Luxury Đà Nẵng', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (18, N'Khuyến mãi Vinpearl Đà Nẵng Resort & Spa', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (19, N'Khuyến mãi khách sạn Golden Bay Đà Nẵng', N'Khuyến mãi chào hè')
INSERT [dbo].[KhuyenMai] ([IDKhuyenMai], [Ten], [MoTa]) VALUES (20, N'Khuyến mãi khách sạn Four Points by Sheraton Danang', N'Khuyến mãi chào hè')
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiKS] ON 

INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (8, N'Khách sạn 1 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (9, N'Khách sạn 2 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (10, N'Khách sạn 3 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (11, N'Khách sạn 4 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (12, N'Khách sạn 5 sao')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (13, N'Khách sạn gần biển')
INSERT [dbo].[LoaiKS] ([IDLoaiKs], [Loai]) VALUES (14, N'Khách sạn gần trung tâm thành phố')
SET IDENTITY_INSERT [dbo].[LoaiKS] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongKS] ON 

INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (145, N'101', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (146, N'102', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (147, N'103', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (148, N'104', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng trệt', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (149, N'201', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (150, N'202', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (151, N'203', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (152, N'204', N'Tiêu chuẩn', 1200000.0000, N'Phòng tầng hai', 30)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (153, N'301', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (154, N'302', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (155, N'303', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (156, N'304', N'Cao cấp', 1700000.0000, N'Phòng tầng ba', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (157, N'401', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (158, N'402', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (159, N'403', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (160, N'404', N'Cao cấp', 1900000.0000, N'Phòng tầng bốn', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (161, N'501', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (162, N'502', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (163, N'503', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (164, N'504', N'Cao cấp', 2000000.0000, N'Phòng tầng năm', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (165, N'601', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (166, N'602', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (167, N'603', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (168, N'604', N'Hạng sang', 2500000.0000, N'Phòng tầng sáu', 31)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (169, N'101', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (170, N'102', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (171, N'103', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (172, N'104', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng trệt', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (173, N'201', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (174, N'202', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (175, N'203', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (176, N'204', N'Tiêu chuẩn', 1100000.0000, N'Phòng tầng hai', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (177, N'301', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (178, N'302', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (179, N'303', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (180, N'304', N'Cao cấp', 1500000.0000, N'Phòng tầng ba', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (181, N'401', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (182, N'402', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (183, N'403', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (184, N'404', N'Cao cấp', 1600000.0000, N'Phòng tầng bốn', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (185, N'501', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (186, N'502', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (187, N'503', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (188, N'504', N'Cao cấp', 1800000.0000, N'Phòng tầng năm', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (189, N'601', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (190, N'602', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (191, N'603', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (192, N'604', N'Hạng sang', 2000000.0000, N'Phòng tầng sáu', 32)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (193, N'101', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (194, N'102', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (195, N'103', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (196, N'104', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng trệt', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (197, N'201', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (198, N'202', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (199, N'203', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (200, N'204', N'Tiêu chuẩn', 1000000.0000, N'Phòng tầng hai', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (201, N'301', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (202, N'302', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (203, N'303', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (204, N'304', N'Cao cấp', 12500000.0000, N'Phòng tầng ba', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (205, N'401', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (206, N'402', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (207, N'403', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (208, N'404', N'Cao cấp', 1400000.0000, N'Phòng tầng bốn', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (209, N'501', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (210, N'502', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (211, N'503', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (212, N'504', N'Cao cấp', 1600000.0000, N'Phòng tầng năm', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (213, N'601', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (214, N'602', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (215, N'603', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
INSERT [dbo].[PhongKS] ([IDPhongKS], [Ten], [Loai], [Gia], [MoTa], [IDKS]) VALUES (216, N'604', N'Hạng sang', 1900000.0000, N'Phòng tầng sáu', 33)
SET IDENTITY_INSERT [dbo].[PhongKS] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([IDTK], [MatKhau], [Ten], [DiaChi], [SDT], [VaiTro]) VALUES (4, N'111111          ', N'Bùi Hữu Dũng', N'Hà Nội', N'0123456789      ', 1)
INSERT [dbo].[TaiKhoan] ([IDTK], [MatKhau], [Ten], [DiaChi], [SDT], [VaiTro]) VALUES (5, N'111111          ', N'Trần Đức Huy', N'Hà Tĩnh', N'0123456789      ', 1)
INSERT [dbo].[TaiKhoan] ([IDTK], [MatKhau], [Ten], [DiaChi], [SDT], [VaiTro]) VALUES (6, N'111111          ', N'Nguyễn Tiến Huy', N'Bắc Ninh', N'0123456789      ', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai] FOREIGN KEY([IDKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([IDKhuyenMai])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai]
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_Phong] FOREIGN KEY([IDPhongKS])
REFERENCES [dbo].[PhongKS] ([IDPhongKS])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_Phong]
GO
ALTER TABLE [dbo].[ChiTietLoaiKS]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiKS_KS] FOREIGN KEY([IDKS])
REFERENCES [dbo].[KhachSan] ([IDKS])
GO
ALTER TABLE [dbo].[ChiTietLoaiKS] CHECK CONSTRAINT [FK_ChiTietLoaiKS_KS]
GO
ALTER TABLE [dbo].[ChiTietLoaiKS]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietLoaiKS_LoaiKS] FOREIGN KEY([IDLoaiKS])
REFERENCES [dbo].[LoaiKS] ([IDLoaiKs])
GO
ALTER TABLE [dbo].[ChiTietLoaiKS] CHECK CONSTRAINT [FK_ChiTietLoaiKS_LoaiKS]
GO
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_Phong] FOREIGN KEY([IDPhongKS])
REFERENCES [dbo].[PhongKS] ([IDPhongKS])
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_Phong]
GO
ALTER TABLE [dbo].[PhongKS]  WITH CHECK ADD  CONSTRAINT [FK_PhongKS_KS] FOREIGN KEY([IDKS])
REFERENCES [dbo].[KhachSan] ([IDKS])
GO
ALTER TABLE [dbo].[PhongKS] CHECK CONSTRAINT [FK_PhongKS_KS]
GO
USE [master]
GO
ALTER DATABASE [CHUDU] SET  READ_WRITE 
GO
