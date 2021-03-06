USE [Hotel_Management]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[idb] [nvarchar](50) NOT NULL,
	[idr] [nvarchar](50) NOT NULL,
	[idc] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
	[checkin] [datetime] NOT NULL,
	[checkout] [datetime] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[idb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[idc] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[expense]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expense](
	[ide] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[kind] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_expense] PRIMARY KEY CLUSTERED 
(
	[ide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manager]    Script Date: 1/6/2021 9:44:59 PM ******/
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
	[cmnd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_manager] PRIMARY KEY CLUSTERED 
(
	[idm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[idrp] [nvarchar](50) NOT NULL,
	[month] [nvarchar](50) NOT NULL,
	[year] [nvarchar](50) NOT NULL,
	[roomsum] [float] NOT NULL,
	[servicesum] [float] NOT NULL,
	[costsum] [money] NOT NULL,
 CONSTRAINT [PK_report] PRIMARY KEY CLUSTERED 
(
	[idrp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[idr] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[room_service]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room_service](
	[idrs] [nvarchar](50) NOT NULL,
	[idr] [nvarchar](50) NOT NULL,
	[ids] [nvarchar](50) NOT NULL,
	[time] [smalldatetime] NOT NULL,
	[number] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_room_service] PRIMARY KEY CLUSTERED 
(
	[idrs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[ids] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[kind] [nvarchar](50) NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[ids] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_customer] FOREIGN KEY([idc])
REFERENCES [dbo].[customer] ([idc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_customer]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_room] FOREIGN KEY([idr])
REFERENCES [dbo].[room] ([idr])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_room]
GO
ALTER TABLE [dbo].[room_service]  WITH CHECK ADD  CONSTRAINT [FK_room_service_room] FOREIGN KEY([idr])
REFERENCES [dbo].[room] ([idr])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[room_service] CHECK CONSTRAINT [FK_room_service_room]
GO
ALTER TABLE [dbo].[room_service]  WITH CHECK ADD  CONSTRAINT [FK_room_service_service] FOREIGN KEY([ids])
REFERENCES [dbo].[service] ([ids])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[room_service] CHECK CONSTRAINT [FK_room_service_service]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoomList]    Script Date: 1/6/2021 9:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetRoomList]
AS SELECT * FROM dbo.room
GO
