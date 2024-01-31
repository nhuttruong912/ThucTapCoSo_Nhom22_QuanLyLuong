USE [master]
GO
CREATE DATABASE [QuanLyLuong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyLuong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyLuong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyLuong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyLuong_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyLuong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyLuong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyLuong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyLuong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyLuong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyLuong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyLuong] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyLuong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyLuong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyLuong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyLuong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyLuong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyLuong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyLuong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyLuong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyLuong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyLuong] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyLuong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyLuong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyLuong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyLuong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyLuong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyLuong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyLuong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyLuong] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyLuong] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyLuong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyLuong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyLuong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyLuong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyLuong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyLuong] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyLuong', N'ON'
GO
ALTER DATABASE [QuanLyLuong] SET QUERY_STORE = OFF
GO
USE [QuanLyLuong]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Cham Cong Nhan Vien*/
CREATE FUNCTION [dbo].[AUTO_IDCCNV]()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(MACONG) FROM CHAMCONGNHANVIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MACONG, 3)) FROM CHAMCONGNHANVIEN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'C00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'C0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDCL]    Script Date: 5/28/2023 8:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Ca Lam*/
CREATE FUNCTION [dbo].[AUTO_IDCL]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MACA) FROM CALAMVIEC) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MACA, 3)) FROM CALAMVIEC
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CL00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CL0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Cong Nhan*/
CREATE FUNCTION [dbo].[AUTO_IDCN]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MACN) FROM CONGNHAN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MACN, 3)) FROM CONGNHAN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CN00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CN0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table He So Luong*/
CREATE FUNCTION [dbo].[AUTO_IDHSL]()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(MAHSL) FROM HESOLUONG) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAHSL, 3)) FROM HESOLUONG
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'HSL00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'HSL0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Luong Cong Nhan*/
CREATE FUNCTION [dbo].[AUTO_IDLCN]()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(MALUONG) FROM LUONGCONGNHAN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MALUONG, 3)) FROM LUONGCONGNHAN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'L00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'L0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Luong Nhan Vien*/
CREATE FUNCTION [dbo].[AUTO_IDLNV]()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(MALUONG) FROM LUONGNHANVIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MALUONG, 3)) FROM LUONGNHANVIEN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'L00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'L0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Nhan Vien Hanh Chinh*/
CREATE FUNCTION [dbo].[AUTO_IDNV]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MANV) FROM NHANVIEN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MANV, 3)) FROM NHANVIEN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Phong Ban*/
CREATE FUNCTION [dbo].[AUTO_IDPB]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MAPB) FROM PHONGBAN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MAPB, 3)) FROM PHONGBAN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PB00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PB0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*table Tai Khoan*/
CREATE FUNCTION [dbo].[AUTO_IDTK]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MATK) FROM TAIKHOAN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MATK, 3)) FROM TAIKHOAN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TK00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TK0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaLamViec](
	[MACA] [char](5) NOT NULL,
	[TENCA] [nvarchar](30) NOT NULL,
	[GIOLAM] [nvarchar](30) NOT NULL,
	[CALAM] [nvarchar](30) NOT NULL,
	[LUONGCA] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MACA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCongNhanVien](
	[MACONG] [char](4) NOT NULL,
	[NGAYCHAM] [date] NULL,
	[TRANGTHAI] [int] NULL,
	[NGHIPHEP] [int] NULL,
	[MACA] [char](5) NOT NULL,
	[MANV] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MACONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeSoLuong](
	[MAHSL] [char](6) NOT NULL,
	[HESOLUONG] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHSL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuongNhanVien](
	[MALUONG] [char](4) NOT NULL,
	[THANG] [int] NULL,
	[NAM] [int] NULL,
	[LUONG] [float] NULL,
	[MANV] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MALUONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [char](5) NOT NULL,
	[HOTEN] [nvarchar](60) NOT NULL,
	[CMND] [int] NULL,
	[NGAYSINH] [date] NULL,
	[GIOITINH] [nvarchar](10) NULL,
	[LUONGCOBAN] [float] NULL,
	[SODIENTHOAI] [varchar](11) NULL,
	[DIACHI] [nvarchar](60) NULL,
	[PHUCAP] [float] NULL,
	[MAHSL] [char](6) NOT NULL,
	[MAPB] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MAPB] [char](5) NOT NULL,
	[TENPHONGBAN] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MATK] [char](5) NOT NULL,
	[TENDN] [nvarchar](30) NOT NULL,
	[MATKHAU] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MATK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CaLamViec] ADD  CONSTRAINT [IDCL]  DEFAULT ([DBO].[AUTO_IDCL]()) FOR [MACA]
GO
ALTER TABLE [dbo].[ChamCongNhanVien] ADD  CONSTRAINT [IDCCNV]  DEFAULT ([DBO].[AUTO_IDCCNV]()) FOR [MACONG]
GO
ALTER TABLE [dbo].[HeSoLuong] ADD  CONSTRAINT [IDHSL]  DEFAULT ([DBO].[AUTO_IDHSL]()) FOR [MAHSL]
GO
ALTER TABLE [dbo].[LuongNhanVien] ADD  CONSTRAINT [IDLNV]  DEFAULT ([DBO].[AUTO_IDLNV]()) FOR [MALUONG]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [IDNV]  DEFAULT ([DBO].[AUTO_IDNV]()) FOR [MANV]
GO
ALTER TABLE [dbo].[PhongBan] ADD  CONSTRAINT [IDPB]  DEFAULT ([DBO].[AUTO_IDPB]()) FOR [MAPB]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [IDTK]  DEFAULT ([DBO].[AUTO_IDTK]()) FOR [MATK]
GO
ALTER TABLE [dbo].[ChamCongNhanVien]  WITH CHECK ADD  CONSTRAINT [fk_MaCaLamNV] FOREIGN KEY([MACA])
REFERENCES [dbo].[CaLamViec] ([MACA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChamCongNhanVien] CHECK CONSTRAINT [fk_MaCaLamNV]
GO
ALTER TABLE [dbo].[ChamCongNhanVien]  WITH CHECK ADD  CONSTRAINT [fk_MaNVCC] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChamCongNhanVien] CHECK CONSTRAINT [fk_MaNVCC]
GO
ALTER TABLE [dbo].[LuongNhanVien]  WITH CHECK ADD  CONSTRAINT [fk_MaNVL] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LuongNhanVien] CHECK CONSTRAINT [fk_MaNVL]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [fk_MaHSLNV] FOREIGN KEY([MAHSL])
REFERENCES [dbo].[HeSoLuong] ([MAHSL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [fk_MaHSLNV]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [fk_MaPhongBanNV] FOREIGN KEY([MAPB])
REFERENCES [dbo].[PhongBan] ([MAPB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [fk_MaPhongBanNV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_CCNV]
as
	SELECT * FROM [dbo].[ChamCongNhanVien]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_CLV]
as
	SELECT * FROM [dbo].[CaLamViec]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_CN]
as
	SELECT * FROM [dbo].[CongNhan]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_HSL]
as
	SELECT * FROM [dbo].[HeSoLuong]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_LCN]
as
	SELECT * FROM [dbo].[LuongCongNhan]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_LNV]
as
	SELECT * FROM [dbo].[LuongNhanVien]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_NV]
as
	SELECT * FROM [dbo].[NhanVien]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_PB]
as
	SELECT * FROM [dbo].[PhongBan]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[select_TaiKhoan]
as
	SELECT * FROM [dbo].[TaiKhoan]

GO
USE [master]
GO
ALTER DATABASE [QuanLyLuong] SET  READ_WRITE 
GO
