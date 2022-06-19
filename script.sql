USE [master]
GO
/****** Object:  Database [Demo_ADO]    Script Date: 6/19/2022 4:16:21 PM ******/
CREATE DATABASE [Demo_ADO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Demo_ADO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\DATA\Demo_ADO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Demo_ADO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\DATA\Demo_ADO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Demo_ADO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Demo_ADO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Demo_ADO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Demo_ADO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Demo_ADO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Demo_ADO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Demo_ADO] SET ARITHABORT OFF 
GO
ALTER DATABASE [Demo_ADO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Demo_ADO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Demo_ADO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Demo_ADO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Demo_ADO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Demo_ADO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Demo_ADO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Demo_ADO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Demo_ADO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Demo_ADO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Demo_ADO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Demo_ADO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Demo_ADO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Demo_ADO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Demo_ADO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Demo_ADO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Demo_ADO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Demo_ADO] SET RECOVERY FULL 
GO
ALTER DATABASE [Demo_ADO] SET  MULTI_USER 
GO
ALTER DATABASE [Demo_ADO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Demo_ADO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Demo_ADO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Demo_ADO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Demo_ADO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Demo_ADO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Demo_ADO', N'ON'
GO
ALTER DATABASE [Demo_ADO] SET QUERY_STORE = OFF
GO
USE [Demo_ADO]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/19/2022 4:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/19/2022 4:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[address] [nvarchar](4000) NULL,
	[phone] [varchar](10) NULL,
	[department] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([id], [name]) VALUES (1, N'SE')
INSERT [dbo].[Department] ([id], [name]) VALUES (2, N'AI')
INSERT [dbo].[Department] ([id], [name]) VALUES (3, N'IA')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (9, N'Nguyen Anh Duc', 0, CAST(N'2001-03-09' AS Date), N'Dong Anh', N'1231232132', 1)
INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (10, N'Dinh Xuan Hoang', 1, CAST(N'2001-09-09' AS Date), N'Hai Phong', N'1231423121', 1)
INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (11, N'Vu Xuan Tung', 0, CAST(N'2001-11-04' AS Date), N'Ha Noi', N'0912312312', 3)
INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (12, N'Ha Duy Bach', 1, CAST(N'2000-01-01' AS Date), N'Bac Ninh', N'0121212212', 1)
INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (13, N'Nguyen Van Ngoc', 0, CAST(N'2003-09-12' AS Date), N'Trung Quoc', N'1201293912', 1)
INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (14, N'Nguyen Ngoc Anh', 1, CAST(N'1999-12-20' AS Date), N'Ca Mau', N'1231213321', 2)
INSERT [dbo].[Student] ([id], [Name], [gender], [dob], [address], [phone], [department]) VALUES (24, N'Dao Tuyet Hoa', 1, CAST(N'2022-06-02' AS Date), N'1', N'111111', 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department1] FOREIGN KEY([department])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department1]
GO
USE [master]
GO
ALTER DATABASE [Demo_ADO] SET  READ_WRITE 
GO
