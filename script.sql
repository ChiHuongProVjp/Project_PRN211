USE [master]
GO
/****** Object:  Database [Student_management]    Script Date: 7/10/2022 2:07:56 AM ******/
CREATE DATABASE [Student_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Student_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Student_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Student_management] SET  MULTI_USER 
GO
ALTER DATABASE [Student_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Student_management] SET QUERY_STORE = OFF
GO
USE [Student_management]
GO
USE [Student_management]
GO
/****** Object:  Sequence [dbo].[sinhvienSeq]    Script Date: 7/10/2022 2:07:56 AM ******/
CREATE SEQUENCE [dbo].[sinhvienSeq] 
 AS [bigint]
 START WITH 1100
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 7/10/2022 2:07:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[tentaikhoan] [varchar](50) NOT NULL,
	[matkhau] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiem]    Script Date: 7/10/2022 2:07:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiem](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](50) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](50) NULL,
	[mamonhoc] [int] NOT NULL,
	[magiaovien] [int] NOT NULL,
	[masinhvien] [varchar](50) NOT NULL,
	[lanhoc] [int] NOT NULL,
	[diemthilan1] [float] NULL,
	[diemthilan2] [float] NULL,
 CONSTRAINT [PK_tblDiem] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC,
	[magiaovien] ASC,
	[masinhvien] ASC,
	[lanhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGiaoVien]    Script Date: 7/10/2022 2:07:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiaoVien](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](50) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](50) NULL,
	[magiaovien] [int] IDENTITY(1,1) NOT NULL,
	[ho] [nvarchar](50) NOT NULL,
	[tendem] [nvarchar](50) NULL,
	[ten] [nvarchar](50) NOT NULL,
	[gioitinh] [tinyint] NULL,
	[ngaysinh] [date] NULL,
	[dienthoai] [varchar](50) NULL,
	[email] [varchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblGiaoVien] PRIMARY KEY CLUSTERED 
(
	[magiaovien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 7/10/2022 2:07:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonHoc](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](50) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](50) NULL,
	[mamonhoc] [int] IDENTITY(1,1) NOT NULL,
	[tenmonhoc] [nchar](10) NOT NULL,
	[sotinchi] [int] NULL,
 CONSTRAINT [PK_tblMonHoc] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 7/10/2022 2:07:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[ngaytao] [datetime] NULL,
	[nguoitao] [varchar](50) NULL,
	[ngaycapnhat] [datetime] NULL,
	[nguoicapnhat] [varchar](50) NULL,
	[masinhvien] [varchar](50) NOT NULL,
	[ho] [nvarchar](50) NOT NULL,
	[tendem] [nvarchar](50) NULL,
	[ten] [nvarchar](50) NOT NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [tinyint] NULL,
	[quequan] [nvarchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
	[dienthoai] [varchar](50) NULL,
	[email] [varchar](150) NULL,
 CONSTRAINT [PK_tblSinhVien] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblDiem] ADD  CONSTRAINT [DF_tblDiem_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  CONSTRAINT [DF_tblGiaoVien_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_ngaytao_1]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  CONSTRAINT [DF_tblMonHoc_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngaytao]  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoitao]  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngaycapnhat]  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoicapnhat]  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblGiaoVien] FOREIGN KEY([magiaovien])
REFERENCES [dbo].[tblGiaoVien] ([magiaovien])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblGiaoVien]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblMonHoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[tblMonHoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblMonHoc]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblSinhVien] FOREIGN KEY([masinhvien])
REFERENCES [dbo].[tblSinhVien] ([masinhvien])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblSinhVien]
GO
USE [master]
GO
ALTER DATABASE [Student_management] SET  READ_WRITE 
GO
