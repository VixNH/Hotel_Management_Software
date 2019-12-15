USE [master]
GO
/****** Object:  Database [Hotel_Management]    Script Date: 12/15/2019 10:03:23 PM ******/
CREATE DATABASE [Hotel_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hotel_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hotel_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hotel_Management] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel_Management] SET QUERY_STORE = OFF
GO
USE [Hotel_Management]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 12/15/2019 10:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[idb] [int] IDENTITY(1,1) NOT NULL,
	[idr] [int] NOT NULL,
	[idc] [int] NOT NULL,
	[idm] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
	[checkin] [datetime] NOT NULL,
	[checkout] [datetime] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[idb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 12/15/2019 10:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[idc] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[cmnd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[idc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager]    Script Date: 12/15/2019 10:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manager](
	[idm] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[level] [int] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[cmnd] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 12/15/2019 10:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[idr] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
	[bedamount] [int] NOT NULL,
	[roomkind] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[idr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room_service]    Script Date: 12/15/2019 10:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room_service](
	[idrs] [int] IDENTITY(1,1) NOT NULL,
	[idr] [int] NOT NULL,
	[ids] [int] NOT NULL,
	[time] [smalldatetime] NOT NULL,
	[number] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_room_service] PRIMARY KEY CLUSTERED 
(
	[idrs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 12/15/2019 10:03:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[ids] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[kind] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[ids] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Hotel_Management] SET  READ_WRITE 
GO
