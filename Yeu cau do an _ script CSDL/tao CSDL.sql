drop table webpages_UsersInRoles
go
drop table webpages_Roles
go
drop table webpages_OAuthMembership
go
drop table webpages_Membership
go
drop table UserProfile
go


--USE [master]
--GO
--/****** Object:  Database [MobishopNew]    Script Date: 12/5/2013 7:09:11 PM ******/
--CREATE DATABASE [MobishopNew]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'MobishopNew', FILENAME = N'C:\Users\Hoang\MobishopNew.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'MobishopNew_log', FILENAME = N'C:\Users\Hoang\MobishopNew_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
--ALTER DATABASE [MobishopNew] SET COMPATIBILITY_LEVEL = 110
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [MobishopNew].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [MobishopNew] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [MobishopNew] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [MobishopNew] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [MobishopNew] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [MobishopNew] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [MobishopNew] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [MobishopNew] SET AUTO_CREATE_STATISTICS ON 
--GO
--ALTER DATABASE [MobishopNew] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [MobishopNew] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [MobishopNew] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [MobishopNew] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [MobishopNew] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [MobishopNew] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [MobishopNew] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [MobishopNew] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [MobishopNew] SET  DISABLE_BROKER 
--GO
--ALTER DATABASE [MobishopNew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [MobishopNew] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [MobishopNew] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [MobishopNew] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [MobishopNew] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [MobishopNew] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [MobishopNew] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [MobishopNew] SET RECOVERY SIMPLE 
--GO
--ALTER DATABASE [MobishopNew] SET  MULTI_USER 
--GO
--ALTER DATABASE [MobishopNew] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [MobishopNew] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [MobishopNew] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [MobishopNew] SET TARGET_RECOVERY_TIME = 0 SECONDS 
--GO
--USE [MobishopNew]
--GO

/****** Object:  Table [dbo].[Company]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [nvarchar](200) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufacture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Position] [int] NULL,
	[LogoImage] [nvarchar](200) NULL,
	[NameUnsign] [varchar](200) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[TotalPrice] [money] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[IdentityCardNumber] [varchar](15) NULL,
	[CustomerId] [int] NULL,
	[OrderStatusId] [int] NULL,
	[ReceiveDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[PublicComment] [nvarchar](max) NULL,
	[PrivateComment] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[FullName] [nvarchar](500) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatusChangedLog]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatusChangedLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[PeopleRequestId] [int] NULL,
	[OldOrderStatusId] [int] NULL,
	[NewOrderStatusId] [int] NULL,
	[DateChange] [datetime] NULL,
	[Comment] [nvarchar](4000) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Price] [money] NULL,
	[Description] [nvarchar](max) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[Image] [nvarchar](300) NULL,
	[CreateDate] [datetime] NULL,
	[TotalView] [int] NOT NULL,
	[TotalSale] [int] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[ManufactureId] [int] NULL,
	[RegionId] [int] NULL,
	[NameUnsign] [varchar](200) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductComment]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ProductId] [int] NULL,
	[UserProfileId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastEditedDate] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Position] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Name] [nvarchar](300) NULL,
	[Address] [nvarchar](500) NULL,
	[Birthday] [datetime] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Banned] [bit] NOT NULL,
	[BannedReason] [nvarchar](500) NULL,
	[BannedExpireDate] [datetime] NULL,
	[Comment] [nvarchar](2000) NULL,
	[Email] [varchar](200) NOT NULL,
	[IdentityCardNumber] [varchar](15) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 12/5/2013 7:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Company] ([Id], [Name], [Address], [PhoneNumber], [Email], [Deleted], [DeletedDate]) VALUES (1, N'Công ty TNHH Trường An Co.Ltd', N'84 Lý Thái Tổ, P9, Q3, HCM', N'08540125062', N'truongan@yahoo.com.vn', 0, NULL)
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (1, N'Apple', 1, NULL, N'Apple', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (2, N'HTC', 2, NULL, N'HTC', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (3, N'Blackberry', 3, NULL, N'Blackberry', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (4, N'Nokia', 4, NULL, N'Nokia', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (5, N'Sony Ericsson', 5, NULL, N'Sony-Ericsson', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (6, N'Samsung', 6, NULL, N'Samsung', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (7, N'Philips', 7, NULL, N'Philips', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (8, N'Motorola', 8, NULL, N'Motorola', 0, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (9, N'Hello', 5, NULL, N'Hello', 1, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (10, N'dfddfdfdf', 99, NULL, N'dfddfdfdf', 1, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (11, N'ttt', 1, NULL, N'ttt', 1, NULL)
INSERT [dbo].[Manufacture] ([Id], [Name], [Position], [LogoImage], [NameUnsign], [Deleted], [DeletedDate]) VALUES (12, N'bbbbbb', 11, NULL, N'bbbbbb', 1, NULL)
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (4, CAST(0x0000A27700E6F838 AS DateTime), 102150000.0000, N'Lê Văn An', N'Nhà tui chứ đâu', N'09009877766', N'1232334', 8, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (7, CAST(0x0000A27700E8A2C3 AS DateTime), 58957500.0000, N'Lê Văn An', N'Nhà tui chứ đâu', N'09009877766', N'234423434', 8, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (8, CAST(0x0000A27700E8D6D2 AS DateTime), 7200000.0000, N'Lee min Huu', N'123', N'1111111', N'2334234234', 8, 1, NULL, NULL, N'', N'', 1, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (9, CAST(0x0000A277012C19FC AS DateTime), 4880000.0000, N'Lê Văn An', N'Nhà tui chứ đâu', N'09009877766', N'123456', 8, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (10, CAST(0x0000A277012FE97E AS DateTime), 40720000.0000, N'Lê Thị Mận', N'Nhà tui chứ đâu', N'123456', N'111111', 8, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (11, CAST(0x0000A2770130CE32 AS DateTime), 35900000.0000, N'sđfsdfdf', N'dfdfdf', N'343344', N'343444', 19, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (12, CAST(0x0000A27F0078A22C AS DateTime), 8970000.0000, N'Lê Trần Hiếu', N'Nhà tui chứ đâu', N'343423', N'234234334', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (13, CAST(0x0000A27F00796921 AS DateTime), 33520000.0000, N'Trần Huyền Trang', N'Chùa Thiếu Lâm', N'4444444', N'223322332', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (14, CAST(0x0000A27F007A05E9 AS DateTime), 9750000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (17, CAST(0x0000A27F011A14FF AS DateTime), 17410000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (26, CAST(0x0000A27F01251F1D AS DateTime), 9270000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (27, CAST(0x0000A27F0128BBC3 AS DateTime), 7890000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (28, CAST(0x0000A27F012922A7 AS DateTime), 7180000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (29, CAST(0x0000A27F0129EDC4 AS DateTime), 7890000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (31, CAST(0x0000A27F012B8D84 AS DateTime), 1330000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (32, CAST(0x0000A27F012BEA82 AS DateTime), 1330000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (33, CAST(0x0000A27F012CAF35 AS DateTime), 7980000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (34, CAST(0x0000A27F01301AD0 AS DateTime), 6650000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (35, CAST(0x0000A27F01306A09 AS DateTime), 1330000.0000, N'fgfgfg', N'fgfgfgfgfg', N'5455454', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
INSERT [dbo].[Order] ([Id], [OrderDate], [TotalPrice], [Name], [Address], [PhoneNumber], [IdentityCardNumber], [CustomerId], [OrderStatusId], [ReceiveDate], [ShipDate], [PublicComment], [PrivateComment], [Deleted], [DeletedDate]) VALUES (36, CAST(0x0000A27F01353B77 AS DateTime), 7350000.0000, N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', N'343443', N'54545454', 21, 1, NULL, NULL, N'', N'', 0, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (1, 7, 12250000.0000, 4, 53, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (2, 4, 4100000.0000, 4, 10, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (9, 8, 1950000.0000, 7, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (10, 1, 2170000.0000, 7, 38, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (11, 2, 14350000.0000, 7, 58, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (12, 3, 4162500.0000, 7, 7, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (13, 1, 7200000.0000, 8, 14, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (14, 1, 4880000.0000, 9, 47, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (15, 4, 4880000.0000, 10, 47, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (16, 2, 7010000.0000, 10, 20, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (17, 2, 3590000.0000, 10, 51, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (18, 2, 14350000.0000, 11, 58, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (19, 1, 7200000.0000, 11, 14, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (20, 2, 3590000.0000, 12, 51, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (21, 1, 1790000.0000, 12, 44, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (22, 1, 10500000.0000, 13, 13, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (23, 2, 2410000.0000, 13, 34, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (24, 4, 4550000.0000, 13, 46, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (25, 5, 1950000.0000, 14, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (32, 2, 1950000.0000, 17, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (33, 4, 460000.0000, 17, 40, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (34, 3, 3890000.0000, 17, 49, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (67, 2, 1950000.0000, 26, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (68, 3, 1790000.0000, 26, 44, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (69, 2, 1950000.0000, 27, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (70, 3, 1330000.0000, 27, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (71, 3, 1950000.0000, 28, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (72, 1, 1330000.0000, 28, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (73, 2, 1950000.0000, 29, 45, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (74, 3, 1330000.0000, 29, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (77, 1, 1330000.0000, 31, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (78, 1, 1330000.0000, 32, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (79, 6, 1330000.0000, 33, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (80, 5, 1330000.0000, 34, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (81, 1, 1330000.0000, 35, 17, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (82, 3, 1150000.0000, 36, 43, 0, NULL)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [Price], [OrderId], [ProductId], [Deleted], [DeletedDate]) VALUES (83, 2, 1950000.0000, 36, 45, 0, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Name], [FullName], [Deleted], [DeletedDate]) VALUES (1, N'Chưa xác thực', N'Chưa xác thực, đợi  nhân viên kinh doanh kiểm tra', 0, NULL)
INSERT [dbo].[OrderStatus] ([Id], [Name], [FullName], [Deleted], [DeletedDate]) VALUES (2, N'Đã xác thực', N'Đã chấp nhận đơn hàng, chờ gửi hàng', 0, NULL)
INSERT [dbo].[OrderStatus] ([Id], [Name], [FullName], [Deleted], [DeletedDate]) VALUES (3, N'Đang gửi hàng', N'Hàng đang trên đường vận chuyển đến địa chỉ người nhận', 0, NULL)
INSERT [dbo].[OrderStatus] ([Id], [Name], [FullName], [Deleted], [DeletedDate]) VALUES (4, N'Đã nhận hàng', N'Người nhận đã nhận hàng. Đơn hàng hoàn tất', 0, NULL)
INSERT [dbo].[OrderStatus] ([Id], [Name], [FullName], [Deleted], [DeletedDate]) VALUES (5, N'Bị hủy', N'Đơn hàng bị hủy', 0, NULL)
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (1, N'AAA Apple iPhone 3G(S) 32Gb Black', 1650000.0000, N'Dù chưa có nhiều thay đổi mạnh mẽ, nhưng iPhone 3GS là bản nâng cấp đáng giá với tốc độ cao, camera tốt và nhiều tính năng thú vị.

So với iPhone 3G, điện thoại mới của Apple gần như không có một thay đổi nào về ngoại hình. Máy chỉ nặng hơn model trước 2 gram (135 so với 135 gram). Phần lớn các phiên bản ở thị trường Việt Nam cả quốc tế lẫn unlock đều có dung lượn 32 GB với hai màu đen và trắng.

Apple tiếp tục mang tới giao diện đơn giản, trực quan và dễ sử dụng, mỗi icon là một ứng dụng. Màn hình Home với các trang khác nhau trải từ trái qua phải. Tuy nhiên, với việc đưa ra quá nhiều chương trình ra ngoài làm cho người dùng phải tìm kiếm nhiều hơn.', N'<table cellspacing="0" cellpadding="0" border="1">
  <tr bgcolor="#f8f8f8">
    <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
    <td width="115">Mạng</td>
    <td width="251">GSM 850 / 900 / 1800 / 1900; 3G: HSDPA 850 / 1900 / 2100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Ra mắt</td>
    <td width="251">Cuối tháng 6/2009</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="2" width="80"><strong> Kích thước</strong></td>
    <td width="115">Kích thước</td>
    <td width="251">115.5 x 62.1 x 12.3 mm</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Trọng lượng</td>
    <td width="251">135 g</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
    <td width="115">Loại</td>
    <td width="251">Màn hình TFT, 16 triệu màu</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Kích cở</td>
    <td width="251">320 x 480 pixels, 3.5 inches</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251">- Phương pháp nhập liệu đa chạm  <br />
      - Cảm biến tự động xoay  <br />
      - Cảm biến để tự động turn-off  <br />
      - Mặt kính chống trầy xướt  <br />
      - Cảm biến ánh sáng nhẹ</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
    <td width="115">Kiểu chuông</td>
    <td width="251">Nhạc chuông đa âm sắc, MP3</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Rung</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Ngôn ngữ</td>
    <td width="251">Tiếng Anh</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251"></td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
    <td width="115">Lưu trong máy</td>
    <td width="251">Khả năng lưu không giới hạn các mục và fields, danh bạ hình ảnh</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Các số đã gọi</td>
    <td width="251">100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Cuộc gọi đã nhận</td>
    <td width="251">100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Cuộc gọi nhỡ</td>
    <td width="251">100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251">- Hai phiên bản 16 GB/ 32 GB bộ nhớ trong      <br />
      - 256 MB RAM</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"></td>
    <td width="251"><strong></strong></td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
    <td width="115">Tin nhắn</td>
    <td width="251">SMS (threaded view), MMS, Email</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Đồng hồ</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Báo thức</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Dữ liệu</td>
    <td width="251">GPRS</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Hồng ngoại</td>
    <td width="251">Không</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Bluetooth</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Trò chơi</td>
    <td width="251">Có, có thể tải thêm</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Màu</td>
    <td width="251">Đen, Trắng</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251">- Máy ảnh số 3.15 MP, 2048x1536 pixels, autofocus. Tính năng Touch focus, geo-tagging, quay video Yes, VGA@30fps       <br />
      - Hệ điều hành OS Mac OS X v10.4.11      <br />
      - Tích hợp hệ thống định vị toàn cầu GPS, with A-GPS support      <br />
      - Mạng không dây Wi-Fi 802.11b/g      <br />
      - Jack cắm ngõ ra Audio 3.5 mm      <br />
      - La bàn số      <br />
      - Google Maps      <br />
      - Audio/video player      <br />
      - Ngõ ra tivi (TV-out)      <br />
      - Trình duyệt xem hình ảnh      <br />
      - Ra lệnh bằng giọng nói      <br />
      - Quay số bằng giọng nói      <br />
      - Trình duyệt HTML (Safari)      <br />
      - EDGE      <br />
      - 3G HSDPA, 7.2 Mbps      <br />
      - Bluetooth v2.1      <br />
      - USB v2.0</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td colspan="2" width="196"> Thời gian hoạt động pin</td>
    <td width="251">Pin chuẩn, Li-Ion</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td colspan="2" width="196"> Thời gian chờ</td>
    <td width="251">Lên đến 300 h</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td colspan="2" width="196"> Thời gian đàm thoại</td>
    <td width="251">Lên đến 12 h (2G) / Lên đến 5 h (3G)</td>
  </tr>
</table>', N'1250949990_1.jpg', CAST(0x00009B0600000000 AS DateTime), 54, 0, 10, 3, 3, N'AAA-Apple-iPhone-3G(S)-32Gb-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (2, N'Apple iPhone 3G(S) 32Gb Trắng', 15250000.0000, N'Dù chưa có nhiều thay đổi mạnh mẽ, nhưng iPhone 3GS là bản nâng cấp đáng giá với tốc độ cao, camera tốt và nhiều tính năng thú vị.

So với iPhone 3G, điện thoại mới của Apple gần như không có một thay đổi nào về ngoại hình. Máy chỉ nặng hơn model trước 2 gram (135 so với 135 gram). Phần lớn các phiên bản ở thị trường Việt Nam cả quốc tế lẫn unlock đều có dung lượng 32 GB với hai màu đen và trắng.

Apple tiếp tục mang tới giao diện đơn giản, trực quan và dễ sử dụng, mỗi icon là một ứng dụng. Màn hình Home với các trang khác nhau trải từ trái qua phải. Tuy nhiên, với việc đưa ra quá nhiều chương trình ra ngoài làm cho người dùng phải tìm kiếm nhiều hơn.', N'<table cellspacing="0" cellpadding="0" border="1">
  <tr bgcolor="#f8f8f8">
    <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
    <td width="115">Mạng</td>
    <td width="251">GSM 850 / 900 / 1800 / 1900; 3G: HSDPA 850 / 1900 / 2100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Ra mắt</td>
    <td width="251">Cuối tháng 6/2009</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="2" width="80"><strong> Kích thước</strong></td>
    <td width="115">Kích thước</td>
    <td width="251">115.5 x 62.1 x 12.3 mm</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Trọng lượng</td>
    <td width="251">135 g</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
    <td width="115">Loại</td>
    <td width="251">Màn hình TFT, 16 triệu màu</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Kích cở</td>
    <td width="251">320 x 480 pixels, 3.5 inches</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251">- Phương pháp nhập liệu đa chạm  <br />
      - Cảm biến tự động xoay  <br />
      - Cảm biến để tự động turn-off  <br />
      - Mặt kính chống trầy xướt  <br />
      - Cảm biến ánh sáng nhẹ</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
    <td width="115">Kiểu chuông</td>
    <td width="251">Nhạc chuông đa âm sắc, MP3</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Rung</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Ngôn ngữ</td>
    <td width="251">Tiếng Anh</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251"></td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
    <td width="115">Lưu trong máy</td>
    <td width="251">Khả năng lưu không giới hạn các mục và fields, danh bạ hình ảnh</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Các số đã gọi</td>
    <td width="251">100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Cuộc gọi đã nhận</td>
    <td width="251">100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Cuộc gọi nhỡ</td>
    <td width="251">100</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251">- Hai phiên bản 16 GB/ 32 GB bộ nhớ trong      <br />
      - 256 MB RAM</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"></td>
    <td width="251"><strong></strong></td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
    <td width="115">Tin nhắn</td>
    <td width="251">SMS (threaded view), MMS, Email</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Đồng hồ</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Báo thức</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Dữ liệu</td>
    <td width="251">GPRS</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Hồng ngoại</td>
    <td width="251">Không</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Bluetooth</td>
    <td width="251">Có</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Trò chơi</td>
    <td width="251">Có, có thể tải thêm</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115">Màu</td>
    <td width="251">Đen, Trắng</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td width="115"> </td>
    <td width="251">- Máy ảnh số 3.15 MP, 2048x1536 pixels, autofocus. Tính năng Touch focus, geo-tagging, quay video Yes, VGA@30fps       <br />
      - Hệ điều hành OS Mac OS X v10.4.11      <br />
      - Tích hợp hệ thống định vị toàn cầu GPS, with A-GPS support      <br />
      - Mạng không dây Wi-Fi 802.11b/g      <br />
      - Jack cắm ngõ ra Audio 3.5 mm      <br />
      - La bàn số      <br />
      - Google Maps      <br />
      - Audio/video player      <br />
      - Ngõ ra tivi (TV-out)      <br />
      - Trình duyệt xem hình ảnh      <br />
      - Ra lệnh bằng giọng nói      <br />
      - Quay số bằng giọng nói      <br />
      - Trình duyệt HTML (Safari)      <br />
      - EDGE      <br />
      - 3G HSDPA, 7.2 Mbps      <br />
      - Bluetooth v2.1      <br />
      - USB v2.0</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td colspan="2" width="196"> Thời gian hoạt động pin</td>
    <td width="251">Pin chuẩn, Li-Ion</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td colspan="2" width="196"> Thời gian chờ</td>
    <td width="251">Lên đến 300 h</td>
  </tr>
  <tr bgcolor="#f8f8f8">
    <td colspan="2" width="196"> Thời gian đàm thoại</td>
    <td width="251">Lên đến 12 h (2G) / Lên đến 5 h (3G)</td>
  </tr>
</table>', N'1250949507_123.jpg', CAST(0x00009C5400000000 AS DateTime), 27, 0, 12, 1, 4, N'Apple-iPhone-3G(S)-32Gb-Trang', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (3, N'iPod Classic 160GB', 500000.0000, N'iPod Classic 120GB

iPod Classic lần này  có 1 dung lượng là 120GB. Tuy nhiên, với giá cả phải chăng hơn, đây là lựa chọn thích hợp nhất của người muốn có 1 kho lưu trữ nhạc, phim lớn. iPod Classic với dung lượng lưu trữ là 120 GB với độ dày chỉ là 1 cm.

iPod Classic vẫn có 2 phiên bản màu : bạc và đen. Dòng máy nghe nhạc này có giá 235 USD - mức giá tương đương với phiên bản 80GB trước đây. Hầu hết các tính năng của phiên bản mới đều giống như phiên bản cũ, ngoại trừ việc Apple bổ sung khả năng ghi âm thông qua một micro được tích hợp trong cáp của headphone. Tuy nhiên, tính năng này sẽ không được cung cấp trong bản cập nhật phần cứng cho các phiên bản trước.', N'<table cellspacing="0" cellpadding="0" border="1">
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</a></td>
          <td> : 103.5 x 61.8 x 10.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</a></td>
          <td> : 140 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</a></td>
          <td> : 2.5<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Màu sắc</a></td>
          <td> : Đen, Bạc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Nghe nhạc</a></td>
          <td> : AAC (16 to 320 Kbps), Protected AAC (from iTunes Store), MP3 (16 to  320 Kbps), MP3 VBR, Audible (formats 2, 3,and 4), Apple Lossless, WAV,  and AIFF<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Xem phim</a></td>
          <td> : H.264, .m4v, .mp4, và .mov<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Định dạng ảnh</a></td>
          <td> : JPEG, BMP, GIF, TIFF, PSD (chỉ Mac), và PNG<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI - DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</a></td>
          <td> : Mac OS X v10.4.10 or later<br />
            : Windows Vista or Windows XP Home or Professional with Service Pack 3<br />
            : iTunes 8 or later<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ</a></td>
          <td> : 120 GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Kết nối</a></td>
          <td> : USB 2.0/ 3.5-mm stereo headphone minijack<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</a></td>
          <td> : 30.000 bài (128-Kbps AAC/MP3), 25.000 tấm hình và 150h xem video<br />
            : Cover Flow là chế độ Album sống động và tương tác cảm ứng<br />
            : Thời gian sạc 4h (2h sạc đầu khoảng 80%)<br />
            : Lưu trữ dữ liệu giống như USB<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</a></td>
          <td> : Lithium<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian sử dụng</a></td>
          <td> : 36h nghe nhạc hoặc 6h xem phim liên tục nếu sạc đầy pin</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_iPod_Classic_120GB_1240042230.jpg', CAST(0x00009B6C00000000 AS DateTime), 10, 0, 10, 1, 1, N'iPod-Classic-160GB', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (4, N'APPLE iPod Nano 16GB (có camera)', 3792500.0000, N'Tại sự kiện ''Rock and Roll'', Apple đã công bố mẫu iPod nano mới của hãng sẽ được tích hợp camera và nhiều tính năng mới.

Tại sự kiện này, Giám đốc điều hành Steve Jobs đã giới thiệu về khả năng quay video của thiết bị nghe nhạc bỏ túi này giống như Flip và Kodak, nhưng nano mỏng hơn, và có dung lượng lưu trữ lớn hơn so với Flip.  Theo Steve Jobs, thị trường thiết bị nghe nhạc đang phát triển và hãng muốn thâm nhập thêm sản phẩm vào lĩnh vực này.

Chiếc iPod nano mới sẽ gồm các mẫu 8GB và 16GB, mỗi chiếc đều được tích hợp camera video và một micro ở mặt sau của máy kèm theo một bộ loa. Thiết bị có thể hiển thị video và đồng bộ với máy tính. Do đó, người dùng có thể dễ dàng đưa các đoạn clip lên YouTube. Micro của thiết bị cũng có thể được sử dụng khi thu tiếng.', N'<table cellspacing="0" cellpadding="0" border="1" width="100%" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 90.7 x 38.7 x 6.2 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 36.4 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : 2.2-inch (diagonal) TFT display<br />
            : 240-by-376-pixel resolution at 204 pixels per inch<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Màu sắc</td>
          <td> : Đen, bạc, hồng, xanh, tím, vàng<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : AAC (8 to 320 Kbps), Protected AAC (from iTunes Store), HE-AAC, MP3  (8 to 320 Kbps), MP3 VBR, Audible (formats 2, 3, 4, Audible Enhanced  Audio, AAX, and AAX+), Apple Lossless, AIFF, and WAV<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Xem phim</td>
          <td> : MP4, M4V, MOV<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Định dạng ảnh</td>
          <td> : JPEG, TIFF, GIF, BMP, PSD<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI - DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Mac OS X v10.4.11<br />
            : iTunes 9<br />
            : Windows Vista or Windows XP Home or Professional with Service Pack 3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ</td>
          <td> : 16 GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Kết nối</td>
          <td> : USB 2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : 2000 bài hat định dạng AAC (128-Kbps) hay 7000 tấm ảnh hoặc 8 giờ video<br />
            : Cover Flow là chế độ Album sống động và tương tác cảm ứng<br />
            : Shake là kiểu lắc để chuyển bài và hiệu chỉnh các chức năng cao cấp<br />
            : Move - Moves là thiết kế cảm ứng sự di chuyển dọc ngang<br />
            : Thời gian sạc pin 3h sạc đầy (1.5h đầu sạc nhanh đến 80%)<br />
            : VGA video, 640 by 480 pixels, up to 30 frames per second with AAC audio<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Lithium<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian sử dụng</td>
          <td> : 24h nghe nhạc hoặc 4h xem phim liên tục nếu sạc đầy pin</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_APPLE_iPod_Nano_16GB_co_camera_1253007866.jpg', CAST(0x00009B3100000000 AS DateTime), 18, 0, 11, 1, 5, N'APPLE-iPod-Nano-16GB-(co-camera)', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (5, N'APPLE iPod Nano 8GB (có camera)', 3792500.0000, N'ại sự kiện ''Rock and Roll'', Apple đã công bố mẫu iPod nano mới của hãng sẽ được tích hợp camera và nhiều tính năng mới.

Tại sự kiện này, Giám đốc điều hành Steve Jobs đã giới thiệu về khả năng quay video của thiết bị nghe nhạc bỏ túi này giống như Flip và Kodak, nhưng nano mỏng hơn, và có dung lượng lưu trữ lớn hơn so với Flip.  Theo Steve Jobs, thị trường thiết bị nghe nhạc đang phát triển và hãng muốn thâm nhập thêm sản phẩm vào lĩnh vực này.

Chiếc iPod nano mới sẽ gồm các mẫu 8GB và 16GB, mỗi chiếc đều được tích hợp camera video và một micro ở mặt sau của máy kèm theo một bộ loa. Thiết bị có thể hiển thị video và đồng bộ với máy tính. Do đó, người dùng có thể dễ dàng đưa các đoạn clip lên YouTube. Micro của thiết bị cũng có thể được sử dụng khi thu tiếng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 90.7 x 38.7 x 6.2 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 36.4 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : 2.2-inch (diagonal) TFT display<br />
            : 240-by-376-pixel resolution at 204 pixels per inch<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Màu sắc</td>
          <td> : Đen, bạc, hồng, xanh, tím, vàng<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : AAC (8 to 320 Kbps), Protected AAC (from iTunes Store), HE-AAC, MP3  (8 to 320 Kbps), MP3 VBR, Audible (formats 2, 3, 4, Audible Enhanced  Audio, AAX, and AAX+), Apple Lossless, AIFF, and WAV<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Xem phim</td>
          <td> : MP4, M4V, MOV<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Định dạng ảnh</td>
          <td> : JPEG, TIFF, GIF, BMP, PSD<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI - DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Mac OS X v10.4.11<br />
            : iTunes 9<br />
            : Windows Vista or Windows XP Home or Professional with Service Pack 3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ</td>
          <td> : 8 GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Kết nối</td>
          <td> : USB 2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : 2000 bài hat định dạng AAC (128-Kbps) hay 7000 tấm ảnh hoặc 8 giờ video<br />
            : Cover Flow là chế độ Album sống động và tương tác cảm ứng<br />
            : Shake là kiểu lắc để chuyển bài và hiệu chỉnh các chức năng cao cấp<br />
            : Move - Moves là thiết kế cảm ứng sự di chuyển dọc ngang<br />
            : Thời gian sạc pin 3h sạc đầy (1.5h đầu sạc nhanh đến 80%)<br />
            : VGA video, 640 by 480 pixels, up to 30 frames per second with AAC audio<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Lithium<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian sử dụng</td>
          <td> : 24h nghe nhạc hoặc 4h xem phim liên tục nếu sạc đầy pin</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_APPLE_iPod_Nano_8GB_co_camera_1253007687.jpg', CAST(0x00009B6C00000000 AS DateTime), 11, 12, 79, 1, 5, N'APPLE-iPod-Nano-8GB-(co-camera)', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (6, N'AAA APPLE iPod Shuffle 4GB', 1720500.0000, N'Tính năng VoiceOver đọc tên bài hát và ca sĩ trên iPod Shuffle mới hỗ trợ rất nhiều khi máy không được trang bị màn hình. iPod Shuf mới nhất không đặc biệt bằng phiên bản thứ hai ngoại trừ cảm giác cầm rất nhẹ. Như thường lệ, logo “Quả táo” nằm ở một mặt máy để giúp người dùng phân biệt đó là mặt sau. Trên đỉnh, cạnh giắc cắm tai nghe là nút điều chỉnh chế độ chơi nhạc ngẫu hứng (Shuffle), chơi theo trình tự (Play in Order) hay tắt nguồn (Power Off). Gần đó là đèn báo hiệu dung lượng pin.

Mọi điều khiển cho máy được Apple chuyển hết lên tai nghe. Dây heaphone nhỏ lại mang thêm điểu khiển ngay dưới tai phải, với những tùy chỉnh cơ bản nhất, như âm lượng, Play, Pause hay nhảy sang bài khác. Sử dụng nút ấn đa chức năng này không khó nhưng cũng mất thời gian để làm quen. Có quy tắc để điều chỉnh, việc cần làm là phải nhớ, ví dụ nhấn một lần là Play hay Stop, nhấn 2 lần là nhảy lên trước một bài, 3 lần là quay lại một bài.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 45.2 x 17.5 x 7.8 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 10.3g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Màu sắc</td>
          <td> : Đen, Bạc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : AAC (8 to 320 Kbps), Protected AAC (from iTunes Store), MP3 (8 to 320  Kbps), MP3 VBR, Audible (formats 2, 3, and 4), WAV, and AIFF<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Xem phim</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Định dạng ảnh</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI - DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Mac OS X v10.4.8 or later<br />
            : Windows Vista or Windows XP Home or Professional with Service Pack 2 or later<br />
            : iTunes 7.4 or later3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ</td>
          <td> : 4 GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Kết nối</td>
          <td> : USB 2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Có thể lưu được 1000 bài hát định dạng AAC 128-Kbps<br />
            : Tính năng VoiceOver<br />
            : Multi EQ mode<br />
            : Nghe nhạc<br />
            : Sạc pin đầy trong 3h, trong 2h đầu sạc nhanh được 80%<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Lithium<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian sử dụng</td>
          <td> : Nghe nhạc 10h liên tục nếu sạc đầy pin</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_APPLE_iPod_Shuffle_4GB_1240030652.jpg', CAST(0x00009A8600000000 AS DateTime), 43, 0, 5, 1, 2, N'AAA-APPLE-iPod-Shuffle-4GB', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (7, N'APPLE iPod Touch 8GB - Có Wifi', 4162500.0000, N'Màn hình iPod Touch bằng thủy tinh chống xước, phía sau lớp vỏ mạ crom không để lại vân tay. iPod Touch chỉ có 2 phím bấm: Một phím bấm trên bề mặt để chuyển về menu chính, và phím bấm thứ hai dùng tắt máy nằm ở trên đỉnh phía trái. Thiết bị này được điều khiển khá dễ dàng thông qua các biểu tượng trên màn hình tương tự như iPhone, nhưng được nhấn mạnh ở khả năng chơi nhạc, xem ảnh và xem phim.

Có 2 chi tiết để có thể phân biệt được iPod Touch và iPhone là giắc cắm tai nghe và điều khiển âm thanh. Giắc cắm 3,5 mm của iPhone lõm vào gây khó sử dụng thì iPod Touch lại lồi ra ngoài và chấp nhận tất cả các giắc cắm mini. Không có phím điều khiển âm thanh, nhưng ở sản phẩm này bạn có thể điều khiển âm lượng trực tiếp trên màn hình.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 45.2 x 17.5 x 7.8 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 10.3g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Màu sắc</td>
          <td> : Đen, Bạc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : AAC (8 to 320 Kbps), Protected AAC (from iTunes Store), MP3 (8 to 320  Kbps), MP3 VBR, Audible (formats 2, 3, and 4), WAV, and AIFF<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Xem phim</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Định dạng ảnh</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI - DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Mac OS X v10.4.8 or later<br />
            : Windows Vista or Windows XP Home or Professional with Service Pack 2 or later<br />
            : iTunes 7.4 or later3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ</td>
          <td> : 4 GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Kết nối</td>
          <td> : USB 2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Có thể lưu được 1000 bài hát định dạng AAC 128-Kbps<br />
            : Tính năng VoiceOver<br />
            : Multi EQ mode<br />
            : Nghe nhạc<br />
            : Sạc pin đầy trong 3h, trong 2h đầu sạc nhanh được 80%<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Lithium<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian sử dụng</td>
          <td> : Nghe nhạc 10h liên tục nếu sạc đầy pin</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_APPLE_iPod_Touch_8GB_Co_Wifi_1240042280.jpg', CAST(0x00009BB000000000 AS DateTime), 10, 0, 12, 1, 2, N'APPLE-iPod-Touch-8GB---Co-Wifi', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (8, N'HTC Touch2 T3333', 7800000.0000, N'HTC Touch2 chạy hệ điều hành Windows Mobile 6.5, máy có màn hình nhỏ, các trang bị không cao cấp như Touch HD hay Pro 2.

Song song với Sony Ericsson ra mắt Xperia X2 chạy Windows Mobile 6.5, vừa qua nhà sản xuất smartphone Đài Loan cũng công bố phiên bản Touch2 với thiết kế dạng bar, gọn gàng, thời trang.

Giống như Touch Diamond 2, Touch2 có zoom cảm ứng nằm ngay dưới màn hình, hỗ trợ người dùng phóng to, thu nhỏ khi xem ảnh, lướt web. PDA mới nhất của HTC sẽ sử dụng giao diện TouchFLO 3D được chỉnh sửa để chạy trên phiên bản hệ điều hành mới.

HTC Touch2 có màn hình cảm ứng rộng 2,8 inch, độ phân giải chỉ QVGA, máy chạy trên bộ vi xử lý Qualcomm MSM7225A, tốc độ 528 MHz, RAM 256 MB. Ngoài ra, Touch2 hỗ trợ các kết nối Wi-Fi, GPS, HSDPA, Bluetooth 2.1 ới A2DP, camera của máy là 3 Megapixel.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM/GPRS/EDGE : 850/900/1800/1900 MHz<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 10 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104 X 55 X 12.9 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 110 grams<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TFT-LCD, 65K màu<br />
            : 240 x 320 pixels, 2.8 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(40 kênh), MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Lưu trong bộ nhớ máy<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Lưu trong bộ nhớ máy<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : ROM: 512 MB<br />
            : RAM: 256 MB <br />
            : Bộ vi xử lý Qualcomm® MSM7225™, 528 MHz<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Windows Mobile® 6.5 Professional<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging, Push mail<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 3.2 megapixel với auto focus<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : AAC, AAC+, eAAC+, AMR-NB, QCP, MP3, WMA, WAV, MIDI, M4A<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi®: IEEE 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : V2.1 + EDR và A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : HTC ExtUSB™ (11-pin mini-USB 2.0)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Pocket Office(Word, Excel, Outlook, PDF viewer)<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : MP3/AAC player<br />
            : Video/ aubum<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Màn hình cảm ứng + T9<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Internal GPS antenna<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Lithium-ion 1100 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 6 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 370h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_HTC_Touch2_T3333_1256117421.jpg', CAST(0x00009BF900000000 AS DateTime), 2, 0, 41, 2, 5, N'HTC-Touch2-T3333', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (9, N'HTC Hero Brown', NULL, N'Giao diện Sense của Hero mang hơi hướng của TouchFLO nhưng phóng phú cách đi vào và mạnh về ứng dụng mạng xã hội.
Hero là chiếc Android thứ ba của HTC, model đã bỏ dòng chữ "with Google" phía sau để xây dựng lại bộ mặt mới cho nền tảng này. Giao diện Sense được phát triển với các hình ảnh đồ họa long lanh và đơn giản hơn.

Màn hình Home của máy với đồng hồ lật trang, phía dưới là các icon và một thanh bar hình vòng cung cho phép đưa sang trái, phải để mở rộng thêm các ứng dụng. Máy có thể dùng viên bi bên dưới lăn sang trái, phải để sang hai trang Home nằm bên cạnh.

Sense UI được xây dựng gần như giống với TouchFLO với các ứng dụng bố trí theo hàng ngang, di chuyển để đi vào các chương trình chính. Tuy nhiên, model này lại cho khả năng truy cập đa chiều, phong phú hơn điện thoại chạy Windows Mobile.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900, HSDPA 900 / 1900 / 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 7 Năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 112 x 56.2 x 14.4 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 135 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TFT 65 ngàn mầu, 3.2 inch<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh (40 âm sắc), MP3, Wav, WMA<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Lưu trong bộ nhớ máy<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Micro SD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : Ram : 288MB ROM : 512MB<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Android<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5.0 megapixe, autofocus<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : AAC, AAC+, AMR-NB, MP3, WMA, WAV, AAC-LC, MIDI, OGG<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10(4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi: IEEE 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Bluetooth® 2.0 với A2DP và Enhanced Data Rate  hỗ trợ nghe nhạc stereo<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : mini-USB 2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : - CPU : Qualcomm® MSM7200A™, 528 MHz<br />
            : - Hỗ trợ định vị toàn cầu GPS<br />
            : : Java MIDP 2.0<br />
            : : Xem tài liệu<br />
            : : Nghe nhạc MP3 player<br />
            : : Video/audio album<br />
            : : Loa ngoài<br />
            : : Các ứng dụng Google (Gmail, Gtalk, search)<br />
            : : Street view của Google Map<br />
            : : YouTube<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Touch screen<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Có , GPS (hỗ trợ A-GPS)<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn Lithium-ion 1350 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 8h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 440h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_HTC_Hero_Black_1249879697.jpg', CAST(0x00009CB500000000 AS DateTime), 7, 0, 45, 2, 1, N'HTC-Hero-Brown', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (10, N'HTC Touch Viva', 4100000.0000, N'Theo thống kê mới nhất về doanh số bán hàng của hãng HTC năm 2007, Touch là chiếc PDA thành công nhất của HTC. Hãng đã "truyền" vào thiết kế vốn lâu nay được xem là cũ kỹ, thô kệch và đặc biệt là thời trang của PDA bằng một sản phẩm nhỏ gọn, thanh thoát không kém phần thời trang. Tuy cấu hình không thay đổi là mấy, Touch II ra mắt sau đó được nâng cấp gấp đôi bộ nhớ, ngoài ra hãng cũng thêm vào nhiều phiên bản với các màu vỏ khác nhau. Viva hi vọng kế thừa Touch I và II với một số thay đổi. Viva có kích thước là 104,5 x 59 x 15,8 mm, so với phiên bản trước 99,9 x 58 x 13,9 mm dễ dàng nhận thấy, máy dài và dày hơn. Để cả hai trong lòng bàn tay, cảm nhận Touch béo, tròn trong khi máy sau lại trông vừa vặn, thanh mảnh', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 09 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104.5 x 59 x 15.8 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 110 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TFT, 65K màu<br />
            : 240 x 320 pixels, 2.8 inches<br />
            : Màn hình TouchFLO<br />
            : Nhận dạng chữ viết tay<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím QWERTY<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(40 kênh), MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 28MB RAM<br />
            : 256 MB ROM<br />
            : TI OMAP 850, 201 MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Microsoft Windows Mobile 6.1 Professional<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 2 MP, 1600x1200 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Máy ảnh thứ hai quay video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc MP3 player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Pocket Office(Word, Excel, Outlook, PDF viewer)<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : MP3/AAC player<br />
            : Video/audio album<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1100 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 8 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 270 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_HTC_Touch_Viva_Storm_Gray_Brandnew_1239944667.jpg', CAST(0x00009C6F00000000 AS DateTime), 4, 3, 68, 2, 5, N'HTC-Touch-Viva', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (11, N'HTC Touch Diamond II', 8500000.0000, N'Diamond 2 có màn hình rộng, độ phân giải cao và pin khỏe hơn so với Touch Diamond, nhưng kích thước dày và lớn.

HTC vừa thêm hai bản nâng cấp PDA mới tại MWC 2009 tại Barcelona đầu tháng. Touch Diamond 2 là bản nâng cấp của model đi trước với phần mềm giao diện TouchFLO 3D trên nền Windows Mobile.

Khác với "kim cương" đi trước khi trang bị bộ nhớtrong lên tới 4 GB, Diamond không có dung lượng cao như vậy ngoài RAM288 MB và ROM 512 MB dành để cài đặt các ứng dụng.

Một khác biệt tiếp theo của Diamond 2 là lớp vỏ nhô mở mặt trước, phía sau vỏ nhựa trơn bóng, trong khi model đầu tiên lại sở hữu các nếp gấp, giống kết cấu các viên kim cương.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900; HSDPA 900 / 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Quý 2 Năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 107.85 X 53.1 X 13.7 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 117.5 grams<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TouchFLO™ 3D, 65K màu<br />
            : 480 X 800 WVGA , 3.2 inches<br />
            : Giao diện TouchFlo 3D<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím 04 chiều cực nhạy<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(40 kênh),  MP3, WAV, WMA<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : ROM: 512 MB<br />
            : RAM: 288 MB<br />
            : Bộ vi xử lý Qualcomm® MSM7200A™, 528 MHz<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Microsoft Windows Mobile 6.1 Professional<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5.0MP 2592 x 1944 pixels, Tự lấy nét(autofocus)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc MP3 player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Pocket Office(Word, Excel, Outlook, PDF viewer)<br />
            : Hỗ trợ định vị toàn cầu GPS<br />
            : Nghe Stereo FM radio công nghệ RDS<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : Nghe nhạc MP3 player<br />
            : Video/audio album<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Có hỗ trợ GPS<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1100 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 5 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 500</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_HTC_Touch_Diamond_II_1242027987.jpg', CAST(0x00009C4B00000000 AS DateTime), 4, 0, 23, 2, 5, N'HTC-Touch-Diamond-II', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (12, N'HTC Touch HD', NULL, N'HTC Touch HD - Nâng tầm Internet di động và giải trí !

Kể từ khi Apple iPhone ra đời, thực sự đã làm lu mờ tất cả các model điện thoại cùng thời khác. Kể từ khi đó trở đi các hãng sản xuất điện thoại di động lớn như HTC, Nokia, Sam sung,... luôn có gắng lấy lại hình ảnh đã có bấy lâu của mình với cuộc cách mạng kỹ thuật, đáng chú ý nhất là các mẫu màn hình cảm ứng khi cho ra đời hàng loạt các siêu phẩm đình đám như i900 hay Bold 900, BlackBerry Storm 9500 và mới nhất là touch HD nhằm lấy lại thị phần đáng nhẽ ra là của mình. Và điều đó đã thúc đẩy các kỹ sư thiết kế của hãng HTC đã cho ra mắt HTC Touch HD, dòng điện thoại Window Mobile mới nhất.

Chiếc điện thoại có màn hình cảm ứng lớn hơn hẳn iPhone với kích thước 3.8 inch WVGA 480 x 800 pixel. HTC Touch HD sẽ là một trong những sản phẩm ấn tượng trong thị trường điện thoại cảm ứng năm 2008 này. Ngoài hệ điều hành Window Mobile 6.1 được trang bị, chiếc PDA này còn tích hợp nhiều hơn các chức năng về đa phương tiện. Màn hình hiển thị lớn hơn iPhone, khả năng chụp ảnh lớn 5MP khiến phiên bản lần này được xem là một máy ảnh thực thụ trong điện thoại nhằm giúp cho người sử dụng khai thác hết tính năng giải trí khi đi du lịch hay dã ngoại nhằm chụp những bức hình đáng nhớ cho mình và jack cắm tai nghe 3.5 mm tất nhiên phải được trang bị.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 11 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 115 x 62.8 x 12 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 146 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TFT touchscreen, 65K màu<br />
            : 480 x 800 pixels, 3.8 inches<br />
            : Giao diện TouchFlo 3D<br />
            : Nhận dạng chữ viết tay<br />
            : Màn hình cảm ứng cực nhạy<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm((40 channels), MP3, WAV, WMA<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Micro SD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 288 MB RAM<br />
            : 512 MB ROM <br />
            : Qualcomm MSM7201A 528 Mhz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Microsoft Windows Mobile 6.1 Professional<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5 MP, 2592 x 1944 pixels, autofocus, video(CIF@30fps)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Pocket Office(Pocket Office (Word, Excel, PowerPoint, OneNote, PDF viewer)<br />
            : Hỗ trợ định vị toàn cầu GPS<br />
            : Jack cắm audio 3.5 mm<br />
            : Tính năng YouTube client<br />
            : Nghe Stereo FM radio công nghệ RDS<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : Nghe nhạc MP3 player<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1350 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 6 h 30<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 450 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_HTC_Touch_HD_Black_Brandnew_1239938325.jpg', NULL, 3, 0, 62, 2, 5, N'HTC-Touch-HD', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (13, N'BLACKBERRY Bold 9000 AT&T Full box', 10500000.0000, N'Đây là chiếc điện thoại nhắm tới không chỉ khách hàng sử dụng e-mail mà cả những người ưa giải trí.

RIM đã giới thiệu chiếc điện thoại thông minh mới nhất mang tên BlackBerry Bold 9000. Với bộ vi xử lý 624 MHz, màn hình có độ phân giải 480 x 320 pixel, được hỗ trợ kết nối Wi-Fi, 3G. Đây cũng là series điện thoại BlackBerry đầu tiên tích hợp kết nối HSDPA tốc độ cao.

BlackBerry Bold sẽ hỗ trợ các kết nối tốc độ cao HSDPA và EV-DO (bao gồm cả AWS băng tần 1700MHz), điều này không nằm ngoài dự đoán của giới tiêu dùng trong thời gian qua. Ngoài ra, máy cũng sẽ hỗ trợ đầy đủ Bluetooth 2.0, 802.11 a/b/g, GPS và khe gắn thẻ nhớ microSDHC cho phép nâng bộ nhớ lên 16GB.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 05 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 114 x 66 x 14 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 133 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình 65K màu<br />
            : 480 x 320 pixels<br />
            : <br />
            : Cuộn điều hướng<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím QWERTY, Cuộn điều hướng<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Lưu trong bộ nhớ của máy<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Rất nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 128 MB chia sẻ<br />
            : 1 GB bộ nhớ trong <br />
            : 624 MHz processor<br />
            : Hệ điều hành RIM<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Hệ điều hành BlackBerry OS<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 2 MP, 1600x1200 pixels, video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : MP3/WMA/AAC+<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 3.6 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 a/b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Hệ thống định vị toàn cầu GPS với bản đồ tích hợp của BlackBerry<br />
            : Hệ điều hành BlackBerry OS<br />
            : Java- Media player MP3/WMA/AAC+<br />
            : Nghe nhạc Video player DivX/WMV/XviD/3gp<br />
            : Lịch làm việc<br />
            : Loa ngoài<br />
            :  Xem các file văn bản (Microsoft Word, Excel and PowerPoint, Corel WordPerfect and Adobe PDF)<br />
            : Quay số bằng giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1500 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 5 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 310 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_BLACKBERRY_Bold_9000_Black_Cu_1239763238.jpg', CAST(0x00009C3F00000000 AS DateTime), 7, 0, 63, 3, 3, N'BLACKBERRY-Bold-9000-AT-T-Full-box', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (14, N'BLACKBERRY Curve 8520', 8200000.0000, N'Tin đồn về chiếc BackBerry mới với tên mã "Gemini" xuất hiện từ đầu năm 2009. Mặc dù RIM chưa đưa ra thông báo nào về Gemini mới, nhưng chiếc Curve mới mang tên 8520 đã xuất hiện trên mạng, chiếc di động giá thấp với kết nối EDGE 2,5G.

Trong dòng Curve, các model series 8300 hiện được đặt tên theo tính năng. 8310 hỗ trợ GPS, 8320 có kết nối Wi-Fi, trong khi 8330 chạy trên mạng CDMA, có thể 8520 là một trong các model đặt tên theo logic trên. Theo đó, sẽ có thêm 8510 hỗ trợ GPS và 8530 dành cho mạng CDMA.

BlackBerry Curve 8520 tiếp tục là một chiếc di động có bàn phím QWERTY mà không chạy trên mạng 3G như nhiều điện thoại khác mang nhãn hiệu BlackBerry. Dòng di động này rất được yêu thích tại Mỹ, và hiện là chiếc smartphone bán chạy số một tại đây.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 8 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 109 x 60 x 13.9 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 106g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT 65K màu<br />
            : 320x240 pixels, 2.64 inches<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím QWERTY<br />
            : Cuộn điều hướng cảm ứng<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm sắc, MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 256MB<br />
            : Bộ vi sử lý 512Mhz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Hệ điều hành RIM<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 2 MP, 1600x1200 pixels, video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc Media player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 với A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Nghe nhạc Media player<br />
            : Hệ điều hành BlackBerry OS<br />
            : Sắp xếp công việc<br />
            : BlackBerry maps <br />
            : Máy tính cá nhân<br />
            : Quay số bằng giọng nói<br />
            : Lịch làm việc<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1150 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 4 h 30<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 408 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_BLACKBERRY_Curve_8530_1250755290.jpg', CAST(0x00009C7300000000 AS DateTime), 9, 1, 55, 3, 3, N'BLACKBERRY-Curve-8520', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (15, N'BLACKBERRY Javelin 8900 T-mobile', 8100000.0000, N'Được thiết kế kết hợp giữa hình dáng truyền thống của BlackBerry nhưng lại mang nhiều nét của chiếc Bold mới, Curve 8900 không chỉ là di động e-mail mà còn mở rộng kết nối và giải trí đa phương tiện Không những thế nếu như Bold dũng cảm mở rộng các tính năng giải trí, Stormđi vào lãnh địa cảm ứng thì Curve 8900 vừa xuất hiện, trở lại truyền thống là một model dành cho e-mail thân thiện, nhưng cũng rất nhiều cải tiến.

Model sở hữu bộ khung của máy chắc chắn, kiểu dáng theo truyền thống của hãng. 8900 hơi bẹt nhưng không đậm như Bold, dễ dàng cầm gọn nhưng rất chắc chắn. 8900 mới sở hữu màn hình sáng và rộng, bên dưới là bàn phím QWERTY đầy đủ được bố trí đơn giản, chuyên nghiệp như các model đi trước của RIM. Mỗi nút bấm được đắp nổi và cắt vát ở cạnh góc, dễ dàng đặt ngón tay lên tìm kiếm và nhấn phím. Giống như các "đàn anh" dòng Curve trước đây, 8900 tiếp tục được trang bị trackball dễ dàng dùng để cuộn khi mở e-mail, duyệt web hoặc di chuyển trên chương trình chính.', N'<table cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%E1%BA%A1ng&amp;width=450&amp;height=300" title="Mạng">Mạng</a></td>
          <td> : GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ra+m%E1%BA%AFt&amp;width=450&amp;height=300" title="Ra mắt">Ra mắt</a></td>
          <td> : Tháng 10 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ng%C3%B4n+ng%E1%BB%AF&amp;width=450&amp;height=300" title="Ngôn ngữ">Ngôn ngữ</a></td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=K%C3%ADch+th%C6%B0%E1%BB%9Bc&amp;width=450&amp;height=300" title="Kích thước">Kích thước</a></td>
          <td> : 109 x 60 x 13.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tr%E1%BB%8Dng+l%C6%B0%E1%BB%A3ng&amp;width=450&amp;height=300" title="Trọng lượng">Trọng lượng</a></td>
          <td> : 110g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%C3%A0n+h%C3%ACnh&amp;width=450&amp;height=300" title="Màn hình">Màn hình</a></td>
          <td> : Màn hình 65K màu<br />
            : 480 x 360 pixels, 2.4 inches<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=B%C3%A0n+ph%C3%ADm&amp;width=450&amp;height=300" title="Bàn phím">Bàn phím</a></td>
          <td> : Bàn phím QWERTY<br />
            : Cuộn điều hướng<br />
            : Nhận dạng chữ viết tay<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ki%E1%BB%83u+chu%C3%B4ng&amp;width=450&amp;height=300" title="Kiểu chuông">Kiểu chuông</a></td>
          <td> : Âm thanh đa âm(32) âm sắc, MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Rung&amp;width=450&amp;height=300" title="Rung">Rung</a></td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+trong+m%C3%A1y&amp;width=450&amp;height=300" title="Lưu trong máy">Lưu trong máy</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+tr%E1%BB%AF+cu%E1%BB%99c+g%E1%BB%8Di&amp;width=450&amp;height=300" title="Lưu trữ cuộc gọi">Lưu trữ cuộc gọi</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Khe+c%E1%BA%AFm+th%E1%BA%BB+nh%E1%BB%9B&amp;width=450&amp;height=300" title="Khe cắm thẻ nhớ">Khe cắm thẻ nhớ</a></td>
          <td> : MicroSD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=B%E1%BB%99+nh%E1%BB%9B+trong&amp;width=450&amp;height=300" title="Bộ nhớ trong">Bộ nhớ trong</a></td>
          <td> : Bộ vi sử lý 512Mhz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%87+%C4%91i%E1%BB%81u+h%C3%A0nh&amp;width=450&amp;height=300" title="Hệ điều hành">Hệ điều hành</a></td>
          <td> : Hệ điều hành RIM<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tin+nh%E1%BA%AFn&amp;width=450&amp;height=300" title="Tin nhắn">Tin nhắn</a></td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=T%C3%ADch+h%E1%BB%A3p+Camera&amp;width=450&amp;height=300" title="Tích hợp Camera">Tích hợp Camera</a></td>
          <td> : 3.15 MP, 2048x1536 pixels, flash, autofocus, video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Quay+Video&amp;width=450&amp;height=300" title="Quay Video">Quay Video</a></td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Nghe+nh%E1%BA%A1c&amp;width=450&amp;height=300" title="Nghe nhạc">Nghe nhạc</a></td>
          <td> : Nghe nhạc Media player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Game&amp;width=450&amp;height=300" title="Game">Game</a></td>
          <td> : Có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPRS&amp;width=450&amp;height=300" title="GPRS">GPRS</a></td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=HSCSD&amp;width=450&amp;height=300" title="HSCSD">HSCSD</a></td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=EDGE&amp;width=450&amp;height=300" title="EDGE">EDGE</a></td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=3G&amp;width=450&amp;height=300" title="3G">3G</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=WLAN&amp;width=450&amp;height=300" title="WLAN">WLAN</a></td>
          <td> : Wi-Fi 802.11b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Bluetooth&amp;width=450&amp;height=300" title="Bluetooth">Bluetooth</a></td>
          <td> : Có, v2.0 với A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%93ng+ngo%E1%BA%A1i&amp;width=450&amp;height=300" title="Hồng ngoại">Hồng ngoại</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=USB&amp;width=450&amp;height=300" title="USB">USB</a></td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=T%C3%ADnh+n%C4%83ng+%C4%91%E1%BA%B7c+bi%E1%BB%87t&amp;width=450&amp;height=300" title="Tính năng đặc biệt">Tính năng đặc biệt</a></td>
          <td> : Hệ thống định vị GPS<br />
            : Nghe nhạc Media player<br />
            : Hệ điều hành BlackBerry OS<br />
            : Sắp xếp công việc<br />
            : BlackBerry maps <br />
            : Máy tính cá nhân<br />
            : Quay số bằng giọng nói<br />
            : Lịch làm việc<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=%C4%90%E1%BB%93ng+b%E1%BB%99+h%C3%B3a+D%E1%BB%AF+li%E1%BB%87u&amp;width=450&amp;height=300" title="Đồng bộ hóa Dữ liệu">Đồng bộ hóa Dữ liệu</a></td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=C%C3%A1ch+nh%E1%BA%ADp+d%E1%BB%AF+li%E1%BB%87u&amp;width=450&amp;height=300" title="Cách nhập dữ liệu">Cách nhập dữ liệu</a></td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPS&amp;width=450&amp;height=300" title="GPS">GPS</a></td>
          <td> : Có hỗ trợ A-GPS<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Pin&amp;width=450&amp;height=300" title="Pin">Pin</a></td>
          <td> : Pin chuẩn, Li-Ion 1100 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+%C4%91%C3%A0m+tho%E1%BA%A1i&amp;width=450&amp;height=300" title="Thời gian đàm thoại">Thời gian đàm thoại</a></td>
          <td> : Lên tới 4 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+ch%E1%BB%9D&amp;width=450&amp;height=300" title="Thời gian chờ">Thời gian chờ</a></td>
          <td> : Lên tới 408 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_BLACKBERRY_Javelin_8900_Black_Brandnew_1239763303.jpg', CAST(0x00009CA600000000 AS DateTime), 2, 0, 6, 3, 3, N'BLACKBERRY-Javelin-8900-T-mobile', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (16, N'HTC Cruise 09 Black Cũ', 6200000.0000, N'HTC Touch Cruise 09 sẽ kế tục chiếc PDA dẫn đường hai năm trước là Touch Cruise nhưng được cải tiến hơn về bộ nhớ, giao diện và các gói tính năng mới. Theo thông tin mới nhất từ hãng HTC không ngoài mục đích tạo ra sản phẩm nâng cao tính năng định vị GPS, nâng cấp thêm tính năng và bộ vi sử lý chính vì vậy đầu tháng 01 năm 2009 HTC chính thức giới thiệu chiếc PDA mới nhấn mạnh vào khả năng định vị toàn cầu GPS. Máy mới có tên Touch Cruise 09, hay Cruise 2009 nâng cấp từ Cruise đầu tiên.
HTC Cruise 09 mang đậm chất thời trang, nhỏ gọn không những thế model khá nhẹ chỉ 103g so với 130g. Máy mới chạy trên hệ điều hành Windows Mobile 6.1 Professional, vi xử lý Qualcomm MSM 7225 528 MHz, RAM 256 MB, ROM 512 MB và mở rộng dung lượng bằng thẻ nhớ microSD.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 01 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 102 x 53.5 x 14.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 103 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TFT, 65K màu<br />
            : 240 x 320 pixels, 2.8 inches<br />
            : Màn hình TouchFLO<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Nhận dạng chữ viết tay<br />
            : Phím 05 chiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(40 kênh), MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 256MB RAM<br />
            : 512MB ROM<br />
            : Bộ vi xử lý Qualcomm MSM7225 528 Mhz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Windows Mobile 6.1 Professional<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, EMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels, video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc MP3/AAC player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Pocket Office(Word, Excel, Outlook, PDF viewer)<br />
            : Hỗ trợ định vị toàn cầu GPS<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : Xem 3GP/MP4/WMV/AVI video player<br />
            : Video/audio album<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Có, hỗ trợ A-GPS<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1100 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 6 h 30 min<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 400 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_HTC_Cruise_09_Black_Cu_1239780933.jpg', CAST(0x00009BA400000000 AS DateTime), 3, 3, 20, 3, 4, N'HTC-Cruise-09-Black-Cu', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (17, N'Nokia 2720 Fold Black', 1330000.0000, N'Thiết kế phù hợp với thị trường điện thoại bình dân, nokia 2720 Fold được tích hợp Nokia Life Tool và ovi mail, hai ứng dụng Nokia tạo ra cho phép người dùng dễ dàng sử dụng mà không cần truy cập vào máy tính cá nhân.

    * Nokia Life Tools: là công cụ cho phép người sử dụng tìm thấy thông tin kịp thời liên quan về các dịch vụ giáo dục trực tuyến...
    * Ovi mail: cho phép người sử dụng thiết lập, gửi và nhận mail một cách nhanh chóng trên di động.

Nokia 2720 Fold nổi bật với thời gian chờ lên tới 18 ngày, thời gian đàm thoại liên tục 5 giờ và bạn khỏi phải bận tâm làm cách nào để tiết kiệm pin. Máy được tích hợp FM Radio, máy nghe nhạc MP3 và kết nối Bluetooth.', N'<table cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%E1%BA%A1ng&amp;width=450&amp;height=300" title="Mạng">Mạng</a></td>
          <td> : GSM 900 / 1800<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ra+m%E1%BA%AFt&amp;width=450&amp;height=300" title="Ra mắt">Ra mắt</a></td>
          <td> : tháng 5, 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ng%C3%B4n+ng%E1%BB%AF&amp;width=450&amp;height=300" title="Ngôn ngữ">Ngôn ngữ</a></td>
          <td> : Có tiếng Việt<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=K%C3%ADch+th%C6%B0%E1%BB%9Bc&amp;width=450&amp;height=300" title="Kích thước">Kích thước</a></td>
          <td> : 93 x 46 x 17.9 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tr%E1%BB%8Dng+l%C6%B0%E1%BB%A3ng&amp;width=450&amp;height=300" title="Trọng lượng">Trọng lượng</a></td>
          <td> : 90.3 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%C3%A0n+h%C3%ACnh&amp;width=450&amp;height=300" title="Màn hình">Màn hình</a></td>
          <td> : TFT, 65K colors<br />
            : 120 x 160 pixels, 1.8 inches<br />
            : Màn hình ngoài đơn sắc TFT display, 128 x 160 pixels, 1.36 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ki%E1%BB%83u+chu%C3%B4ng&amp;width=450&amp;height=300" title="Kiểu chuông">Kiểu chuông</a></td>
          <td> : MP3 ringtones<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Rung&amp;width=450&amp;height=300" title="Rung">Rung</a></td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+trong+m%C3%A1y&amp;width=450&amp;height=300" title="Lưu trong máy">Lưu trong máy</a></td>
          <td> : Danh bạ 500 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+tr%E1%BB%AF+cu%E1%BB%99c+g%E1%BB%8Di&amp;width=450&amp;height=300" title="Lưu trữ cuộc gọi">Lưu trữ cuộc gọi</a></td>
          <td> : 20 cuộc gọi đi, 20 cuộc gọi đến, 20 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Khe+c%E1%BA%AFm+th%E1%BA%BB+nh%E1%BB%9B&amp;width=450&amp;height=300" title="Khe cắm thẻ nhớ">Khe cắm thẻ nhớ</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=B%E1%BB%99+nh%E1%BB%9B+trong&amp;width=450&amp;height=300" title="Bộ nhớ trong">Bộ nhớ trong</a></td>
          <td> : 32Mb<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPRS&amp;width=450&amp;height=300" title="GPRS">GPRS</a></td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=HSCSD&amp;width=450&amp;height=300" title="HSCSD">HSCSD</a></td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=EDGE&amp;width=450&amp;height=300" title="EDGE">EDGE</a></td>
          <td> : Class 6, 177.6 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=3G&amp;width=450&amp;height=300" title="3G">3G</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=WLAN&amp;width=450&amp;height=300" title="WLAN">WLAN</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Bluetooth&amp;width=450&amp;height=300" title="Bluetooth">Bluetooth</a></td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%93ng+ngo%E1%BA%A1i&amp;width=450&amp;height=300" title="Hồng ngoại">Hồng ngoại</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=USB&amp;width=450&amp;height=300" title="USB">USB</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPS&amp;width=450&amp;height=300" title="GPS">GPS</a></td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tin+nh%E1%BA%AFn&amp;width=450&amp;height=300" title="Tin nhắn">Tin nhắn</a></td>
          <td> : SMS, MMS, Email<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tr%C3%ACnh+duy%E1%BB%87t&amp;width=450&amp;height=300" title="Trình duyệt">Trình duyệt</a></td>
          <td> : WAP 2.0/xHTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tr%C3%B2+ch%C6%A1i&amp;width=450&amp;height=300" title="Trò chơi">Trò chơi</a></td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Colors&amp;width=450&amp;height=300" title="Colors">Colors</a></td>
          <td> : Black, Deep Red<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Camera&amp;width=450&amp;height=300" title="Camera">Camera</a></td>
          <td> : 1.3 MP, 1280 x 1024 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=%C4%90%E1%BA%B7c+%C4%91i%E1%BB%83m+kh%C3%A1c&amp;width=450&amp;height=300" title="Đặc điểm khác">Đặc điểm khác</a></td>
          <td> : Stereo FM radio with RDS<br />
            : MP3/eAAC+/MP4 player<br />
            : Voice memo<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Pin&amp;width=450&amp;height=300" title="Pin">Pin</a></td>
          <td> : Standard battery, Li-Ion 860 mAh (BL-4CT)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+ch%E1%BB%9D&amp;width=450&amp;height=300" title="Thời gian chờ">Thời gian chờ</a></td>
          <td> : 432 tiếng<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+%C4%91%C3%A0m+tho%E1%BA%A1i&amp;width=450&amp;height=300" title="Thời gian đàm thoại">Thời gian đàm thoại</a></td>
          <td> : 5 tiếng</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Nokia_2720_Fold_Black_1252315260.jpg', CAST(0x0000996E00000000 AS DateTime), 37, 10, 66, 4, 5, N'Nokia-2720-Fold-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (18, N'Nokia 5030 XpressRadio Black', 830000.0000, N'Đây là chiếc di động đầu tiên nằm trong dòng nghe raido của Nokia. Máy có ăng ten bắt sóng nhanh đài phát thanh. Nokia 5030 XpressRadio sở hữu phím bấm cảm ứng trượt để nghe đài FM dễ sử dụng.

Nhắm vào các thị trường mới nổi, Nokia 5030 XpressRadio cũng có các tính năng như đèn pin giống 1200, đọc giờ điện thoại và giờ hẹn. Máy chạy trên hai băng tần GSM, giao diện S30, màn hình 1,8 inch, độ phân giải chỉ 128 x 160 pixel.

Nokia 5030 XpressRadio sẽ có mặt trên thị trường với các màu đỏ và than chì vào quý II năm nay', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850/1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Quý 2 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Việt -Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 107,7 x 44,6 x 14,55 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 82g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : 128 x 160 pixel (TFT) - Lên tới 65.000 màu<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím số<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc chuông đa âm 32 âm và nhạc chuông MP3 (tích hợp)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Nhiều , chia sẻ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 64/16kb<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có sẵn<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Đỏ - Tím than<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Các phím chọn kênh và phím radio chuyên dụng<br />
            : Radio FM bằng ăng-ten gắn trong<br />
            : Radio làm âm đồng hồ báo thức<br />
            : Thu âm và giọng nói : FR, EFR, HR, AMR<br />
            : Loa ngoài tích hợp<br />
            : Đồng hồ báo thức hoặc âm báo thức bằng tiếng nói<br />
            : Nhắc nhở<br />
            : Máy tính<br />
            : Lịch riêng của vùng, chế độ xem theo tháng<br />
            : Bộ chuyển đổi<br />
            : SBảng tính<br />
            : Bộ theo dõi trả trước<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin Li-Ion BL-5C 1020 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 524h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 10h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Nokia_5030_XpressRadio_Black_1251169323.jpg', CAST(0x00009A6D00000000 AS DateTime), 5, 4, 39, 4, 2, N'Nokia-5030-XpressRadio-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (19, N'NOKIA E52 Sliver', 5770000.0000, N'Công ty điện thoại lớn nhất thế giới vừa cho ra mắt model dành cho doanh nhân với thiết kế gọn, mỏng, nhiều tính năng và có khả năng đàm thoại lâu.

Pin theo máy cho phép đàm thoại liên tục tới 8 giờ và thời gian chờ là 23 ngày. Ngoài ra, các tính năng cao cấp như GPS và Wi-Fi đều được trang bị ở E52.

Một tính năng khá thú vị ở E52 là màn hình có khả năng tự động xoay theo hướng sử dụng, rất hữu ích khi sử dụng khi ở ngoài trời, có ánh sáng mạnh. Camera của E52 có độ phân giải 3 Megapixel.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900, HSDPA 900 / 1900 / 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 5 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 116 x 49 x 9.9 mm, 54 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 98 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, 16M màu, 240 x 320 pixels, 2.4 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc chuông đa âm sắc (64 channels), MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều danh bạ hình ảnh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD, hỗ trợ lên tới 16GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 60MB<br />
            : ARM 11 600 MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Symbian OS, S60 rel. 3.2<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 3.2 MP, 2048x1536 pixels, enhanced fixed focus, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : VGA@15fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Java MIDP 2.0- MP3/AAC/ACC+ player- Lịch tổ chức<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 32, 296 / 178.8 kbits<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 10.2 Mbps; HSUPA, 2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11g, VoIP over WLAN<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0 miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Document viewer (Word, Excel, Powerpoint, PDF)<br />
            : Từ điển T9<br />
            : Java MIDP 2.0- MP3/AAC/ACC+ player<br />
            : Lịch tổ chức<br />
            : Ghi âm giọng nói<br />
            : Loa ngoài<br />
            : Tính năng bộ đàm <br />
            : FM radio<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Yes, with A-GPS support; Nokia Maps 3.0<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn 1500 mAh (BP-4L)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up to 8 h (2G) / Up to 6 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 672 h (2G) / Up to 432 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_NOKIA_E52_Sliver_1250044605.jpg', CAST(0x0000992700000000 AS DateTime), 3, 0, 78, 4, 4, N'NOKIA-E52-Sliver', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (20, N'Nokia 6710 Navigator Titanium', 7010000.0000, N'Nokia 6710 Navigator sở hữu thiết kế trượt, kiểu dáng sáng và có thêm phím tắt bật chức năng định vị toàn cầu. Khi hiển thị bản đồ, người dùng dễ dàng phóng to, thủ nhỏ thông qua phím chuyên dụng
Máy có màn hình 2,6 inch, hỗ trợ tự động điều chỉnh độ sáng khi đi ra ngoài trời. Model này hỗ trợ giọng nói khi định vị và có thể làm việc được khi chưa cắm SIM.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 8 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104.8 x 50.1 x 14.9 mm, 73 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 117 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 16 triệu màu<br />
            : 240 x 320 pixels, 31 x 42 mm<br />
            : Có thể tải wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(64 kênh), MP3<br />
            : Audio Jack 3.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Tối đa 30 ngày sử dụng<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD, hỗ trợ lên tới 16GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 50MB bộ nhớ trong<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Symbian OS 9.3, S60 rel. 3.2<br />
            : CPU ARM 11 600 MHz processor<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5 MP, 2592x1944 pixels, Carl Zeiss optics, autofocus, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Yes, VGA@15fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : - MP3/WMA/WAV/RA/AAC/M4A music player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Silver, Black<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 32, 296 / 178.8 kbits<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 10.2 Mbps; HSUPA, 2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g, UPnP technology<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Yes, v2.0 with A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : - Digital compass<br />
            : - Turn-to-mute calls and alarm<br />
            : - WMV/RV/MP4/3GP video player<br />
            : - MP3/WMA/WAV/RA/AAC/M4A music player<br />
            : - Document Viewer (Excel, PDF, Powerpoint, Word)<br />
            : - TV Out<br />
            : - Image Editor<br />
            : - Flash Lite 3.0<br />
            : - Voice memo<br />
            : - T9<br />
            : - Car stand and charger in retail package<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Yes, with A-GPS support; Nokia Maps 3.0<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Standard battery, Li-Ion 950 mAh (BL-5F)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up to 7 h 30 min (2G) / 4 h 30 min (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 444 h (2G) / 456 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Nokia_6710_Navigator_1250063074.jpg', CAST(0x00009C5500000000 AS DateTime), 3, 0, 57, 4, 4, N'Nokia-6710-Navigator-Titanium', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (21, N'Nokia 6710 Navigator Brown', 7010000.0000, N'Nokia 6710 Navigator sở hữu thiết kế trượt, kiểu dáng sáng và có thêm phím tắt bật chức năng định vị toàn cầu. Khi hiển thị bản đồ, người dùng dễ dàng phóng to, thủ nhỏ thông qua phím chuyên dụng
Máy có màn hình 2,6 inch, hỗ trợ tự động điều chỉnh độ sáng khi đi ra ngoài trời. Model này hỗ trợ giọng nói khi định vị và có thể làm việc được khi chưa cắm SIM.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 8 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104.8 x 50.1 x 14.9 mm, 73 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 117 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 16 triệu màu<br />
            : 240 x 320 pixels, 31 x 42 mm<br />
            : Có thể tải wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(64 kênh), MP3<br />
            : Audio Jack 3.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Tối đa 30 ngày sử dụng<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD, hỗ trợ lên tới 16GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 50MB bộ nhớ trong<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Symbian OS 9.3, S60 rel. 3.2<br />
            : CPU ARM 11 600 MHz processor<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5 MP, 2592x1944 pixels, Carl Zeiss optics, autofocus, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Yes, VGA@15fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : - MP3/WMA/WAV/RA/AAC/M4A music player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Silver, Black<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 32, 296 / 178.8 kbits<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 10.2 Mbps; HSUPA, 2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g, UPnP technology<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Yes, v2.0 with A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : - Digital compass<br />
            : - Turn-to-mute calls and alarm<br />
            : - WMV/RV/MP4/3GP video player<br />
            : - MP3/WMA/WAV/RA/AAC/M4A music player<br />
            : - Document Viewer (Excel, PDF, Powerpoint, Word)<br />
            : - TV Out<br />
            : - Image Editor<br />
            : - Flash Lite 3.0<br />
            : - Voice memo<br />
            : - T9<br />
            : - Car stand and charger in retail package<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Yes, with A-GPS support; Nokia Maps 3.0<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Standard battery, Li-Ion 950 mAh (BL-5F)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up to 7 h 30 min (2G) / 4 h 30 min (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 444 h (2G) / 456 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Nokia_6710_Navigator_Brown_1251169053.jpg', CAST(0x00009CAB00000000 AS DateTime), 7, 0, 60, 4, 4, N'Nokia-6710-Navigator-Brown', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (22, N'NOKIA 6720 Brown', 4990000.0000, N'6720 Classic có kiểu dáng dạng thanh, máy dễ dạng chia sẽ với các thiết bị giải trí khác thông qua công nghệ DNA.

Tuy nhiên, một điểm thất vọng là 6720 Classic không có Wi-Fi. Máy có màn hình nhỏ, 2,2 inch, pin sử dụng trên hai ngày. 

6720 Classic của Nokia trang bị giắc cắm tai nghe 3,5 mm, cổng TV-out, khe cắm thẻ nhớ microSD cho phép mở rộng tối đa lên tới 8 GB, nhưng bộ phụ kiện đi kèm chỉ có thẻ 1 GB.', N'<table cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%E1%BA%A1ng&amp;width=450&amp;height=300" title="Mạng">Mạng</a></td>
          <td> : HSDPA / GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ra+m%E1%BA%AFt&amp;width=450&amp;height=300" title="Ra mắt">Ra mắt</a></td>
          <td> : Tháng 03 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ng%C3%B4n+ng%E1%BB%AF&amp;width=450&amp;height=300" title="Ngôn ngữ">Ngôn ngữ</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=K%C3%ADch+th%C6%B0%E1%BB%9Bc&amp;width=450&amp;height=300" title="Kích thước">Kích thước</a></td>
          <td> : 110 x 45 x 14 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tr%E1%BB%8Dng+l%C6%B0%E1%BB%A3ng&amp;width=450&amp;height=300" title="Trọng lượng">Trọng lượng</a></td>
          <td> : 110 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%C3%A0n+h%C3%ACnh&amp;width=450&amp;height=300" title="Màn hình">Màn hình</a></td>
          <td> : Màn hình TFT, 16 triệu màu<br />
            : 240 x 320 pixels, 2.2 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ki%E1%BB%83u+chu%C3%B4ng&amp;width=450&amp;height=300" title="Kiểu chuông">Kiểu chuông</a></td>
          <td> : Âm thanh đa âm(64 âm sắc), MP3<br />
            : Âm thanh loa Stereo<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Rung&amp;width=450&amp;height=300" title="Rung">Rung</a></td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+trong+m%C3%A1y&amp;width=450&amp;height=300" title="Lưu trong máy">Lưu trong máy</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+tr%E1%BB%AF+cu%E1%BB%99c+g%E1%BB%8Di&amp;width=450&amp;height=300" title="Lưu trữ cuộc gọi">Lưu trữ cuộc gọi</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Khe+c%E1%BA%AFm+th%E1%BA%BB+nh%E1%BB%9B&amp;width=450&amp;height=300" title="Khe cắm thẻ nhớ">Khe cắm thẻ nhớ</a></td>
          <td> : MicroSD hỗ trợ lên đến 8GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=B%E1%BB%99+nh%E1%BB%9B+trong&amp;width=450&amp;height=300" title="Bộ nhớ trong">Bộ nhớ trong</a></td>
          <td> : 50MB bộ nhớ trong<br />
            : ARM 11 600 MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%87+%C4%91i%E1%BB%81u+h%C3%A0nh&amp;width=450&amp;height=300" title="Hệ điều hành">Hệ điều hành</a></td>
          <td> : Symbian OS 9.2, S60 rel. 3.2<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tin+nh%E1%BA%AFn&amp;width=450&amp;height=300" title="Tin nhắn">Tin nhắn</a></td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=T%C3%ADch+h%E1%BB%A3p+Camera&amp;width=450&amp;height=300" title="Tích hợp Camera">Tích hợp Camera</a></td>
          <td> : 5 MP, 2592 x 1944 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Quay+Video&amp;width=450&amp;height=300" title="Quay Video">Quay Video</a></td>
          <td> : Ống kính cao cấp Carl Zeiss optics<br />
            : Tự lấy nét(autofocus), video(VGA 30fps), đèn xenon flash.<br />
            : Camera CIF hỗ trợ cuộc gọi video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Nghe+nh%E1%BA%A1c&amp;width=450&amp;height=300" title="Nghe nhạc">Nghe nhạc</a></td>
          <td> : Nghe nhạc MP3/AAC/AAC+/eAAC+/WMA player, quay video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Game&amp;width=450&amp;height=300" title="Game">Game</a></td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPRS&amp;width=450&amp;height=300" title="GPRS">GPRS</a></td>
          <td> : Class 32, 107 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=HSCSD&amp;width=450&amp;height=300" title="HSCSD">HSCSD</a></td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=EDGE&amp;width=450&amp;height=300" title="EDGE">EDGE</a></td>
          <td> : Class 32, 296 kbps; DTM Class 11, 177 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=3G&amp;width=450&amp;height=300" title="3G">3G</a></td>
          <td> : Có chuẩn HSDPA<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Bluetooth&amp;width=450&amp;height=300" title="Bluetooth">Bluetooth</a></td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%93ng+ngo%E1%BA%A1i&amp;width=450&amp;height=300" title="Hồng ngoại">Hồng ngoại</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=USB&amp;width=450&amp;height=300" title="USB">USB</a></td>
          <td> : Có, v2.0 microUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=T%C3%ADnh+n%C4%83ng+%C4%91%E1%BA%B7c+bi%E1%BB%87t&amp;width=450&amp;height=300" title="Tính năng đặc biệt">Tính năng đặc biệt</a></td>
          <td> : Chức năng định vị toàn cầu GPS cho phép tìm đường hơn 100 quốc gia trên toàn thế giới <br />
            : 3.5 mm audio output jack máy có thể kết nối với TV thông qua cổng TV out<br />
            : Cuộc gọi hình ảnh<br />
            : Java MIDP 2.0<br />
            : Chức năng bộ đàm<br />
            : Nghe Stereo FM Radio <br />
            : Ra lệnh và quay số bằng giọng nói<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Máy tính cá nhân<br />
            : Đồng hồ báo thức<br />
            : Loa ngoài<br />
            : Xem và sửa ảnh<br />
            : Hỗ trợ chức năng văn phòng<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=%C4%90%E1%BB%93ng+b%E1%BB%99+h%C3%B3a+D%E1%BB%AF+li%E1%BB%87u&amp;width=450&amp;height=300" title="Đồng bộ hóa Dữ liệu">Đồng bộ hóa Dữ liệu</a></td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=C%C3%A1ch+nh%E1%BA%ADp+d%E1%BB%AF+li%E1%BB%87u&amp;width=450&amp;height=300" title="Cách nhập dữ liệu">Cách nhập dữ liệu</a></td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPS&amp;width=450&amp;height=300" title="GPS">GPS</a></td>
          <td> : Có với A-GPS support, Nokia Maps<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Pin&amp;width=450&amp;height=300" title="Pin">Pin</a></td>
          <td> : Pin chuẩn, Li-Ion 1050 mAh (BP-6MT)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+%C4%91%C3%A0m+tho%E1%BA%A1i&amp;width=450&amp;height=300" title="Thời gian đàm thoại">Thời gian đàm thoại</a></td>
          <td> : Up to 8 h 30 min (2G) / 5 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+ch%E1%BB%9D&amp;width=450&amp;height=300" title="Thời gian chờ">Thời gian chờ</a></td>
          <td> : Up to 492 h (2G) / 504 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_NOKIA_6720_Brown_1247478323.jpg', CAST(0x00009C1400000000 AS DateTime), 0, 0, 2, 4, 5, N'NOKIA-6720-Brown', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (23, N'NOKIA 6720 Grey', 4990000.0000, N'6720 Classic có kiểu dáng dạng thanh, máy dễ dạng chia sẽ với các thiết bị giải trí khác thông qua công nghệ DNA.
Tuy nhiên, một điểm thất vọng là 6720 Classic không có Wi-Fi. Máy có màn hình nhỏ, 2,2 inch, pin sử dụng trên hai ngày. 
6720 Classic của Nokia trang bị giắc cắm tai nghe 3,5 mm, cổng TV-out, khe cắm thẻ nhớ microSD cho phép mở rộng tối đa lên tới 8 GB, nhưng bộ phụ kiện đi kèm chỉ có thẻ 1 GB.', N'<table cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%E1%BA%A1ng&amp;width=450&amp;height=300" title="Mạng">Mạng</a></td>
          <td> : HSDPA / GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ra+m%E1%BA%AFt&amp;width=450&amp;height=300" title="Ra mắt">Ra mắt</a></td>
          <td> : Tháng 03 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ng%C3%B4n+ng%E1%BB%AF&amp;width=450&amp;height=300" title="Ngôn ngữ">Ngôn ngữ</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=K%C3%ADch+th%C6%B0%E1%BB%9Bc&amp;width=450&amp;height=300" title="Kích thước">Kích thước</a></td>
          <td> : 110 x 45 x 14 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tr%E1%BB%8Dng+l%C6%B0%E1%BB%A3ng&amp;width=450&amp;height=300" title="Trọng lượng">Trọng lượng</a></td>
          <td> : 110 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=M%C3%A0n+h%C3%ACnh&amp;width=450&amp;height=300" title="Màn hình">Màn hình</a></td>
          <td> : Màn hình TFT, 16 triệu màu<br />
            : 240 x 320 pixels, 2.2 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Ki%E1%BB%83u+chu%C3%B4ng&amp;width=450&amp;height=300" title="Kiểu chuông">Kiểu chuông</a></td>
          <td> : Âm thanh đa âm(64 âm sắc), MP3<br />
            : Âm thanh loa Stereo<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Rung&amp;width=450&amp;height=300" title="Rung">Rung</a></td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+trong+m%C3%A1y&amp;width=450&amp;height=300" title="Lưu trong máy">Lưu trong máy</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=L%C6%B0u+tr%E1%BB%AF+cu%E1%BB%99c+g%E1%BB%8Di&amp;width=450&amp;height=300" title="Lưu trữ cuộc gọi">Lưu trữ cuộc gọi</a></td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Khe+c%E1%BA%AFm+th%E1%BA%BB+nh%E1%BB%9B&amp;width=450&amp;height=300" title="Khe cắm thẻ nhớ">Khe cắm thẻ nhớ</a></td>
          <td> : MicroSD hỗ trợ lên đến 8GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=B%E1%BB%99+nh%E1%BB%9B+trong&amp;width=450&amp;height=300" title="Bộ nhớ trong">Bộ nhớ trong</a></td>
          <td> : 50MB bộ nhớ trong<br />
            : ARM 11 600 MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%87+%C4%91i%E1%BB%81u+h%C3%A0nh&amp;width=450&amp;height=300" title="Hệ điều hành">Hệ điều hành</a></td>
          <td> : Symbian OS 9.2, S60 rel. 3.2<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Tin+nh%E1%BA%AFn&amp;width=450&amp;height=300" title="Tin nhắn">Tin nhắn</a></td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=T%C3%ADch+h%E1%BB%A3p+Camera&amp;width=450&amp;height=300" title="Tích hợp Camera">Tích hợp Camera</a></td>
          <td> : 5 MP, 2592 x 1944 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Quay+Video&amp;width=450&amp;height=300" title="Quay Video">Quay Video</a></td>
          <td> : Ống kính cao cấp Carl Zeiss optics<br />
            : Tự lấy nét(autofocus), video(VGA 30fps), đèn xenon flash.<br />
            : Camera CIF hỗ trợ cuộc gọi video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Nghe+nh%E1%BA%A1c&amp;width=450&amp;height=300" title="Nghe nhạc">Nghe nhạc</a></td>
          <td> : Nghe nhạc MP3/AAC/AAC+/eAAC+/WMA player, quay video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Game&amp;width=450&amp;height=300" title="Game">Game</a></td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPRS&amp;width=450&amp;height=300" title="GPRS">GPRS</a></td>
          <td> : Class 32, 107 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=HSCSD&amp;width=450&amp;height=300" title="HSCSD">HSCSD</a></td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=EDGE&amp;width=450&amp;height=300" title="EDGE">EDGE</a></td>
          <td> : Class 32, 296 kbps; DTM Class 11, 177 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=3G&amp;width=450&amp;height=300" title="3G">3G</a></td>
          <td> : Có chuẩn HSDPA<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Bluetooth&amp;width=450&amp;height=300" title="Bluetooth">Bluetooth</a></td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=H%E1%BB%93ng+ngo%E1%BA%A1i&amp;width=450&amp;height=300" title="Hồng ngoại">Hồng ngoại</a></td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=USB&amp;width=450&amp;height=300" title="USB">USB</a></td>
          <td> : Có, v2.0 microUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=T%C3%ADnh+n%C4%83ng+%C4%91%E1%BA%B7c+bi%E1%BB%87t&amp;width=450&amp;height=300" title="Tính năng đặc biệt">Tính năng đặc biệt</a></td>
          <td> : Chức năng định vị toàn cầu GPS cho phép tìm đường hơn 100 quốc gia trên toàn thế giới <br />
            : 3.5 mm audio output jack máy có thể kết nối với TV thông qua cổng TV out<br />
            : Cuộc gọi hình ảnh<br />
            : Java MIDP 2.0<br />
            : Chức năng bộ đàm<br />
            : Nghe Stereo FM Radio <br />
            : Ra lệnh và quay số bằng giọng nói<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Máy tính cá nhân<br />
            : Đồng hồ báo thức<br />
            : Loa ngoài<br />
            : Xem và sửa ảnh<br />
            : Hỗ trợ chức năng văn phòng<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=%C4%90%E1%BB%93ng+b%E1%BB%99+h%C3%B3a+D%E1%BB%AF+li%E1%BB%87u&amp;width=450&amp;height=300" title="Đồng bộ hóa Dữ liệu">Đồng bộ hóa Dữ liệu</a></td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=C%C3%A1ch+nh%E1%BA%ADp+d%E1%BB%AF+li%E1%BB%87u&amp;width=450&amp;height=300" title="Cách nhập dữ liệu">Cách nhập dữ liệu</a></td>
          <td> : Bàn phím<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=GPS&amp;width=450&amp;height=300" title="GPS">GPS</a></td>
          <td> : Có với A-GPS support, Nokia Maps<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Pin&amp;width=450&amp;height=300" title="Pin">Pin</a></td>
          <td> : Pin chuẩn, Li-Ion 1050 mAh (BP-6MT)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+%C4%91%C3%A0m+tho%E1%BA%A1i&amp;width=450&amp;height=300" title="Thời gian đàm thoại">Thời gian đàm thoại</a></td>
          <td> : Up to 8 h 30 min (2G) / 5 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140"><a href="http://dienthoaididong.com.vn/vn/tudien.php?keyword=Th%E1%BB%9Di+gian+ch%E1%BB%9D&amp;width=450&amp;height=300" title="Thời gian chờ">Thời gian chờ</a></td>
          <td> : Up to 492 h (2G) / 504 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_NOKIA_6720_Grey_1247478336.jpg', CAST(0x00009B0600000000 AS DateTime), 1, 0, 61, 4, 3, N'NOKIA-6720-Grey', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (24, N'NOKIA 8800 Gold Arte', 26650000.0000, N'Nokia 8800 Gold Arte - Kiệt tác vàng của thế giới điện thoại !

Được hé lộ từ khá lâu nhưng chính sự kín tiếng của các kỹ sư thiết kế hàng đầu của hãng Nokia đã làm cho đa phần người dụng giới điện thoại hạng sang chờ đợi khá lâu để có được chiếc điện thoại cao cấp nhất của thế giới điện thoại này thì bất ngờ đầu tháng 2 năm 2009 hãng di động số 1 thế giới đã bổ sung thêm một kiệt tác mới thuộc dòng máy cao cấp mang tên Nokia 8800 Gold Arte. Nokia 8800 Gold Arte được phủ một lớp áo đắt tiền, là vàng 18 carat cùng chất liệu da thật màu trắng, thế nên thiết bị cao cấp này được đánh giá là sang trọng, lịch lãm hơn Nokia 8800 Carbon Arte.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 12 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 109 x 45.6 x 14.6 mm, 65 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 150 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : OLED, 16M màu<br />
            : 240 x 320 pixels, 2.0 inches<br />
            : Màn hình chống va đập<br />
            : Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Đa âm, MP3 ringtones<br />
            : Downloadable polyphonic, MP3 ringtones<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 20 Cuộc gọi đến, 20 cuộc gọi nhỡ, 20 cuộc gọi đi<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 4 GB bộ nhớ trong<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Có, 384 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 với chuẩn A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có,  microUSB OTG<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS 1.2, Email, IM<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Gold<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels, autofocus, <br />
            : Quay video VGA@15fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.1<br />
            : Mạ vàng 18K<br />
            : Chơi nhạc MP3/AAC/eAAC player<br />
            : Từ điển T9<br />
            : Ghi âm<br />
            : Loa ngoài<br />
            : Lịch<br />
            : Máy tính cá nhân<br />
            : Ra lệnh bằng giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1000 mAh (BL-4U)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 300 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 2h 20</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_NOKIA_8800_Gold_Arte_1238835307.jpg', CAST(0x00009CAB00000000 AS DateTime), 0, 0, 16, 4, 2, N'NOKIA-8800-Gold-Arte', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (25, N'NOKIA 8800 Gold', 24700000.0000, N'Nokia 8800 Gold Arte - Kiệt tác vàng của thế giới điện thoại !

Được hé lộ từ khá lâu nhưng chính sự kín tiếng của các kỹ sư thiết kế hàng đầu của hãng Nokia đã làm cho đa phần người dụng giới điện thoại hạng sang chờ đợi khá lâu để có được chiếc điện thoại cao cấp nhất của thế giới điện thoại này thì bất ngờ đầu tháng 2 năm 2009 hãng di động số 1 thế giới đã bổ sung thêm một kiệt tác mới thuộc dòng máy cao cấp mang tên Nokia 8800 Gold Arte. Nokia 8800 Gold Arte được phủ một lớp áo đắt tiền, là vàng 18 carat cùng chất liệu da thật màu trắng, thế nên thiết bị cao cấp này được đánh giá là sang trọng, lịch lãm hơn Nokia 8800 Carbon Arte.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 12 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 109 x 45.6 x 14.6 mm, 65 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 150 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : OLED, 16M màu<br />
            : 240 x 320 pixels, 2.0 inches<br />
            : Màn hình chống va đập<br />
            : Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Đa âm, MP3 ringtones<br />
            : Downloadable polyphonic, MP3 ringtones<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 20 Cuộc gọi đến, 20 cuộc gọi nhỡ, 20 cuộc gọi đi<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 4 GB bộ nhớ trong<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Có, 384 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 với chuẩn A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có,  microUSB OTG<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS 1.2, Email, IM<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Gold<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels, autofocus, <br />
            : Quay video VGA@15fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.1<br />
            : Mạ vàng 18K<br />
            : Chơi nhạc MP3/AAC/eAAC player<br />
            : Từ điển T9<br />
            : Ghi âm<br />
            : Loa ngoài<br />
            : Lịch<br />
            : Máy tính cá nhân<br />
            : Ra lệnh bằng giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1000 mAh (BL-4U)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 300 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 2h 20</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'37medium_NOKIA_8800_Gold_Arte_1238835307.jpg', CAST(0x00009C6A00000000 AS DateTime), 4, 0, 79, 4, 2, N'NOKIA-8800-Gold', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (26, N'NOKIA 5530 Xpress Music White', 4730000.0000, N'Nokia 5530 XpressMusic dự kiến trở thành model chơi nhạc nóng bỏng nhất mùa hè 2009. Di động không chơi bàn phím thực, đầu tư màn hình cảm ứng 2.9 inch hiển thị 16 triệu màu, thêm chiếc camera 3.2 megapixel và đèn LED flash, kết nối Bluetooth và Wi-Fi. Tính năng nghe nhạc dành cho tất cả định dạng tải về từ Nokia Music Store, trình diễn video widescreen 640×360, khe cắm thẻ nhớ mở rộng microSD và giắc cắm tai nghe chuẩn 3.5 mm.
Hiện tại, model chơi nhạc 5530 XpressMusic đang là mobile cảm ứng hàng hiệu thứ 3 của Nokia, sau 5800 XpressMusic và N97. Cả 2 ngôi sao cảm ứng trước của Nokia đều thu hút được sự chú ý và cảm tình của teen nên rất có thể 5530 XpressMusic cũng sẽ phát huy tốt thành tích đó.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 08 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104 x 49 x 13 mm, 68 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 107 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT touchscreen, 16M màu<br />
            : Cảm hứng định hướng tự động xoay chuyển màn hình<br />
            : 360 x 640 pixels, 2.9 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm (64 channels)<br />
            : MP3, Loa Stereo speakers<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD lên đến 16GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 70 MB storage<br />
            : 128 MB SDRAM<br />
            : ARM 11 434 MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Hệ điều hành Symbian OS v9.4,<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : 3.15 MP, 2048x1536 pixels<br />
            : Tự lấy nét(autofocus), quay video (VGA@30fps), đèn flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc MP3/WMA/WAV/eAAC+ player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g, công nghệ UPnP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0 microUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Từ điển T9<br />
            : Nghe FM radio chuẩn  RDS <br />
            : Âm thanh Hifi chất lượng cao<br />
            : Nghe nhạc MP3/WMA/WAV/eAAC+ player<br />
            :  Xem phim MPEG4/WMV/3gp video player<br />
            : Máy tính cá nhân<br />
            : Jack chuyển 3.5 mm <br />
            : Xem tài liệu<br />
            : Chỉnh sửa ảnh<br />
            : Đồng hồ bấm giờ<br />
            : Loa ngoài<br />
            : Nhắc nhở công việc<br />
            : Ghi âm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím ảo<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1000 mAh(BL-4U)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 4 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 270 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_NOKIA_5530_Xpress_Music_White_1254726710.jpg', CAST(0x00009B8100000000 AS DateTime), 0, 0, 73, 4, 3, N'NOKIA-5530-Xpress-Music-White', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (27, N'NOKIA 5530 Xpress Music Red', 4730000.0000, N'Nokia 5530 XpressMusic dự kiến trở thành model chơi nhạc nóng bỏng nhất mùa hè 2009. Di động không chơi bàn phím thực, đầu tư màn hình cảm ứng 2.9 inch hiển thị 16 triệu màu, thêm chiếc camera 3.2 megapixel và đèn LED flash, kết nối Bluetooth và Wi-Fi. Tính năng nghe nhạc dành cho tất cả định dạng tải về từ Nokia Music Store, trình diễn video widescreen 640×360, khe cắm thẻ nhớ mở rộng microSD và giắc cắm tai nghe chuẩn 3.5 mm.
Hiện tại, model chơi nhạc 5530 XpressMusic đang là mobile cảm ứng hàng hiệu thứ 3 của Nokia, sau 5800 XpressMusic và N97. Cả 2 ngôi sao cảm ứng trước của Nokia đều thu hút được sự chú ý và cảm tình của teen nên rất có thể 5530 XpressMusic cũng sẽ phát huy tốt thành tích đó.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 08 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104 x 49 x 13 mm, 68 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 107 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT touchscreen, 16M màu<br />
            : Cảm hứng định hướng tự động xoay chuyển màn hình<br />
            : 360 x 640 pixels, 2.9 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm (64 channels)<br />
            : MP3, Loa Stereo speakers<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD lên đến 16GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 70 MB storage<br />
            : 128 MB SDRAM<br />
            : ARM 11 434 MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Hệ điều hành Symbian OS v9.4,<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : 3.15 MP, 2048x1536 pixels<br />
            : Tự lấy nét(autofocus), quay video (VGA@30fps), đèn flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc MP3/WMA/WAV/eAAC+ player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 32<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g, công nghệ UPnP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0 microUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Từ điển T9<br />
            : Nghe FM radio chuẩn  RDS <br />
            : Âm thanh Hifi chất lượng cao<br />
            : Nghe nhạc MP3/WMA/WAV/eAAC+ player<br />
            :  Xem phim MPEG4/WMV/3gp video player<br />
            : Máy tính cá nhân<br />
            : Jack chuyển 3.5 mm <br />
            : Xem tài liệu<br />
            : Chỉnh sửa ảnh<br />
            : Đồng hồ bấm giờ<br />
            : Loa ngoài<br />
            : Nhắc nhở công việc<br />
            : Ghi âm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím ảo<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1000 mAh(BL-4U)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 4 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 270 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_NOKIA_5530_XpressMusic_1252746515.jpg', CAST(0x00009B6300000000 AS DateTime), 2, 0, 67, 4, 3, N'NOKIA-5530-Xpress-Music-Red', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (28, N'Nokia N97 White', 11670000.0000, N'Nokia N97 màn hình cảm ứng đã có mặt

Chiều nay (2/12), Nokia đã giới thiệu N97 với màn hình cảm ứng rộng 3,5 inch, bàn phím QWERTY trượt ngang, bộ nhớ 32 GB.

Đúng như dự đoán của giới công nghệ, Nokia đã chính thức giới thiệu chiếc N-series đầu tiên có màn hình cảm ứng. Model này sẽ là đối thủ của iPhone, Touch HD hay Samsung Omnia trên phân khúc dế thông minh cảm ứng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900 , HSDPA 900 / 2100 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 6 Năm2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh, Tiếng Việt<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 117.2 x 55.3 x 15.9 mm, 88 cc<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 150g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình cảm ứng TFT, 16M màu<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : QWERTY đầy đủ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc Chuông 64 âm sắc, MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số, hiển thị hình ảnh người gọi<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Lưu trữ trong 30 ngày<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash), Hỗ trợ lên đến 16G<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : CPU : ARM 11 434 MHz processor<br />
            : 32 GB storage, 128 MB RAM<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Symbian OS v9.4, Series 60 rel. 5<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Push Email, IM<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5 MP, 2592x1944 pixels, Carl Zeiss optics, autofocus, LED flash, video light<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : WAP 2.0/xHTML, HTML, RSS feeds<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Pin chuẩn Li-Ion 1500 mAh (BP-4L)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Lên đến 432 h (2G) / 408 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Lên đến 9 h 30 min (2G) / lên đến 6 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 3.6 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g, UPnP technology<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Yes, v2.0 with A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Yes, v2.0 microUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : - Digital compass<br />
            : - MP3/WMA/WAV/eAAC+ music player <br />
            : - WMV/RealVideo/MP4 video player <br />
            : - TV-out <br />
            : - Voice command/dial <br />
            : - Pocket Office (Word, Excel, PowerPoint, PDF viewer) <br />
            : - Video and photo editor <br />
            : - Flash Lite 3 <br />
            : - T9<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Có, A-GPS support; Nokia Maps<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Standard battery, Li-Ion 1500 mAh (BP-4L)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up to 9 h 30 min (2G) / Up to 6 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 432 h (2G) / 408 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Nokia_N97_1244282008.jpg', CAST(0x00009BDA00000000 AS DateTime), 1, 0, 60, 4, 1, N'Nokia-N97-White', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (29, N'Sony Ericsson Xperia X1 Solid Black', 8350000.0000, N'Sony Ericcsson X1 - Phong cách của tôi.
Giao diện màn hình XPERIA X1 tuyệt đẹp
Tận hưởng nhiều cảm giác truy cập Web, đa phương tiện, ứng dụng từ ngay desktop. Chỉnh hướng bằng đầu ngón tay của bạn. Định cấu hình và hiển thị giao diện XPERIA™ theo cách bạn muốn.
 
Mang lại phong cách rất riêng
Cuộc sống là di động. Hãy luôn mang theo mọi thứ quan trọng bên mình. Những mối liên hệ trong cuộc sống, Internet, âm nhạc, hình ảnh và video.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : HSDPA / GSM 850 / 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 02 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 110.5 x 52.6 x 17 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 145 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT touchscreen<br />
            : 800 x 480 pixels, 3.0 inches<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím QWERTY<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 400 MB internal memory<br />
            : 128MB RAM, 512MB storage memory<br />
            : Bộ xử lý Qualcomm MSM7200 528MHz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Microsoft Windows Mobile 6.1 Professional<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, EMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels, autofocus, video(VGA@30fps), flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Tự chỉnh tiêu cự<br />
            : Quay video ( VGA 30fps ) , hỗ trợ flash<br />
            : Camera CIF dành cho cuộc gọi hình ảnh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : Nghe nhạc MP3/AAC/MPEG4 player<br />
            : Nghe nhạc theo định dạng ( rackID music recognition )<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0, công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0 miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Hệ thống định vị toàn cầu GPS<br />
            : Java MIDP 2.0<br />
            : Có thể lưu trữ ảnh(Picture editor/blogging)<br />
            : Nghe FM radio công nghệ RDS<br />
            : Tính năng văn phòng Pocket Office (Word, Excel, PowerPoint, OneNote, PDF viewer)<br />
            : Lịch làm việc<br />
            : Từ điển T9<br />
            : Chức năng bộ đàm<br />
            : Ghi âm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Bàn phím<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Po 1500 mAh (BST-41)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 10 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến  833 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SONY_ERICSSON_XPERIA_X1_Solid_Black_1239357034.jpg', CAST(0x00009CAB00000000 AS DateTime), 4, 1, 23, 5, 5, N'Sony-Ericsson-Xperia-X1-Solid-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (30, N'Sony Ericsson W995 Black', 7850000.0000, N'W995 là chiếc Walkman đầu tiên có giắc cắm tai nghe 3,5 mm, một chiếc Walkman giải trí đỉnh cao "lai" Cyber-shot.

Sony Ericsson W995 được công bố lần đầu tiên tại MWC 2009 tháng 2 năm nay. Chiếc điện thoại tạo được thiện cảm với người yêu dòng Walkman, bởi đây là model đầu tiên của series chơi nhạc này trang bị giắc cắm tai nghe 3,5 mm.

Ngoài ra, máy còn có camera 8 Megapixel, trang bị của một chiếc di động Cyber-shot đỉnh cao như C905. Trên thực tế, tại MWC, liên minh Nhật Bản - Thụy Điển đã chuyển hai nhãn hiệu Cyber-shot và Walkman trong một series mang tên Entertainment Unlimited. Satio (Idou) là một trong những thiết bị đầu tiên của dòng sản phẩm này.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / GSM 900 / GSM 1800 / GSM 1900, HSDPA 900 / 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 03 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 97 x 49 x 15 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 113 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 256K màu<br />
            : 240 x 320 pixels, 2.6&quot;<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3, AAC,  Loa Stereo speakers<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số, danh bạ hình ảnh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đi, 30 cuộc gọi đến, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Memory Stick Micro (M2), up to 8GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 118MB bộ nhớ chi sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA 3.6 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g, DLNA<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Yes, with A-GPS support; Wayfinder navigator<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, EMS, MMS, Email<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML (NetFront )<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Nhận dạng bài hát TrackID music recognition<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Jungle Grey, Lava Black, Cosmopolitan White, Active Blue<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 8.1 MP, 3264x2448 pixels, autofocus, LED flash<br />
            : Video WQVGA@30fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : - MP3/AAC/MPEG4 player<br />
            : - TrackID music recognition<br />
            : - Picture editor/blogging<br />
            : - YouTube application<br />
            : - Organizer<br />
            : - Voice memo/dial<br />
            : - Walkman 4.0 player<br />
            : - Shake control<br />
            : - SensMe<br />
            : - Kickstand<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Po 930 mAh (BST-38)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 370 h (2G) / Up to 360 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up to 9 h (2G) / Up to 4 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Sony_Ericsson_W995_Black_cu_Cong_ty_cu_1248774512.jpg', CAST(0x00009B2B00000000 AS DateTime), 2, 0, 89, 5, 5, N'Sony-Ericsson-W995-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (31, N'SONY ERICSSON W205 White', 1870000.0000, N'Nhận diện âm nhạc

Thêm nhạc thêm vui. Dùng TrackID™ để nhận diện các bài hát bạn chưa biết - nhưng muốn thưởng thức lại.
Giải trí với đài FM

Chỉnh đài FM sang kênh bạn thích. Khi nghe một giai điệu ưa thích, sao không thu lại và dùng nó làm nhạc chuông của bạn?
Nhiều danh bạ

Luôn quản lý số liên lạc ngay cả khi bạn và gia đình dùng chung điện thoại W205. Điện thoại hỗ trợ một danh bạ chung và bốn danh bạ riêng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 Năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 92 x 47 x 16.4 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 96 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 65K màu<br />
            : 128 x 160 pixels, 1.8 inches<br />
            : Có thể tải Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3, AAC<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Memory Stick Micro (M2)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 5MB bộ nhớ chia sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML(NetFront), RSS feeds<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Ambient Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 1.3 MP, 1280 x 1024 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.0<br />
            : Walkman player 1.0<br />
            : Nghe FM radio<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Loa ngoai<br />
            : Ghi âm giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 425 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 9 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SONY_ERICSSON_W205_White_1249979104.jpg', CAST(0x00009CD500000000 AS DateTime), 35, 6, 20, 5, 1, N'SONY-ERICSSON-W205-White', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (32, N'SONY ERICSSON W205 Black', 1780000.0000, N'Nhận diện âm nhạc

Thêm nhạc thêm vui. Dùng TrackID™ để nhận diện các bài hát bạn chưa biết - nhưng muốn thưởng thức lại.
Giải trí với đài FM

Chỉnh đài FM sang kênh bạn thích. Khi nghe một giai điệu ưa thích, sao không thu lại và dùng nó làm nhạc chuông của bạn?
Nhiều danh bạ

Luôn quản lý số liên lạc ngay cả khi bạn và gia đình dùng chung điện thoại W205. Điện thoại hỗ trợ một danh bạ chung và bốn danh bạ riêng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 Năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 92 x 47 x 16.4 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 96 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 65K màu<br />
            : 128 x 160 pixels, 1.8 inches<br />
            : Có thể tải Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3, AAC<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Memory Stick Micro (M2)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 5MB bộ nhớ chia sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML(NetFront), RSS feeds<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Ambient Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 1.3 MP, 1280 x 1024 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.0<br />
            : Walkman player 1.0<br />
            : Nghe FM radio<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Loa ngoai<br />
            : Ghi âm giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 425 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 9 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SONY_ERICSSON_W205_Black_1249978945.jpg', NULL, 0, 0, 98, 5, 5, N'SONY-ERICSSON-W205-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (33, N'SONY ERICSSON S312 Sliver', NULL, N'Kéo, thả và thưởng thức - Media Go™
Công cụ giải trí hoàn hảo - Media Go™ giúp bạn luôn mang theo nội dung media ở bất cứ nơi đâu dễ dàng hơn bao giờ hết. Truyền các tập tin media giữa điện thoại và PC bằng cách kéo và thả. Chuyển đổi tập tin cũng thật đơn giản: Media Go™ tự động chuyển đổi các đoạn phim và các tập tin nhạc để mang lại cho bạn chất lượng tốt nhất.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 Năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 100 x 46 x 12.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 80.1 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 256K màu<br />
            : 176 x 220 pixels, 2.0 inches<br />
            : Có thể tải Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3, AAC<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Memory Stick Micro (M2)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 15MB bộ nhớ chia sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 with A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML(NetFront), RSS feeds<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Ambient Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 2 MP, 1600x1200 pixels, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.0<br />
            : Walkman player 1.0<br />
            : Nghe FM radio<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Loa ngoai<br />
            : Ghi âm giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 400 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 8 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SONY_ERICSSON_S312_Sliver_1249979281.jpg', CAST(0x00009CAB00000000 AS DateTime), 2, 0, 82, 5, 1, N'SONY-ERICSSON-S312-Sliver', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (34, N'SONY ERICSSON S312 Black', 2410000.0000, N'Sửa ảnh cho ảnh càng thêm đẹp
Cải thiện chất lượng ảnh ngoài sự mong đợi. Chỉ một thao tác bấm sẽ giúp bạn chỉnh độ sáng, đèn và độ tương phản để mang lại cho bạn bức ảnh đẹp nhất.
Camera tích hợp
Camera kỹ thuật số tích hợp với màn hình kính ngắm, menu chuyên dụng kết hợp trực tiếp với các chức năng chụp ảnh và nhắn tin trong điện thoại.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 Năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 100 x 46 x 12.5 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 80.1 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 256K màu<br />
            : 176 x 220 pixels, 2.0 inches<br />
            : Có thể tải Wallpapers, screensavers<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm, MP3, AAC<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Memory Stick Micro (M2)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 15MB bộ nhớ chia sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 with A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML(NetFront), RSS feeds<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Ambient Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 2 MP, 1600x1200 pixels, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.0<br />
            : Walkman player 1.0<br />
            : Nghe FM radio<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Loa ngoai<br />
            : Ghi âm giọng nói<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 400 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 8 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SONY_ERICSSON_S312_Black_1249979324.jpg', CAST(0x0000993D00000000 AS DateTime), 1, 0, 78, 5, 2, N'SONY-ERICSSON-S312-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (35, N'Sony Ericsson S500 Spring Yellow Cũ', 1990000.0000, N'Sony Ericsson S500i - Đẳng cấp vượt trội

Sony Ericsson S500 là điện thoại nắp trượt nhỏ, siêu mỏng, có các điểm nhấn màu và các chủ đề thay đổi trên màn hình chính. Hãy diễn đạt tâm hồn nghệ thuật của bạn bằng các chủ đề đã được cài đặt sẵn và các hiệu ứng ánh sáng bên ngoài bất kỳ khi nào bạn muốn. Thậm chí bạn có thể thay đổi theo mùa, bởi vì chế độ của nó có thể thay đổi từ ngày sang đêm, hoặc từ chế độ ngày thường sang chế độ cuối tuần. Các lựa chọn như thế cho phép bạn biểu lộ cảm xúc cá nhân cũng như những cảm hứng của riêng mình với cuộc sống. Một trái tim rung động, một nỗi buồn man mác, những phút giây thiêng liêng ấy sẽ không qua đi mà sẽ còn đọng mãi, sẽ được khơi dậy dùng với chiếc điện thoại luôn đồng hành cùng bạn.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : GSM 850 / GSM 900 / GSM 1800 / GSM 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 99 x 47 x 14 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 94 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT, 256K màu<br />
            : 240 x 320 pixels, 2.0 inch<br />
            : Wallpapers, themes<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(72 âm sắc), MP3, AAC<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số, danh bạ hình ảnh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đi, 30 cuộc gọi nhỡ, 30 cuộc gọi đến<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Memory Stick Micro (M2)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 12MB bộ nhớ chia sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Có, Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/HTML(NetFront), RSS feeds<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Mysterious Green, Spring Yellow<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 2.0 MP, 1600x1200 pixels, quay video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : TrackID music recognition<br />
            : Java MIDP 2.0<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Nhắc nhở công việc<br />
            : Máy tính cá nhân<br />
            : Ghi âm giọng nói<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Po 900 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 370 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 9 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SONY_ERICSSON_S500i_Spring_Yellow_Brandnew_1239092018.jpg', CAST(0x00009B8A00000000 AS DateTime), 1, 0, 76, 5, 2, N'Sony-Ericsson-S500-Spring-Yellow-Cu', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (36, N'SAMSUNG i8910 Omnia HD Black 16GB', 12400000.0000, N'Samsung đã có một cuộc trình diễn ấn tượng tại Hội nghị di động thế giới MWC 2009 vừa kết thúc trong tuần qua, và có lẽ chú dế nổi bật nhất của hãng điện tử Hàn Quốc này chính là Omnia HD.

Mặc dù là phiên bản nâng cấp của Omnia nhưng Omnia HD cũng có được những sự thay đổi trong thiết kế. Chú dế mới này có những đường cong bắt mắt hơn và vẻ ngoài khá sang trọng.

Omnia HD có kích thước lớn hơn một chút so với "người anh" Omnia. Nhưng bù lại, người dùng sẽ được mãn nhãn với chiếc màn hình cảm ứng 3.7 inch, độ phân giải 640 x 360 pixel và khả năng hiển thị lên tới 16 triệu màu.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 850 / 900 / 1800 / 1900, HSDPA 900 / 1900 / 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 03 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 123 x 59 x 12.9 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 148 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : 360 x 640 pixels, 3.7 inches<br />
            : - Accelerometer sensor<br />
            : - Proximity sensor for auto turn-off<br />
            : - Scratch-resistant surface<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Bàn phím ảo<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm,  MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash) lên đến 32GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 256 MB RAM<br />
            : Bộ nhớ trong 16Gb<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Symbian OS v9.4 Series 60 rel. 5<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, EMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 8 MP, 3264x2448 pixels, autofocus, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Yes, HD 720p@24fps, D1 (720x480 pixels)@30fps, QVGA time-lapse and slow-mo video recording<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : MP3/AAC/AAC+/WMA/OGG/AMR player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 12n<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Hỗ trợ định vị toàn cầu GPS<br />
            : Nghe Stereo FM radio công nghệ RDS<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : Nghe nhạc MP3/AAC/AAC+/WMA/OGG/AMR player<br />
            : Xem phim DivX/XviD/WMV/MP4 player <br />
            : TV Out<br />
            : Loa ngoài<br />
            : Ghi âm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Cách nhập dữ liệu</td>
          <td> : Sử dụng bàn phím ảo<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1500 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up to10 h (2G) / Up to 6 h 30 min (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 430 h (2G) / Up to 450 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SAMSUNG_I8910_Omnia_HD_Black_16GB_1248946451.jpg', CAST(0x00009BD600000000 AS DateTime), 6, 1, 45, 6, 4, N'SAMSUNG-i8910-Omnia-HD-Black-16GB', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (37, N'SAMSUNG S8003 Jet', 6890000.0000, N'Samsung Jet S8003 chứng minh ưu thế vượt trội trong dòng điện thoại cảm ứng đa phương tiện với kiểu dáng đẹp hơn cả mong đợi. Tốc độ xử lý nhanh và màn hình rực rỡ hiển thị sinh động các ứng dụng truyền thông đa phương tiện. Chiếc điện thoại của tương lai này đáp ứng mọi nhu cầu của những khách hàng đam mê dòng điện thoại cảm ứng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 / 1900,HSDPA 900 / 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 06 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 108.8 x 53.5 x 11.9 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 110 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : AMOLED resistive touchscreen, 16M colors<br />
            : - TouchWiz v2.0 UI<br />
            : - Accelerometer sensor for auto-rotate and Motion UI<br />
            : - Proximity sensor for auto turn-off<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Âm thanh đa âm(64 kênh),  MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 Số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc đi, 30 cuộc gọi đến , 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash) lên đến 16GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 2GB<br />
            : Bộ vi xử lý: Qualcomm MSM6246, 800Mhz processor<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PHẦN MỀM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Hệ điều hành</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, EMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> MEDIA</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tích hợp Camera</td>
          <td> : 5 MP, 2592х1944 pixels, autofocus, video(QVGA), flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Quay Video</td>
          <td> : Máy ảnh thứ hai quay video<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Nghe nhạc</td>
          <td> : MP3/AAC/AAC+ player<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Game</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 12<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 7.2 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Wi-Fi 802.11 b/g<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, v2.0<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Tính năng đặc biệt</td>
          <td> : Nghe Stereo FM radio công nghệ RDS<br />
            : Java MIDP 2.0<br />
            : Ghi âm<br />
            : Nghe nhạc MP3/AAC/AAC+ player<br />
            : Video/audio album<br />
            : Xem phim H.264/H.263/MPEG4 player<br />
            : Loa ngoài<br />
            : - Digital compass<br />
            : - Media Gate 3D<br />
            : - Smart unlock<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KẾT NỐI</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Đồng bộ hóa Dữ liệu</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Yes, with A-GPS support, Route 66<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Standard battery, Li-Ion 1100 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Up 8 h 20 min (2G) / Up to 5 h (3G)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Up to 422 h (2G) / Up to 406 h (3G)</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_SAMSUNG_S8003_1248323299.jpg', CAST(0x00009B6B00000000 AS DateTime), 11, 6, 67, 6, 1, N'SAMSUNG-S8003-Jet', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (38, N'Samsung C3212 - 2sim online', 2170000.0000, N'Samsung vừa ra mắt mẫu điện thoại C3212 DuoS hai sim mới
Máy có hình thanh kẹo truyền thống, với điểm nổi bật là khả năng hỗ trợ 2 sim - 2 sóng online hoạt động cùng một lúc. Bàn phím alphanumeric của C3212 DuoS cũng được thiết kế khá đơn giản.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 - SIM 1<br />
            : GSM 900 / 1800 - SIM 2<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 8 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 112.7x48.6x14.3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 92g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, 65k mầu 120 x 160 pixels, 2.0 inches<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc Chuông đa âm sắc, Mp3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD hỗ trợ lên đến 8G<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 15MB<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : SIM2 (Class 10)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : SIM1 (Class 10, EDGE download only)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có V2.0 với A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có sẵn<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : VGA, 640 x 480 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Hai sim hai sóng<br />
            : JAVA™ MIDP2.0, CLDC 1.1 Hi<br />
            : Máy tính cá nhân<br />
            : Nghe nhạc, Loa ngoài<br />
            : Cài đặt hình nền, nhạc chuông<br />
            : Lịch nhắc việc, FM radio<br />
            : Đồng hồ, Báo thức<br />
            : Loa thoại rảnh tay tích hợp (Built-in handsfree)<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn Li-ion 1000mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 322h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 10h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Samsung_C3212_2sim_online_1255166327.jpg', CAST(0x00009C9B00000000 AS DateTime), 1, 0, 72, 6, 5, N'Samsung-C3212---2sim-online', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (39, N'Samsung U800 Soul Cũ', 1600000.0000, N'Được thiết kế dạng thanh với những đường nét sắc cạnh, bất cứ ai cũng có thể dễ dàng cảm nhận được sự năng động và vẻ đẹp thanh lịch toát ra từ Samsung U800. Mẫu điện thoại mới này của SAMSUNG mỏng tới 9.9mm, toàn thân được bao bọc bởi một lớp hợp kim chống gỉ. Có đầy đủ các tính năng đa phương tiện, dễ sử dụng và khả năng kết nối nhanh.

• Đột phá trong thiết kế thừa hưởng từ DNA của SAMSUNG''s Soul U900
• Đem đến sự khác biệt bởi lớp vỏ chống trầy xước
• Dạng thỏi thanh lịch, mỏng tới 9.9mm
• Màn hình TFT 2" độ phân giải QVGA 16 triệu màu hiển thị hình ảnh long lanh song hành cùng lớp vỏ rực rỡ ánh kim.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM/GPRS 900/1800, HSDPA 2100<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 Năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 111 x 46 x 9.9 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 90.4g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, 16M colors<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc Chuông đa âm sắc, Mp3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD hỗ trợ lên đến 8G<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 1 GB<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : HSDPA, 3.6 Mbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có V2.0 với A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có sẵn<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 3.15 MP, 2048x1536 pixels, LED flash<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : JAVA™ MIDP2.0, CLDC 1.1 Hi<br />
            : Máy tính cá nhân<br />
            : Nghe nhạc, Loa ngoài<br />
            : Cài đặt hình nền, nhạc chuông<br />
            : Lịch nhắc việc, FM radio<br />
            : Đồng hồ, Báo thức<br />
            : MP4, Quay Video<br />
            : Thiết kế hỗ trợ chơi game<br />
            : Loa thoại rảnh tay tích hợp (Built-in handsfree)<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn Li-ion<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 400h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 3h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Samsung_U800_Soul_1249374817.jpg', CAST(0x00009C7000000000 AS DateTime), 1, 0, 49, 6, 5, N'Samsung-U800-Soul-Cu', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (40, N'Samsung E1080', 460000.0000, NULL, N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / GSM 1800<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 09 năm 2009<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có nhiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 107 x 46 x 14mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 65g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : Màn hình TFT 65k mầu<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 200<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Lịch làm việc<br />
            : Máy tính cá nhân<br />
            : Từ điển T9<br />
            : Công cụ chuyển đổi tiền tệ<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 800mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 200 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 3 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Samsung_E1080_1252661196.jpg', CAST(0x00009CAB00000000 AS DateTime), 5, 8, 10, 6, 4, N'Samsung-E1080', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (41, N'Philips Xenium X800', 3990000.0000, N'Philips X800 và Philips Xenium X-Connect: cùng nhau cảm ứng?

Philips bắt đầu một bước tiến dài vào thị trường điện thoại cao cấp, điều mà họ lãng quên bấy lâu nay bằng việc giới thiệu hai sản phẩm mới : X800 và Xenium X-Connect. Trong khi X800 là thiết bị với thiết kế chỉ độc nhất màn hình cảm ứng có kích thước lớn thì Xenium X-Connect lại dựa trên nền tảng Windows Mobile cùng màn hình TFT thậm chí còn khổng lồ hơn.

X800 là sản phẩm đầu tiên của Philips hoạt động hoàn toàn dựa vào các thao tác điều khiển được thực hiện trên màn hình cảm ứng. Hình ảnh của X800 đã hé lộ từ tuần trước nhưng giờ đây sản phẩm mới chính thức được ra mắt công chúng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Anh, Tiếng Việt<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 101 x 52.4 x 16.3mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 99g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, Touch Screen, 262K màu<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc Chuông 64 âm sắc, MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đến, 30 cuộc gọi đi, 30 cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : MicroSD hỗ trợ lên đến 8G<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 47 MB  128MB Nand flash + 64MB RAM<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : GPRS class 12 , WAP 2.0 , USB 1.1, mail<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có V2.0 với A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/HTML (NetFront 3.4), RSS reader<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có sẵn<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 2 MP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Chơi nhạc đinh dạng : AMR, Midi, MP3, SP-Midi, AAC, WAV, WMA, AAC+, ADPCM <br />
            : Khả năng nhận biết chữ viết tay<br />
            : Tích hợp hệ thống định vị toàn cầu GPS<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Li-ion 1250mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên đến 720h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên đến 10h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Philips_Xenium_X800_1244173773.jpg', CAST(0x00009CB200000000 AS DateTime), 3, 0, 68, 7, 4, N'Philips-Xenium-X800', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (42, N'PHILIPS Xenium 9@9q Phoenix', 1880000.0000, N'Philips Xenium 9@9q Phoenix

Chắc chắn không có nhiều tính năng cao cấp như các dòng điện thoại cao cấp nhưng chú dế mạnh mẽ nổi tiếng này của Philips chắc chắn sẽ làm người dùng phải bất ngờ bởi vẻ đẹp của mình. Chú dế tên Philips Xenium 9@9q này có một thiết kế đẹp mắt, Xenium 9@9q chắc chắn sẽ thu hút sự chú ý của những người dùng không có quá nhiều đòi hỏi về tính năng.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 năm 2008<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Việt<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 99.3 x 46.5 x 18.3 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 86g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, 256K màu <br />
            : 176 x 220 pixels, 2.0 inches<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Phím 04 chiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Đa âm (64 âm sắc), MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : Có nhiều<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có, 30 đi, gọi đến và cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Micro SD, Hỗ trợ thẻ nhớ đến 2GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 10MB bộ nhớ chia sẻ<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Class 10, 236.8 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có, v2.0 với công nghệ A2DP<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email, Instant Messaging<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Phantom Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : 1.3 MP, 1280x1024 pixels, video (QCIF@12.5fps)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.0<br />
            : Nghe nhạc MP3/WAV/AAC/MPEG4 player<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Đồng hồ bấm giây<br />
            : Máy tính cá nhân<br />
            : Quy đổi tiền tệ<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 890 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới  720 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 8 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_PHILIPS_Xenium_9_9q_Dragon_va_Phoenix_1240978719.jpg', CAST(0x00009BD100000000 AS DateTime), 4, 9, 61, 7, 5, N'PHILIPS-Xenium-9@9q-Phoenix', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (43, N'Philips P292', 1150000.0000, N'Philips P292

Với ưu thế nổi bật là nguyên liệu sản xuất ra pin của các ĐTDĐ Philips là xenium đem lại một dung lượng pin cực kỳ tốt và bền. Các máy sử dụng pin xenium có chu kỳ sử dụng pin từ 30 đến 60 ngày, thời gian đàm thoại liên tục 17 giờ liền, gấp nhiều lần so với các hàng khác. Một ưu thế khác là Philips được đầu tư khá kỹ về mặt thiết kế, mỗi model mang một dáng vẻ khác nhau, tạo cho người tiêu dùng sự đa dạng, phong phú về mẫu mã như : Philips 292 mỏng 9 mm, 9@9W màn hình chống trầy hiệu quả, 9@9r phá cách độc đáo.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 07 năm 2007<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Có Tiếng Việt<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 106 x 49 x 9.8 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 80 g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, 256K colors<br />
            : 176 x 220 pixels, 2.0 inches<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Phím xoay 4 chiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Nhạc chuông đa âm sắc, MP3, True Tones<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 250 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : 30 cuộc gọi đi, 30 cuộc gọi nhỡ, 30 cuộc gọi đến<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : microSD (TransFlash)<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Khôngk<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">GPS</td>
          <td> : Không<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, EMS, MMS<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/ xHTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : VGA, 640x480 pixels<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Nghe nhạc MP3/MPEG4 <br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Nghe FM radio<br />
            : Máy tính<br />
            : Đồng hồ báo thức<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 680 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 240 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 3 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_Philips_P292_1240377321.jpg', NULL, 4, 0, 65, 7, 5, N'Philips-P292', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (44, N'PHILIPS Xenium 9@9k Black', 1790000.0000, N'Philips Xenium 9@9k

Được biết đến với thương hiệu nổi tiếng trên toàn thế giới. Nhất thuộc dòng sản phẩm mới Xenium của Philips, sản phẩm 9@9k đem đến cho người sử dụng một chiếc điện thoại với thời gian sử dụng rất cao. Được thiết kế độc đáo cho phép người sử dụng có thể thoải mái liên lạc với người thân và bạn bè mà không phải lo lắng máy sẽ hết pin trong khi đàm thoại với thời lượng chạy pin lên tới gần 2 tháng khi ở chế độ chờ.', N'<table cellspacing="0" cellpadding="0" border="1" >
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top">TỔNG QUAN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Mạng</td>
          <td> : GSM 900 / 1800 / 1900<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ra mắt</td>
          <td> : Tháng 11 năm 2007<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Ngôn ngữ</td>
          <td> : Tiếng Việt<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> KÍCH THƯỚC</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kích thước</td>
          <td> : 104.3 x 42 x 18.7 mm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trọng lượng</td>
          <td> : 108g<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> HIỂN THỊ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Màn hình</td>
          <td> : TFT, 65.536 màu <br />
            : 128 x 160 pixels, 1.8 inches<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bàn phím</td>
          <td> : Phím 04 chiều<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> NHẠC CHUÔNG</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Kiểu chuông</td>
          <td> : Đa âm (64 âm sắc), MP3<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Rung</td>
          <td> : Có<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> BỘ NHỚ</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Lưu trong máy</td>
          <td> : 1000 số<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Lưu trữ cuộc gọi</td>
          <td> : Có, 30 đi, gọi đến và cuộc gọi nhỡ<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Khe cắm thẻ nhớ</td>
          <td> : Micro SD, Hỗ trợ thẻ nhớ đến 2GB<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bộ nhớ trong</td>
          <td> : 2Mb<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> DỮ LIỆU</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">GPRS</td>
          <td> : Class 10 (4+1/3+2 slots), 32 - 48 kbps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">HSCSD</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">EDGE</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">3G</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">WLAN</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Bluetooth</td>
          <td> : Có<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Hồng ngoại</td>
          <td> : Không<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">USB</td>
          <td> : Có, miniUSB<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> ĐẶC ĐIỂM</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Tin nhắn</td>
          <td> : SMS, MMS, Email<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trình duyệt</td>
          <td> : WAP 2.0/xHTML, HTML<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Trò chơi</td>
          <td> : Có, có thể tải thêm<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Colors</td>
          <td> : Majestic Black<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Camera</td>
          <td> : VGA, 640x480 pixels<br />
            : Quay video 128x96@15fps<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Đặc điểm khác</td>
          <td> : Java MIDP 2.0<br />
            : Nghe nhạc MP3/MPEG4 player<br />
            : Nghe FM radio<br />
            : Từ điển T9<br />
            : Lịch làm việc<br />
            : Đồng hồ bấm giây<br />
            : Máy tính cá nhân<br />
            : Quy đổi tiền tệ<br />
            : Loa ngoài<br /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eeeeee" nowrap="nowrap" valign="top"> PIN</td>
    <td bgcolor="#f9f9f9"><table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tbody>
        <tr>
          <td valign="top" width="140">Pin</td>
          <td> : Pin chuẩn, Li-Ion 1790 mAh<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian chờ</td>
          <td> : Lên tới 1440 h<br /></td>
        </tr>
        <tr>
          <td valign="top" width="140">Thời gian đàm thoại</td>
          <td> : Lên tới 7 h</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>', N'medium_PHILIPS_Xenium_9_9k_Black_1242399019.jpg', CAST(0x00009CAB00000000 AS DateTime), 5, 0, 44, 7, 5, N'PHILIPS-Xenium-9@9k-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (45, N'Nokia 2730 classic', 1950000.0000, N'Nokia ra mắt bộ ba di động giá rẻ, kết nối Internet là 2730 Classic, 7020 và 2720 Fold. 
 
Nokia giới thiệu bộ ba điện thoại mới dành cho các thị trường mới nổi với các dịch vụ tiện ích như Nokia Life Tools và Ovi Mail. Nokia 2730 Classic, 2720 Fold và 7020 đều chạy trên nền tảng giao diện S40, dễ dàng sử dụng các tính năng như Internet, e-mail mà không cần đến máy tính. 
 
Nokia cho biết, việc mang những đến thị trường mới nổi các tính năng trên di động mới sẽ giúp người dùng địa phương mở cảnh cửa giải trí, kết nối với bạn bè, gia đình. Ba model mới sẽ hỗ trợ kết nối Internet, công việc cùng các giải pháp trợ giúp khác.', N'<div> <strong>Nokia ra mắt bộ ba di động giá rẻ, kết nối Internet là 2730 Classic, 7020 và 2720 Fold.</strong> <br />
  <br />
  Nokia  giới thiệu bộ ba điện thoại mới dành cho các thị trường mới nổi với các  dịch vụ tiện ích như Nokia Life Tools và Ovi Mail. Nokia 2730 Classic,  2720 Fold và 7020 đều chạy trên nền tảng giao diện S40, dễ dàng sử dụng  các tính năng như Internet, e-mail mà không cần đến máy tính. <br />
  <br />
  Nokia  cho biết, việc mang những đến thị trường mới nổi các tính năng trên di  động mới sẽ giúp người dùng địa phương mở cảnh cửa giải trí, kết nối  với bạn bè, gia đình. Ba model mới sẽ hỗ trợ kết nối Internet, công  việc cùng các giải pháp trợ giúp khác. <br />
  <br />
  <strong>Nokia 2730 Classic</strong> <br />
  <br />
  Trang  bị được chú ý nhất trong chiếc di động giá rẻ này chính là kết nối 3G.  Máy sở hữu kiểu dáng dạng thanh, hỗ trợ hai băng tần UMTS và 4 băng tần  GSM, EDGE. Ngoài ra, 2730 Classic còn có camera 2 Megapixel, đài FM và  kết nối Bluetooth 2.0. <br />
  <br />
  Chiếc di động này cũng sẽ mang các tính  năng giải trí như thẻ nhớ microSD lưu trữ file nhạc, giắc cắm 3,5 mm hỗ  trợ với nhiều headphone hơn. Nokia sẽ cài đặt trước phần mềm Nokia  Maps, thiết bị này có màn hình 2 inch, độ phân giải QVGA.<br />
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; UMTS 900 / 2100</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 9 năm 2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">109.6 x 46.9 x 14.4 mm, 65 cc</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">87.7 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình TFT, 262.144 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.0 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Phím điều khiển 5 chiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">1.000 mục, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">20</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">20</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">20</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 30 MB bộ nhớ trong    <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 2GB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, EMS, MMS, Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 32</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có 4, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen hoặc Xám</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 2 MP, 1600x1200 pixels, quay video    <br />
          - Máy nghe nhạc MP3/MPEG4 player    <br />
          - Nghe đài Radio Stereo FM radio     <br />
          - 3.5 mm audio jack   <br />
          - Lịch tổ chức    <br />
          - Ghi âm    <br />
          - Quay số bằng giọng nói    <br />
          - Flash Lite 2.0    <br />
          - Từ điển Chinese-English-Chinese    <br />
          - Windows Live Messenger (MSN)    <br />
          - Java MIDP 2.0    <br />
          - T9    <br />
          - Trình duyệt WAP 2.0/xHTML    <br />
          - HSCSD    <br />
          - EDGE Class 32    <br />
          - 3G: 384 kbps    <br />
          - Bluetooth v2.0 with A2DP    <br />
          - USB: microUSB v2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion (BL-5C)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 396h(2G)/408h(3G)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 7 h 20 min (2G) / Lên đến 3 h 30 min (3G) / Nghe nhạc 12h</td>
      </tr>
    </tbody>
  </table>
</div>', N'1254569338_2730_classic.jpg', CAST(0x00009E4700000000 AS DateTime), 69, 1, 26, 4, 5, N'Nokia-2730-classic', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (46, N'Nokia 6730 Classic', 4550000.0000, N'Nokia ra mắt 6730 Classic mạnh mẽ GPS

Nokia 6730 Classic có thiết kế dạng thanh, máy chạy giao diện S60 và mạnh mẽ về GPS.

Hôm qua (29/5), Nokia giới thiệu chiếc smartphone mới nhất chạy trên hệ điều hành S60 mang tên 6730 Classic. Máy trang bị các tính năng của điện thoại phân khúc tầm trung.

Trang bị đáng chú ý nhất của Nokia 6730 Classic chính là giao diện S60 phiên bản 3 và tích hợp GPS, hỗ trợ A-GPS. Máy sở hữu camera 3,2 Megapixel, chế độ tự động canh nét. Ngoài ra, đây cũng là chiếc điện thoại với đài FM, kết nối Bluetooth, USB và bộ nhớ trong 48 MB nhưng có thêm khe cắm thẻ nhớ microSD mở rộng.', N'<div> <strong>Nokia ra mắt 6730 Classic mạnh mẽ GPS<br />
  <br />
  </strong>Nokia 6730 Classic có thiết kế dạng thanh, máy chạy giao diện S60 và mạnh mẽ về GPS.<br />
  <br />
  Hôm  qua (29/5), Nokia giới thiệu chiếc smartphone mới nhất chạy trên hệ  điều hành S60 mang tên 6730 Classic. Máy trang bị các tính năng của  điện thoại phân khúc tầm trung.<br />
  <br />
  Trang bị đáng chú ý nhất của  Nokia 6730 Classic chính là giao diện S60 phiên bản 3 và tích hợp GPS,  hỗ trợ A-GPS. Máy sở hữu camera 3,2 Megapixel, chế độ tự động canh nét.  Ngoài ra, đây cũng là chiếc điện thoại với đài FM, kết nối Bluetooth,  USB và bộ nhớ trong 48 MB nhưng có thêm khe cắm thẻ nhớ microSD mở rộng.<br />
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; 3G: HSDPA 2100 / 900</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 7/2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">112 x 46 x 12.6 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">83 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình TFT, 16 triệu màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.2 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Khả năng lưu không giới hạn các mục và fields, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Không giới hạn, lưu tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Không giới hạn, lưu tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Không giới hạn, lưu tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 48 MB bộ nhớ trong   <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 8GB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 32</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Trắng, đen</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 3.15 MP, 2048x1536 pixels, autofocus, quay video, VGA@15fps   <br />
          - Máy ảnh thứ 2 thoại video mạng 3G   <br />
          - Hệ điều hành Symbian OS, S60 rel. 3.2   <br />
          - Nghe đài Radio Stereo FM với RDS   <br />
          - Tích hợp hệ thống định vị toàn cầu GPS, hỗ trợ A-GPS; Nokia Maps   <br />
          - Xem video WMV/RV/MP4/3GP   <br />
          - Máy nghe nhạc MP3/WMA/WAV/RA/AAC/M4A   <br />
          - HSCSD   <br />
          - EDGE: Class 32, 296 / 178.8 kbits   <br />
          - 3G: HSDPA   <br />
          - Bluetooth v2.0 with A2DP   <br />
          - USB v2.0 microUSB   <br />
          - Trình duyệt WAP 2.0/xHTML, HTML   <br />
          - Java, MIDP 2.1    <br />
          - Ghi âm giọng nói   <br />
          - T9</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion 1050 mAh (BL-5CT)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 500 h (2G) / 500 h</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 10 h (2G) / 4 h (3G</td>
      </tr>
    </tbody>
  </table>
</div>', N'1249206230_nokia_6730_w.jpg', CAST(0x00009B6800000000 AS DateTime), 3, 0, 68, 4, 5, N'Nokia-6730-Classic', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (47, N'Nokia 5630 Xpress Music', 4880000.0000, N'Trải nghiệm Nokia 5630 XpressMusic

Điện thoại chơi nhạc Nokia 5630 XpressMusic với nhiều đổi mới về thiết kế, giao diện cùng cấu hình mạnh mẽ. 
 
Thời gian gần đây, dòng XpressMusic của Nokia đã có những bước chuyển mạnh mẽ, thông minh hơn và không chỉ là nghe nhạc. Nếu như 5800 XpressMusic mở đầu cho xu hướng tích hợp hệ điều hành, thì 5630 hay 5730 XpressMusic sau này tuy không có màn hình cảm ứng, nhưng tính năng thì không thua kém N-series của Nokia.', N'<div> <strong>Trải nghiệm Nokia 5630 XpressMusic<br />
  <br />
  </strong>Điện thoại chơi nhạc Nokia 5630 XpressMusic với nhiều đổi mới về thiết kế, giao diện cùng cấu hình mạnh mẽ. <br />
  <br />
  Thời  gian gần đây, dòng XpressMusic của Nokia đã có những bước chuyển mạnh  mẽ, thông minh hơn và không chỉ là nghe nhạc. Nếu như 5800 XpressMusic  mở đầu cho xu hướng tích hợp hệ điều hành, thì 5630 hay 5730  XpressMusic sau này tuy không có màn hình cảm ứng, nhưng tính năng thì  không thua kém N-series của Nokia. <br />
  <br />
  Nokia 5630 XpressMusic với  nhiều trang bị để trở thành một chiếc di động chơi nhạc chuyên dụng.  Máy có âm thanh tốt, phím bấm vào nhanh chương trình chơi nhạc và điều  khiển, giắc cắm 3,5 mm và bộ nhớ lớn. Ngoài ra, máy cũng cho phép người  dùng chơi được nhiều định dạng âm thanh, kể cả các file có chất lượng  cao. <br />
  <br />
  Trong di động mới, Nokia trang bị tính năng &quot;Say nand  Play&quot;, cho phép người dùng đọc tên ca khúc, nghe sỹ và điện thoại sẽ  chơi theo yêu cầu. 5630 XpressMusic tiếp tục được Nokia hỗ trợ khả năng  tương thích với dịch vụ Music Store. Người dùng có thể xem và mua các  bài hát. <br />
  <br />
  Trên màn hình chính, Nokia đã đưa đến nhiều thay đổi  giống với 5800 đi trước. Contacts Bar cho phép vào nhanh 20 người dùng  trong danh bạ với đầy đủ thông tin về cuộc gọi, tin nhắn, e-mail và  chia sẻ ảnh. Phía dưới màn hình, một thanh shortcut cho phép đi tới các  ứng dụng như chơi nhạc, nghe radio, lướt web, chơi game N-gage, xem ảnh  nhanh chóng. <br />
  <br />
  Mặt sau, máy trang bị camera 3,2 Megapixel với  đèn flash, hỗ trợ chụp ảnh, quay phim và chia sẻ các hình ảnh lên mạng  xã hội, trang chia sẻ trực tuyến nhanh chóng. <br />
  <br />
  Nokia 5630 XpressMusic được Nokia thông báo sẽ có mặt tại Việt Nam ngay trong tháng 4 này, hiện chưa có thông tin về giá bán.<br />
  <br />
  <strong>Nokia 5630 - N-series của dòng XpressMusic<br />
  <br />
  </strong>Nokia  mới giới thiệu điện thoại chơi nhạc 5630 XpressMusic, một model chạy hệ  điều hành S60 của N-series hướng mạnh vào các tính năng giải trí chuyên  nghiệp. <br />
  <br />
  Nokia 5630 XpressMusic là điện thoại giải trí, nhấn  mạnh đến khả năng nghe nhạc, xem phim, chơi game và chia sẻ nội dung.  Bộ phụ kiện đi kèm sẽ có thẻ nhớ 4 GB, cho phép lưu trữ đến 3.000 bài  hát. Tuy nhiên, khe cắm sẽ cho phép mở rộng tối đa tới 16 GB, máy cũng  trang bị giắc cắm tai nghe 3,5 mm. <br />
  <br />
  Di động chơi nhạc mới có  thiết kế dạng thanh, mỏng chỉ 12 mm, hỗ trợ kết nối mạng 3G, HSDPA và  HSUPA cho phép download dữ liệu nhanh. Giống như phần lớn điện thoại  chạy S60, máy còn tích hợp Wi-Fi. <br />
  <br />
  Nokia 5630 XpressMusic tương  thích với gian nhạc Nokia Music Store, khách hàng có thể dùng trình  duyệt, download các bài hát, quản lý kho nhạc dễ dàng. <br />
  <br />
  Màn  hình Home trên 5630 XpressMusic được cải tiến, gần giống với 5800  XpressMusic. Thanh Contacts Bar mở 20 danh bạ bạn bè với đầy đủ các tùy  chỉnh. Một thanh bar shortcut khác nằm ở dưới màn hình, cho phép vào  nhanh các ứng dụng giải trí như nghe nhạc, radio, lướt web, chơi game  và xem ảnh. <br />
  <br />
  Model mới trang bị máy ảnh 3,2 Megapixel với đèn  flash, cho phép quay phim, chụp ảnh và kết nối để chia sẻ trực tuyến  với các dịch vụ mạng xã hội như Ovi, Flickr, Facebook.  <br />
  <br />
  Nokia 5630 XpressMusic sẽ xuất hiện tại một số thị trường vào nửa sau năm 2009, mức giá của máy là 199 euro.<br />
  <br />
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; HSDPA 2100 / 900</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 7/2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">112 x 46 x 12 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">83 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình TFT, 16 triệu màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.2 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Phím nghe nhạc trực tiếp</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Khả năng lưu không giới hạn các mục và fields, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Không giới hạn, tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Không giới hạn, tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Không giới hạn, tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 150 MB bộ nhớ chia sẽ      <br />
          - Bộ vi xử lý ARM 11 600 MHz      <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 16GB      <br />
          - Thẻ nhớ 4GB kèm theo hộp máy</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 32</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm </td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đỏ, Xanh, Bạc</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh 3.15 MP, 2048x1536 pixels, autofocus, video, flash; secondary VGA videocall camera      <br />
          - Hệ điều hành Symbian OS, S60 rel. 3.2      <br />
          - Mạng không dây WLAN Wi-Fi 802.11 b/g, UPnP technology       <br />
          - Java MIDP 2.1      <br />
          - Nghe đài Stereo FM radio với RDS      <br />
          - Máy nghe nhạc MP3/MP4/eAAC+/WMA      <br />
          - Ngõ ra Jack cắm audio 3.5 mm      <br />
          - Loa ngoài      <br />
          - Ghi âm giọng nói      <br />
          - T9      <br />
          - Trình duyệt WAP 2.0/xHTML      <br />
          - HSCSD      <br />
          - EDGE Class 32, 296 / 178.8 kbits      <br />
          - 3G: HSDPA, 10.2 Mbps      <br />
          - Bluetooth v2.0 with A2DP      <br />
          - USB v2.0 microUSB </td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion 860 mAh (BL-4CT)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 400 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 7 giờ</td>
      </tr>
    </tbody>
  </table>
</div>', N'1247974530_nokia_5630_xpressmusic.jpg', CAST(0x00009CAE00000000 AS DateTime), 7, 0, 51, 4, 4, N'Nokia-5630-Xpress-Music', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (48, N'Samsung S3653 Corby', 2970000.0000, N'Kết Samsung Corby ngay từ cái nhìn đầu tiên!
Thiết kế độc đáo có ‘102’ của Samsung Corby sẽ hút hồn ngay những ‘nhân’ có cá tính. Màu sắc rực rỡ nổi bật, thiết kế vạt chéo mới lạ như một bộ cánh thời trang, và đặc biệt đến hai vỏ điện thoại cực ‘style’ tặng kèm – Khi thì phá cách với họa tiết hiện đại, lúc thì thật ngầu với vỏ đen huyền bí. Bạn sẽ luôn thu hút đám đông với chiếc Samsung Corby bên mình!', N'<div> <strong>Kết Samsung Corby ngay từ cái nhìn đầu tiên!<br />
  </strong>Thiết  kế độc đáo có ‘102’ của Samsung Corby sẽ hút hồn ngay những ‘nhân’ có  cá tính. Màu sắc rực rỡ nổi bật, thiết kế vạt chéo mới lạ như một bộ  cánh thời trang, và đặc biệt đến hai vỏ điện thoại cực ‘style’ tặng kèm  – Khi thì phá cách với họa tiết hiện đại, lúc thì thật ngầu với vỏ đen  huyền bí. Bạn sẽ luôn thu hút đám đông với chiếc Samsung Corby bên mình!<br />
  <br />
  <strong>Thế giới online sẵn sàng theo chân bạn!<br />
  </strong>Với  Samsung Corby, còn lâu teen nhà mình mới cảm thấy buồn chán những lúc  nhàn rỗi! Có đến 7 widgets mạng xã hội thông dụng luôn sẵn sàng pop-up  trên màn hình để cập nhật thông tin mới nhất! Chỉ với một chạm thôi nhé  - a-lê-hấp - tấm hình ‘hot’ nhất của bạn đã xuất hiện trên Flickr hay  status mới đã được update trên Facebook rồi.<br />
  <br />
  <strong>Từ điển Anh – Anh<br />
  </strong>Từ điển Anh-Anh tiện dụng, có chức năng lưu từ đã tra giúp bạn học từ vựng tốt hơn<br />
  <br />
  <strong>Zoom bằng một chạm<br />
  </strong>Zoom bằng một chạm giúp phóng lớn hình và web gấp 2 lần trong cả trình duyệt Internet và duyệt hình ảnh.<br />
  -------------------------------------<br />
  <br />
  <strong>''Dế'' cảm ứng giá rẻ của Samsung đến VN<br />
  </strong><br />
  Bắt đầu từ tuần này, Samsung đã bán chiếc di động cảm ứng giá rẻ Corby S3653 tại Việt Nam với giá đúng 3 triệu đồng.<br />
  <br />
  Sau  thành công của Star và gần đây là Star kết nối Wi-Fi, Samsung tiếp tục  lấn sâu vào phân khúc di động cảm ứng giá thấp, xu hướng nổi lên trong  hơn nửa năm trở lại đây. Với mức giá 3 triệu đồng, Corby là model rẻ  nhất có màn hình chạm so trong số các điện thoại của thương hiệu lớn  bên cạnh Nokia 5530, LG Cookie...<br />
  <br />
  Ngoài ra, giá bán 3 triệu đồng  của Corby S3650 cũng rẻ hơn nhiều so với mức mà hãng công bố đầu tháng  này, 150 euro (tương đương 4 triệu đồng). Model này có 4 màu cam,  trắng, hồng và vàng. Bộ phụ kiện đi kèm gồm hai nắp lưng sau, cáp USB,  sạc, tai nghe.<br />
  <br />
  Corby sở hữu giao diện cảm ứng TouchWiz như các  dòng phổ thông và cao cấp của Samsung, màn hình 2.8 inch, công nghệ  TFT, độ phân giải QVGA, camera 2 Megapixel, máy có khe cắm thẻ nhớ, kết  nối Bluetooth và thiếu Wi-Fi lẫn 3G. Samsung cũng trang bị một loạt các  tính năng kết nối mạng xã hội từ Facebook, Twitter, MySpace, YouTube,  đến chia sẻ ảnh qua Flickr, Picasa, Photobucket<br />
  <br />
  <strong>''Dế'' cảm ứng giá rẻ của Samsung<br />
  <br />
  </strong>Samsung Corby S3653 hỗ trợ các tính năng kết nối mạng xã hội, máy có màn hình chạm rộng 2,8 inch. <br />
  <br />
  Sau  thành công với Star, Corby là mẫu điện thoại cảm ứng phổ thông tiếp  theo được Samsung công bố chính thức hôm nay. Model mới được hãng nhắm  vào người dùng tuổi teen với vỏ ngoài nhiều màu sắc, giao diện TouchWiz  đẹp. Đây được xem là đối thủ với Nokia 5230, model cùng mức giá và màn  hình chạm. <br />
  <br />
  Ngoài ra, Corby cũng hỗ trợ một loạt các tính năng  kết nối mạng xã hội từ Facebook, Twitter, MySpace, YouTube, đến chia sẻ  ảnh qua Flickr, Picasa, Photobucket. <br />
  <br />
  Samsung cho biết, Corby  cho phép thay đổi màu sắc vỏ sau từ vàng, trắng, da cam, hồng... model  này cũng hỗ trợ giao diện với các hình ảnh hoạt hình ngộ nghĩnh.  <br />
  <br />
  Máy  chạy trên bốn băng tần GSM, camera 2 Megapixel, màn hình QVGA rộng 2,8  inch, công nghệ TFT chứ không phải AMOLED của các dòng cảm ứng cao cấp.  Corby có khe cắm thẻ nhớ microSD, kết nối Bluetooth.<br />
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 9 năm 2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">103 x 56.5 x 12 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">92 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình cảm ứng TFT, 262,144 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.8 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Mở khóa thông minh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">1.000 mục. danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 40 MB bộ nhớ trong      <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lến đến 8 GB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Trắng, Hồng, Vàng, Cam</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh 2.0 MP, 1600x1200 pixels, Zoom Digital 4X, nhận diện nụ cười, quay video QVGA@15fps      <br />
          - Nghe đài radio Stereo FM với RDS        <br />
          - Find Music recognition service      <br />
          - Máy nghe nhạc MP3/WMA/eAAC+       <br />
          - Xem video H.263/H.264/MP4/WMV       <br />
          - Lịch tổ chức       <br />
          - Ghi âm giọng nói       <br />
          - T9       <br />
          - HSCSD       <br />
          - EDGE Class 10, 236.8 kbps       <br />
          - Bluetooth v2.1 with A2DP       <br />
          - Cổng USB v2.0        <br />
          - Trình duyệt WAP 2.0/xHTML, HTML        <br />
          - Java MIDP 2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion 960 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Tối đa 730 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Tối đa 540 phút</td>
      </tr>
    </tbody>
  </table>
</div>', N'1253703444_Samsung_Corby_etc.jpg', CAST(0x00009C5500000000 AS DateTime), 8, 0, 39, 6, 3, N'Samsung-S3653-Corby', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (49, N'Samsung Star WIFI S5233W', 3890000.0000, N'Thiết kế phong cách
Samsung STAR cho bạn cảm nhận tinh tế về thời trang trong vẻ đẹp thanh mảnh hiện đại. Bề mặt màn hình sáng bóng, sắc màu trẻ trung đặc trưng cho cá tính của bạn: trắng sang trọng, hồng dịu dàng, đen lịch lãm.

Touchwiz với ứng dụng thông minh
Samsung STAR giới thiệu các ứng dụng mới nhất trên thanh widget cho bạn tha hồ trải nghiệm những website và các tiện ích khác như: facebook, flickr, yahoo, google, photobucket,... Bạn sẽ dễ dàng truy cập và khám phá thông tin mọi lúc mọi nơi', N'<div>
  <div><strong><em>Đây là phiên bản có WIFI của Samsung Star, vừa có hàng tại QuangMobile từ ngày 20/8/2009 <br />
    - Hàng chính hãng có tặng kèm thẻ nhớ 4GB theo hộp máy!</em><br />
    <br />
    Thiết kế phong cách<br />
    </strong>Samsung  STAR cho bạn cảm nhận tinh tế về thời trang trong vẻ đẹp thanh mảnh  hiện đại. Bề mặt màn hình sáng bóng, sắc màu trẻ trung đặc trưng cho cá  tính của bạn: trắng sang trọng, hồng dịu dàng, đen lịch lãm.<br />
    <br />
    <strong>Touchwiz với ứng dụng thông minh<br />
    </strong>Samsung  STAR giới thiệu các ứng dụng mới nhất trên thanh widget cho bạn tha hồ  trải nghiệm những website và các tiện ích khác như: facebook, flickr,  yahoo, google, photobucket,... Bạn sẽ dễ dàng truy cập và khám phá  thông tin mọi lúc mọi nơi<br />
    <strong><br />
      Giao diện cảm ứng<br />
    </strong>Trải  nghiệm cảm ứng tuyệt vời hơn bao giờ hết với màn hình rộng, rực rỡ sắc  màu. Giao diện TouchWiz độc đáo, danh bạ hình ảnh ba chiều cải tiến  sống động, đặc biệt hỗ trợ bàn phím ảo QWERTY khi xoay ngang điện thoại  cho việc nhắn tin, lướt web thật dễ dàng!<br />
    <br />
    <strong>Camera 3.2MP<br />
    </strong>Chụp hình 3.2MP, nhận diện nụ cười thông minh lưu lại khoảnh khắc hoàn hảo nhất của bạn. </div>
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 8/2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">104 x 53 x 11.9 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">92 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình cảm ứng (có điện trở) TFT, 262.144 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 400 pixels, 3.0 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Accelerometer sensor  <br />
          - Nhận diện chữ viết tay  <br />
          - Gesture lock (khóa máy bằng cử chỉ, ra hiệu)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3, WAV</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Rất nhiều, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 100 MB bộ nhớ trong    <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 8GB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen, Hồng, Bạc, Trắng</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 3.2 MP, 2048x1536 pixels, quay video QVGA@15fps, 4x digital zoom    <br />
          - Chế độ chụp: Smile Shot, Panorama, Continuous Shot, Photo Editing, Slide Show, Motion Control Photo Browser    <br />
          - Mạng không dây WLAN Wi-Fi 802.11 b/g    <br />
          - Nghe đài Stereo FM radio with RDS    <br />
          - Máy nghe nhạc MP3/WMA/AAC    <br />
          - Xem video H.263/H.264/WMV/MPEG4    <br />
          - Công nghệ DNSe (Digital Natural Sound Engine)    <br />
          - Lịch tổ chức    <br />
          - Dịch vụ Shazam Find Music    <br />
          - Trình duyệt WAP 2.0/xHTML, HTML    <br />
          - Java MIDP 2.0    <br />
          - Loa ngoài    <br />
          - EDGE Class 12    <br />
          - Bluetooth v2.1 with A2DP    <br />
          - USB v2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion 1000 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 700 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 10 giờ</td>
      </tr>
    </tbody>
  </table>
</div>', N'1251440869_Picture2.jpg', CAST(0x00009B8400000000 AS DateTime), 0, 0, 13, 6, 2, N'Samsung-Star-WIFI-S5233W', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (50, N'Samsung Star WIFI S5233W Pink', 3890000.0000, N'Thiết kế phong cách
Samsung STAR cho bạn cảm nhận tinh tế về thời trang trong vẻ đẹp thanh mảnh hiện đại. Bề mặt màn hình sáng bóng, sắc màu trẻ trung đặc trưng cho cá tính của bạn: trắng sang trọng, hồng dịu dàng, đen lịch lãm.

Touchwiz với ứng dụng thông minh
Samsung STAR giới thiệu các ứng dụng mới nhất trên thanh widget cho bạn tha hồ trải nghiệm những website và các tiện ích khác như: facebook, flickr, yahoo, google, photobucket,... Bạn sẽ dễ dàng truy cập và khám phá thông tin mọi lúc mọi nơi', N'<div>
  <div><strong><em>Đây là phiên bản có WIFI của Samsung Star, vừa có hàng tại QuangMobile từ ngày 20/8/2009 <br />
    - Hàng chính hãng có tặng kèm thẻ nhớ 4GB theo hộp máy!</em><br />
    <br />
    Thiết kế phong cách<br />
    </strong>Samsung  STAR cho bạn cảm nhận tinh tế về thời trang trong vẻ đẹp thanh mảnh  hiện đại. Bề mặt màn hình sáng bóng, sắc màu trẻ trung đặc trưng cho cá  tính của bạn: trắng sang trọng, hồng dịu dàng, đen lịch lãm.<br />
    <br />
    <strong>Touchwiz với ứng dụng thông minh<br />
    </strong>Samsung  STAR giới thiệu các ứng dụng mới nhất trên thanh widget cho bạn tha hồ  trải nghiệm những website và các tiện ích khác như: facebook, flickr,  yahoo, google, photobucket,... Bạn sẽ dễ dàng truy cập và khám phá  thông tin mọi lúc mọi nơi<br />
    <strong><br />
      Giao diện cảm ứng<br />
    </strong>Trải  nghiệm cảm ứng tuyệt vời hơn bao giờ hết với màn hình rộng, rực rỡ sắc  màu. Giao diện TouchWiz độc đáo, danh bạ hình ảnh ba chiều cải tiến  sống động, đặc biệt hỗ trợ bàn phím ảo QWERTY khi xoay ngang điện thoại  cho việc nhắn tin, lướt web thật dễ dàng!<br />
    <br />
    <strong>Camera 3.2MP<br />
    </strong>Chụp hình 3.2MP, nhận diện nụ cười thông minh lưu lại khoảnh khắc hoàn hảo nhất của bạn. </div>
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 8/2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">104 x 53 x 11.9 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">92 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình cảm ứng (có điện trở) TFT, 262.144 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 400 pixels, 3.0 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Accelerometer sensor  <br />
          - Nhận diện chữ viết tay  <br />
          - Gesture lock (khóa máy bằng cử chỉ, ra hiệu)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3, WAV</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Rất nhiều, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Rất nhiều</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 100 MB bộ nhớ trong    <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 8GB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen, Hồng, Bạc, Trắng</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 3.2 MP, 2048x1536 pixels, quay video QVGA@15fps, 4x digital zoom    <br />
          - Chế độ chụp: Smile Shot, Panorama, Continuous Shot, Photo Editing, Slide Show, Motion Control Photo Browser    <br />
          - Mạng không dây WLAN Wi-Fi 802.11 b/g    <br />
          - Nghe đài Stereo FM radio with RDS    <br />
          - Máy nghe nhạc MP3/WMA/AAC    <br />
          - Xem video H.263/H.264/WMV/MPEG4    <br />
          - Công nghệ DNSe (Digital Natural Sound Engine)    <br />
          - Lịch tổ chức    <br />
          - Dịch vụ Shazam Find Music    <br />
          - Trình duyệt WAP 2.0/xHTML, HTML    <br />
          - Java MIDP 2.0    <br />
          - Loa ngoài    <br />
          - EDGE Class 12    <br />
          - Bluetooth v2.1 with A2DP    <br />
          - USB v2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion 1000 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 700 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 10 giờ</td>
      </tr>
    </tbody>
  </table>
</div>', N'1251544999_350__1_SS00122b.jpg', CAST(0x00009C6500000000 AS DateTime), 1, 0, 20, 6, 2, N'Samsung-Star-WIFI-S5233W-Pink', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (51, N'Philips Xenium X520 Black', 3590000.0000, N'Philips Xenium X520 sản phẩm đầu tiên dùng pin tiểu hoạt động song song với pin theo máy của Philips Xenium X520(Pin tiểu dễ mua, giá rẻ thuận tiện khi sử dụng)

Nổi tiếng đã lâu với mấy sản phẩm pin-trâu “vô đối”, mới đây Philips vừa cho ra mắt thêm một model sành điệu có thể mượn tạm điện từ quả pin AAA phổ biến trên giang hồ. Philips Xenium X520 sử dụng nguồn năng lượng 2-trong-1 sẽ đặc biệt hữu ích cho những lúc teens đi chơi xa, mất điện kéo dài hay chỉ đơn giản là thưởng thức thú khám phá mấy món đồ 2-Tek! độc đáo. Hơn nữa, thay thế pin AAA khá dễ dàng và “hạt dẻ” hơn việc sắm mới nguyên pin chính rất nhiều.', N'<div>
  <div align="justify"><strong>Philips  Xenium X520 sản phẩm đầu tiên dùng pin tiểu hoạt động song song với pin  theo máy của Philips Xenium X520(Pin tiểu dễ mua, giá rẻ thuận tiện khi  sử dụng)</strong><br />
    <br />
    Nổi tiếng đã lâu với mấy sản phẩm pin-trâu “vô  đối”, mới đây Philips vừa cho ra mắt thêm một model sành điệu có thể  mượn tạm điện từ quả pin AAA phổ biến trên giang hồ. Philips Xenium  X520 sử dụng nguồn năng lượng 2-trong-1 sẽ đặc biệt hữu ích cho những  lúc teens đi chơi xa, mất điện kéo dài hay chỉ đơn giản là thưởng thức  thú khám phá mấy món đồ 2-Tek! độc đáo. Hơn nữa, thay thế pin AAA khá  dễ dàng và “hạt dẻ” hơn việc sắm mới nguyên pin chính rất nhiều.</div>
  <div align="justify">
    <p align="justify">Philips Xenium X520 có thiết kế dạng thanh bar đơn  giản cùng các tính năng “phình phường” như màn hình TFT 2 inch hiển thị  262k màu, camera 2 chấm, nghe nhạc giải trí, FM Radio RDS, Bluetooth  A2DP, Wap 2.0, Java MIDP 2.0. Bên cạnh đó, di động cũng hỗ trợ khe cắm  thẻ nhớ mở rộng microSD lên tới 2GB cùng cổng giao tiếp cơ bản miniUSB.</p>
    <p align="justify">Bình thường, Philips Xenium X520 hoạt động trên  nguồn pin Lion 1050 mAh có thời gian stand-by 1 tháng liên tục hoặc 10  giờ thoại. Tuy nhiên, khi pin “chết” (hoặc teens chuyển chế độ) thì pin  AAA sẽ chia sẻ gắng nặng cho pin chính để có thêm 2,5 giờ buôn chuyện  hoặc 1 tuần “đợi chờ” nữa. Điểm hay ho nhất ở model này chính là lúc  các ấy sạc pin thì dế sẽ ưu tiên nạp pin AAA trước rồi mới quay sang  tiếp thêm nguồn sống cho pin chính. Philips Xenium X520 hiện đã có mặt  tại một số nước châu Á với giá bán khoảng 250 USD.</p>
  </div>
</div>
<div>
  <table cellpadding="3" width="99%">
    <tbody>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Hãng sản xuất :</p></td>
        <td valign="top"><p align="left">Philips</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Mạng :</p></td>
        <td valign="top"><p align="left">• GSM900<br />
          • GSM850<br />
          • GSM1800<br />
          • GSM1900<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Kiểu dáng :</p></td>
        <td valign="top"><p align="left">Kiểu thẳng</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Kích thước :</p></td>
        <td valign="top"><p align="left">111 x 45 x 16.6 mm</p></td>
      </tr>
      <tr>
        <td colspan="2" align="middle"><p align="left">Màn hình,nhạc chuông</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Màn hình :</p></td>
        <td valign="top"><p align="left">256K màu-TFT</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Độ phân giải màn hình :</p></td>
        <td valign="top"><p align="left">176 x 220pixels</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Kiểu chuông :</p></td>
        <td valign="top"><p align="left">• Nhạc chuông đa âm sắc<br />
          • MP3<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Rung :</p></td>
        <td valign="top"><p align="left">Có</p></td>
      </tr>
      <tr>
        <td colspan="2" align="middle"><p align="left">Bộ nhớ</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Sổ địa chỉ :</p></td>
        <td valign="top"><p align="left">Photocall , unlimited entries and fields</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Nhật ký cuộc gọi :</p></td>
        <td valign="top"><p align="left">30x30x30</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Loại thẻ nhớ tích hợp :</p></td>
        <td valign="top"><p align="left">• MicroSD<br />
          • TransFlash<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Bộ nhớ trong :</p></td>
        <td valign="top"><p align="left">Bộ nhớ chia sẻ</p></td>
      </tr>
      <tr>
        <td colspan="2" align="middle"><p align="left">Dữ liệu</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Tin nhắn :</p></td>
        <td valign="top"><p align="left">• Email<br />
          • EMS<br />
          • MMS<br />
          • SMS<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Đồng bộ hóa giữ liệu :</p></td>
        <td valign="top"><p align="left">• EDGE<br />
          • GPRS<br />
          • HSCSD<br />
          • Bluetooth 2.0 with A2DP<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Kiểu kết nối :</p></td>
        <td valign="top"><p align="left">• Mini USB<br />
        </p></td>
      </tr>
      <tr>
        <td colspan="2" align="middle"><p align="left">Tính năng</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Camera :</p></td>
        <td valign="top"><p align="left">2Megapixel</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Màu :</p></td>
        <td valign="top"><p align="left">• Đen<br />
          • Đỏ<br />
          • Bạc<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Tính năng :</p></td>
        <td valign="top"><p align="left">• Loa thoại rảnh tay tích hợp (Built-in handsfree)<br />
          • Nghe nhạc<br />
          • Cài đặt hình nền, nhạc chuông<br />
          • Lịch nhắc việc<br />
          • Máy tính cá nhân<br />
          • Loa ngoài<br />
          • FM radio<br />
          • Báo thức<br />
          • Đồng hồ<br />
          • Quay Video<br />
          • Tinh năng khác<br />
        </p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Phần mềm :</p></td>
        <td valign="top"><p align="left">• Dịch vụ dữ liệu CSD/GPRS<br />
          • Java MIDP 2.0<br />
          • Trình duyệt WAP<br />
          • HTML<br />
          • Chơi nhạc MP3/AAC...<br />
          • Games<br />
          • WAP 2.0<br />
          • Quay số bằng giọng nói<br />
        </p></td>
      </tr>
      <tr>
        <td colspan="2" align="middle"><p align="left">Pin</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Pin :</p></td>
        <td valign="top"><p align="left">Li-Ion 1050mAh</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Thời gian đàm thoại :</p></td>
        <td valign="top"><p align="left">8 giờ</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Thời gian chờ :</p></td>
        <td valign="top"><p align="left">740 giờ</p></td>
      </tr>
      <tr>
        <td colspan="2" align="middle"><p align="left">Khác</p></td>
      </tr>
      <tr>
        <td align="right" valign="top" width="45%"><p align="left">Tính năng khác :</p></td>
        <td valign="top"><p align="left">- Extra standby/talk time with any AAA battery<br />
          - MP3/WAV/AAC/MPEG4 player<br />
          - Lunar calendar<br />
          - Countdown timer<br />
          - International converter<br />
          - Euro converter</p></td>
      </tr>
    </tbody>
  </table>
</div>', N'1244116331_X520Black_big.jpg', CAST(0x00009CAE00000000 AS DateTime), 2, 0, 91, 7, 4, N'Philips-Xenium-X520-Black', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (52, N'Philips Xenium X600 Sive', 3500000.0000, NULL, N'<table id="table5234" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"></td>
      <td bgcolor="#f7f6f1"><table id="table5235" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td align="middle" height="18" width="110"><p align="left">Băng tần</p></td>
            <td><p>GSM 900 / 1800 / 1900 </p></td>
          </tr>
          <tr>
            <td align="middle" height="18"><p align="left">Ngôn ngữ</p></td>
            <td>Tiếng Việt</td>
          </tr>
          <tr>
            <td align="middle" height="18"><p align="left">Màu sắc</p></td>
            <td>Đen, Bạc</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5236" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Kích cỡ</p></td>
      <td bgcolor="#f7f6f1"><table id="table5237" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td height="18" width="110"><p>Kích thước</p></td>
            <td><p>96.8X52X16.5mm.</p></td>
          </tr>
          <tr>
            <td height="18"><p>Trọng lượng</p></td>
            <td>105 gam</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5238" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Hễn thị</p></td>
      <td bgcolor="#f7f6f1"><table id="table5239" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td height="18" width="110"><p>Lọai màn hình</p></td>
            <td><p>TFT, 262K colors</p></td>
          </tr>
          <tr>
            <td height="18"><p align="left">Kích thước</p></td>
            <td><p>176X220pixels, 2.2 inches, màn hình ngoài 1.1 inchs<br />
            </p></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5240" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Kiểu chuông</p></td>
      <td bgcolor="#f7f6f1"><table id="table5241" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td align="right" height="18" width="106"><p align="left">Lọai</p></td>
            <td><p>Mp3</p></td>
          </tr>
          <tr>
            <td align="right" height="18" width="106"><p align="left">Tải nhạc</p></td>
            <td>Có</td>
          </tr>
          <tr>
            <td align="right" height="18" width="106"><p align="left">Rung</p></td>
            <td>Có</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5242" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Bộ nhớ</p></td>
      <td bgcolor="#f7f6f1"><table id="table5243" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td height="18" width="110"><p>Danh bạ</p></td>
            <td><p>1000 số</p></td>
          </tr>
          <tr>
            <td height="18"><p>Bộ nhớ trong</p></td>
            <td><p>10MB</p></td>
          </tr>
          <tr>
            <td height="18"><p>Thẻ nhớ</p></td>
            <td>Có</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5244" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Kết nối</p></td>
      <td bgcolor="#f7f6f1"><table id="table5245" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td height="18" width="110"><p>GPRS</p></td>
            <td><p>GPRS class 12 , WAP 2.0 , USB 1.1, mail</p></td>
          </tr>
          <tr>
            <td height="18"><p>HSCSD</p></td>
            <td>Không</td>
          </tr>
          <tr>
            <td height="18"><p>EDGE</p></td>
            <td>không</td>
          </tr>
          <tr>
            <td height="18"><p>3G</p></td>
            <td>Không</td>
          </tr>
          <tr>
            <td height="18"><p>WLAN</p></td>
            <td>Không</td>
          </tr>
          <tr>
            <td height="18"><p>Bluetooth </p></td>
            <td>Có</td>
          </tr>
          <tr>
            <td height="18"><p>Infrared port</p></td>
            <td>Không</td>
          </tr>
          <tr>
            <td height="18"><p>USB</p></td>
            <td>Có</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5246" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Đặc điểm</p></td>
      <td bgcolor="#f7f6f1"><table id="table5247" cellspacing="0">
        <tbody>
          <tr>
            <td><br /></td>
            <td width="297"><br /></td>
          </tr>
          <tr>
            <td><p>Hỗ trợ</p></td>
            <td width="297">FM radio</td>
          </tr>
          <tr>
            <td><p>Âm thanh</p></td>
            <td width="297">Mp3...</td>
          </tr>
          <tr>
            <td><p>Camera</p></td>
            <td width="297">2MP</td>
          </tr>
          <tr>
            <td><p>Quay phim</p></td>
            <td width="297">Có</td>
          </tr>
          <tr>
            <td><p>Ghi âm</p></td>
            <td width="297">Có</td>
          </tr>
          <tr>
            <td width="110"><p>Loa ngòai</p></td>
            <td width="297">Có</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table id="table5250" border="1" bordercolor="#ffffff" cellpadding="0" width="100%">
  <tbody>
    <tr>
      <td bgcolor="#f1f0e5" width="80"><p align="center">Pin</p></td>
      <td bgcolor="#f7f6f1"><table id="table5251" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td align="middle" height="18" width="110"><br /></td>
            <td><br /></td>
          </tr>
          <tr>
            <td align="middle" height="18"><p align="left">Thời gian chờ</p></td>
            <td><p> Lên Đến 720 giờ<br />
            </p></td>
          </tr>
          <tr>
            <td align="middle" height="18"><p align="left">Thời gian đàm thọai</p></td>
            <td><p> 8,5 Giờ</p></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>', N'1244114411_Philips_xenium_x600Silver_big.jpg', CAST(0x00009CAE00000000 AS DateTime), 1, 0, 32, 7, 1, N'Philips-Xenium-X600-Sive', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (53, N'HTC Touch Pro2 (T7373)', 12250000.0000, N'HTC Touch Pro 2 
 
Nâng cấp đáng kể nhất là Touch Pro 2 với màn hình cảm ứng lên tới 3,6 inch, lớn hơn cả iPhone 3G, phiên bản đầu tiên cũng chỉ có kích thước chỉ 2,8 inch. Ngoài ra, độ phân giải cũng được nâng lên thành 480 x 800 pixel. 
 
Một điều thú vị là Touch Pro 2 sử dụng hệ thống thanh bar zoom cảm ứng mới nằm dưới màn hình được hãng gọi là công nghệ Straight Talk. Đây là giải pháp giúp người dùng vào nhanh và dễ dàng các tính năng như điện thoại hội nghị, nghe loa ngoài. 
 
Ngoài ra, camera của Touch Pro 2 vẫn là 3,2 Megapixel, hỗ trợ các kết nối HSDPA, Wi-Fi và định vị toàn cầu GPS.', N'<div>
  <div><strong>HTC Touch Pro 2</strong> <br />
    <br />
    Nâng  cấp đáng kể nhất là Touch Pro 2 với màn hình cảm ứng lên tới 3,6 inch,  lớn hơn cả iPhone 3G, phiên bản đầu tiên cũng chỉ có kích thước chỉ 2,8  inch. Ngoài ra, độ phân giải cũng được nâng lên thành 480 x 800 pixel. <br />
    <br />
    Một  điều thú vị là Touch Pro 2 sử dụng hệ thống thanh bar zoom cảm ứng mới  nằm dưới màn hình được hãng gọi là công nghệ Straight Talk. Đây là giải  pháp giúp người dùng vào nhanh và dễ dàng các tính năng như điện thoại  hội nghị, nghe loa ngoài. <br />
    <br />
    Ngoài ra, camera của Touch Pro 2 vẫn là 3,2 Megapixel, hỗ trợ các kết nối HSDPA, Wi-Fi và định vị toàn cầu GPS. <br />
    <br />
    Máy sẽ có mặt vào mùa hè này, chưa có thông tin về giá bán. <br />
    <br />
    <strong>Hay dở với Touch Pro 2<br />
      <br />
    </strong>Mạnh mẽ từ thiết kế màn hình rộng, bàn phím tiện dụng và đầy đủ kết nối, tuy nhiên HTC Touch Pro 2 bị chê là quá lớn. <br />
    <br />
    Từ  Dopod 838Pro và hiện tại là Touch Pro, HTC tiếp tục chứng minh rằng  hãng là nhà sản xuất các PDA phone dành cho doanh nhân hàng đầu với  thiết kế bàn phím trượt. <br />
    <br />
    Thời gian gần đây, kiểu dáng của PDA  ít có thay đổi, các nhà sản xuất chỉ tập trung vào cải tiến và thêm các  trang bị &quot;khủng&quot; hơn. Touch Pro 2 ra mắt tại MWC là một trong những  chiếc PDA phone như vậy. <br />
    <br />
    Có thể xem Touch Pro 2 là sản phẩm  hội tụ nhiều tính năng nhất hiện nay. Máy sở hữu gần như toàn bộ các  kết nối hiện đại từ HSDPA, Wi-Fi, Bluetooth và định vị toàn cầu GPS. <br />
    <br />
    So  với model trước chỉ có màn hình VGA 2,8 inch, Touch Pro 2 đã rộng thêm  tới 3,6 inch, chuẩn độ phân giải WVGA (800 x 480 pixel). Thiết kế này  làm cho Touch Pro 2 có kích thước rộng hơn, màn hình xấp xỉ Touch HD  (3,8 inch) - một chiếc PDA hướng mạnh để giải trí đa phương tiện. <br />
    <br />
    Bàn  phím trượt của Pro 2 được bố trí giống như Touch Pro đi trước với 5  hàng, bao gồm cả các nút bấm chức năng, số nằm riêng rẽ, giống như bàn  phím của máy tính. Một khác biệt so với Touch Pro là phím bấm có khoảng  cách, được đắp nổi hơn. Thiết kế này hỗ trợ người dùng soạn thảo nhanh  hơn và tác động lên các phím dễ dàng. <br />
    <br />
    Không chỉ trượt ra, màn  hình của Touch Pro 2 còn có thể đẩy chếch lên. Đây là thiết kế lặp lại  so với TyTN II, Touch Pro đi trước cũng không vận dụng kiểu dáng này.  Màn hình trượt lên, hướng đến mắt người dùng, dễ nhìn hơn, hỗ trợ xem  phim, soạn thảo văn bản hay sử dụng cuộc gọi video tốt. <br />
    <br />
    Cũng  trong phiên bản thứ hai này, HTC trang bị speakerphone chuyên dụng khá  lớn, nằm ở phía sau, cùng với microphone chống ồn. Máy có phím bấm ngắt  chuông điện thoại. Công nghệ nâng cao chất lượng đàm thoại mới được HTC  gọi là Straight Talk. <br />
    <br />
    Tuy nhiên, sở hữu màn hình lớn, làm cho  kích thước của Pro 2 trở nên cồng kềnh hơn so ông anh đi trước. Hãng  cũng từ bỏ phím điều hướng mà chuyển tất cả lên màn hình cảm ứng. Cắt  bỏ trang bị trên đồng nghĩa với việc khi sử dụng bảng tính, hay duyệt  web muốn chuyển nhanh giữa các ô, kéo trang khó khăn hơn. <br />
    <br />
    Pro  2 dày tới 17,3 mm và nặng 175 gram, kiểu dáng béo tròn. Model này không  dành cho phụ nữ, hay những người ưa thích thiết kế nằm gọn trong lòng  bàn tay, mỏng nhẹ. <br />
    <br />
    Giống như nhiều thiết bị của HTC khác, Pro  2 cũng có một cổng mini-USB để sạc, kết nối máy tính và gắn tai nghe.  Máy không sở hữu giắc cắm tai nghe 3,5 mm như Touch HD. <br />
    <br />
    Tương  tự Diamond 2, Pro 2 là một trong những thiết bị đầu tiên nâng cấp từ  Windows Mobile 6.1 lên 6.5 vào cuối năm nay. Máy sẽ xuất hiện tại châu  Á vào quý III năm nay, giá bán sẽ tùy từng thị trường.</div>
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; 3G: HSDPA 2100</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Quý 2 năm 2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">116 x 59.2 x 17.3 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">175 gam</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình cảm ứng TFT, 65.536 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">480 X 800 pixels, 3.6 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Bàn phím đầy đủ Full QWERTY  <br />
          - TouchFLO 3D finger swipe navigation  <br />
          - Touch-sensitive zoom bar  <br />
          - Accelerometer sensor for auto-rotate  <br />
          - Nhận diện chữ viết tay</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông 40 âm sắc, MP3, WAV</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Tiếng Anh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Khả năng lưu các mục và fields không giới hạn, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Khả năng lưu không giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Khả năng lưu không giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Khả năng lưu không giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 288 MB RAM    <br />
          - 512 MB ROM    <br />
          - Bộ vi xử lý Qualcomm MSM7200A 528 Mhz    <br />
          - Khe cắm thẻ nhớ microSD (TransFlash)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251"><strong></strong></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email, Instant Messaging</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm </td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen / Xám</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 3.15 MP, 2048x1536 pixels, autofocus, video; secondary VGA videocall camera    <br />
          - Hệ điều hành Microsoft Windows Mobile 6.1 Professional    <br />
          - Mạng không dây Wi-Fi 802.11 b/g    <br />
          - Tích hợp hệ thống định vị toàn cầu     <br />
          - Tính năng A-GPS    <br />
          - Bộ phần mềm Pocket Office (Word, Excel, PowerPoint, OneNote, PDF viewer)    <br />
          - Java MIDP 2.0    <br />
          - Ghi âm    <br />
          - Máy nghe nhạc MP3    <br />
          - Ngõ ra TV-out    <br />
          - Loa ngoài (Straight Talk technology)    <br />
          - HSCSD    <br />
          - EDGE: Class 10, 236.8 kbps    <br />
          - 3G: HSDPA, 7.2 Mbps    <br />
          - Bluetooth v2.0 with A2DP    <br />
          - USB, miniUSB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion 1500 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 348 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 6 giờ 59 phút</td>
      </tr>
    </tbody>
  </table>
</div>', N'1244964937_htc_touch_pro2_2.jpg', CAST(0x00009CAE00000000 AS DateTime), 19, 0, 17, 2, 1, N'HTC-Touch-Pro2-(T7373)', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (54, N'HTC S740', 7450000.0000, N'HTC S740 Hàng xịn nguyên bản vừa xuất hiện, mới 100%. Nguyên hộp đầy đủ phụ kiện kèm theo! (01 máy, 01 pin, 01 sạc nhanh, 01 tai nghe, 01 thẻ 1Gb, CD, hộp & sách hướng dẫn...)', N'<div>
  <div><strong><strong>HTC S740  Hàng xịn nguyên bản vừa xuất hiện, mới 100%. Nguyên hộp đầy đủ phụ kiện  kèm theo! (01 máy, 01 pin, 01 sạc nhanh, 01 tai nghe, 01 thẻ  1Gb, CD, hộp &amp; sách hướng dẫn...)</strong><br />
    <br />
    <br />
    Smarphone kim cương HTC S740<br />
    <br />
    </strong>HTC giới thiệu chiếc điện thoại thông minh màn hình cứng S740 với thiết kế giống Touch Diamond nhưng có bàn phím QWERTY. <br />
    <br />
    S740  kế thừa S730 đi trước khi cũng khoe hai bộ bàn phím, mặt ngoài là các  nút bấm số như điện thoại thông thường, còn khi trượt ngang, máy cho  phép người dùng soạn thảo trên bàn phím Qwerty. <br />
    <br />
    Trông S740 khá  dài nhưng lại ngắn về chiều ngang, kích thước của máy là 116,3 x 43,4 x  16,3 mm và nặng tới 140 gram. Toàn bộ vỏ ngoài màu đen bóng, mặt sau  gồ ghề với những lát cắt mô phỏng viên kim cương giống như Touch  Diamond. <br />
    <br />
    S740 chạy trên hệ điều hành Windows Mobile 6.1 dành  cho smartphone. Máy được trang bị một loạt các kết nối mạnh như  3G/HSDPA, Wi-Fi, Bluetooth cùng hệ thống định vị toàn cầu GPS. Ngoài  ra, người dùng có thể chụp ảnh bằng camera có độ phân giải 3,2  Megapixel. <br />
    <br />
    HTC S740 cho phép đàm thoại liên tục từ 5 đến 6  giờ, thời gian chờ là 400 tiếng đồng hồ. Điện thoại mới của HTC sẽ có  mặt trên thị trường vào tháng 9, chưa có thông tin về giá. <br />
  </div>
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; 3G: HSDPA 2100 /900</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 11/2008</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">116.3 x 43.4 x 16.3 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">140 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình TFT, 65.536 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.4 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Auto-sliding full QWERTY keyboard</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Tiếng Anh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Khả năng lưu các mục và fields không giới hạn, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Khả năng lưu không giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Khả năng lưu không giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Khả năng lưu không giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 256 MB RAM  <br />
          - 256 MB ROM  <br />
          - Bộ vi xử lý Qualcomm MSM7225, 528MHz  <br />
          - Khe cắm thẻ nhớ microSD (TransFlash)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email, Instant Messaging</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 3.2 MP, 2048x1536 pixels, video  <br />
          - Hệ điều hành Microsoft Windows Mobile 6.1 Standard  <br />
          - Mạng không dây WLAN Wi-Fi 802.11b/g   <br />
          - Hệ thống định vị toàn cầu với A-GPS  <br />
          - Pocket Office(Word, Excel, Outlook, PDF viewer)  <br />
          - Java MIDP 2.0  <br />
          - Ghi âm giọng nói  <br />
          - Máy nghe nhạc MP3/AAC  <br />
          - Video/audio album  <br />
          - Loa ngoài  <br />
          - Trình duyệt WAP 2.0/xHTML, HTML (PocketIE)  <br />
          - EDGE Class 10, 236.8 kbps   <br />
          - 3G HSDPA, 7.2 Mbps   <br />
          - Bluetooth v2.0 with A2DP  <br />
          - USB v2.0 miniUSB</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Po 1050 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 400 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 6 giờ 20 phút</td>
      </tr>
    </tbody>
  </table>
</div>', N'1245153362_s740_htc.jpg', CAST(0x00009C6000000000 AS DateTime), 1, 0, 15, 2, 5, N'HTC-S740', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (55, N'HTC Shift (Máy tính)', 12650000.0000, N'Điện thoại mang tính năng máy tính (Hay máy tính mang tính năng điện thoại) Đầu tiên xuất hiện tại Việt Nam. Với tính năng đầy đủ của một chiếc điện thoại và một chiếc máy tính hội tụ trên sản phẩm HTC Shift mang lại cho bạn sự tiện dụng trong công vịêc.

# Màn hình: 7-inch
# HDD: 40-gigabyte hard drive
# Bàn Phím: QWERTY
# Hệ điều hành: Microsoft Vista Business OS
# Trình chơi Media: Windows Media Player 11
# Sóng điện thoại: Tri-Band UMTS/HSDPA,Quad-Band GSM/GPRS/EDGE

Kết nối không dây: WiFi and Bluetooth 2.0', N'<div>
  <div align="justify"><strong>Điện  thoại mang tính năng máy tính (Hay máy tính mang tính năng điện thoại)  Đầu tiên xuất hiện tại Việt Nam. Với tính năng đầy đủ của một chiếc  điện thoại và một chiếc máy tính hội tụ trên sản phẩm HTC Shift mang  lại cho bạn sự tiện dụng trong công vịêc.<br />
    <br />
  </strong></div>
  <div align="justify">
    <li><em><strong>Màn hình: 7-inch </strong></em></li>
  </div>
  <li><em><strong>HDD: 40-gigabyte hard drive </strong></em></li>
  <li><em><strong>Bàn Phím: QWERTY </strong></em></li>
  <li><em><strong>Hệ điều hành: Microsoft Vista Business OS </strong></em></li>
  <li><em><strong>Trình chơi Media: Windows Media Player 11 </strong></em></li>
  <li><em><strong>Sóng điện thoại: Tri-Band UMTS/HSDPA,Quad-Band GSM/GPRS/EDGE </strong></em></li>
  <li>
    <div><em><strong>Kết nối không dây: WiFi and Bluetooth 2.0</strong><br />
    </em></div>
    HTC Shift có thiết kế  đẹp, lớn hơn mọi chiếc di động và có thể xem là một UMPC.<br />
    Shift có kích thước  lớn tương đương với các UMPC đang có trên thị trường. Lớp vỏ của máy, cùng các chi tiết được thiết kế  mượt mà và sáng bóng hơn hẳn Dopod U1000.
    <p align="justify">Máy thiết kế   hình chữ nhật, hình cảm ứng rộng tới 7 inch chiếm phần lớn diện tích  mặt trước và một loạt các phím bắt nằm rìa mép màn hình. Vùng di chuột  điều khiển máy (trackpad) là một ô vuông kích thước  0,5 inch nằm bên phải máy. Tuy nhiên, hệ thống  này khá bé và người dùng  thiếu không gian để di chuyển thoải mái. </p>
    <p align="justify">Nằm ngay bên trên vùng di chuột là hệ thống   các phím bấm tiện lợi. Tại đây, người dùng có thể bật Wi-Fi, Bluetooth,  tùy chỉnh push e-mail bên cạnh việc tăng độ sáng màn hình  và âm thanh. Nằm ngay phía dưới góc phải là hệ thống  bảo mật  nhận dạng vân tay.</p>
    <p align="justify">HTC Shift cho phép chuyển độ phân giải  800 x 480 pixel hoặc 1.024 x 600 pixel dễ dàng thông qua một phím bấm. Ngoài ra, cũng chỉ một lần bấm người dùng  có thể chuyển đổi từ hệ điều hành  Vista sang Windows  Mobile  nhanh chóng. Shift chạy hai hệ điều hành, hỗ trợ đa kết nối, bộ vi xử lý  tương đối mạnh so với một thiết bị di động  đa phương tiện. </p>
    <p align="justify">HTC Shift trang bị ổ cứng  40 GB, dung lượng cho phép người dùng  đủ lưu các tài liệu, bên cạnh phim  và nghe nhạc. Không những thế, máy còn cho phép lắp thêm thẻ nhớ SDHC.</p>
    <p align="justify">HTC Shift hỗ trợ cổng VGA, 3 giắc cắm USB, một đường kết nối mạng LAN   cùng giắc cắm tai nghe 3.5 mm. Với khe cắm SIM, Shift hỗ trợ các kết  nối tốc độ cao của mạng 3G/HSDPA, cho phép người dùng lướt web  tốc độ cao. Với những nơi chưa có điều kiện sử dụng mạng 3G như VN, người dùng  có thể kết nối Wi-Fi và lướt web nhanh.</p>
    <div align="justify">HTC Shift được xách tay về VN  có giá 1.650 USD. Phụ kiện máy gồm: bao da sang trọng, xạc, dây kết nối  máy tính, tai nghe, bút, đĩa cài, sách hướng dẫn.</div>
    <p>Khả  năng đáp ứng của các của hàng điện thoại đi động tại VN thật đáng nể.  Vừa được HTC giới thiệu tại triễn lãm công nghệ không dây CTIA cuối  tháng 3, mà nay đã có thể đặt hàng tại Việt Nam.  HTC Shift đã thực sự gây sốc từ lúc đầu được giới thiệu. Nếu như cách  đâu không lâu bạn sửng sốt về HTC X7500 (T-Mobile Ameo, Dopod U1000)  thì HTC Shift càng làm bạn phải ngỡ ngàng hơn, không chỉ về cái giá của  nó mà còn ví nó vượt quá cái ngưỡng của một chiếc điện thoại di động. <br />
      <br />
      Tôi  gọi điện thoại đến một cửa hàng đăng trên mạng là bán HTC Shift, vừa  nghe tôi nói HTC Shift thì anh trai đầu kên kia nhanh nhẹn nói ngay:  &quot;Hai ngàn rưởi&quot;. Tôi hỏi có hàng ngay không, anh ta nói là phải 3 ngày.  Thực sự ra thì tôi không thể có 2500usd để trang bị cho một cái UMPC  hay một cái điện thoại hoặc là một cái UMPC điện thoại. <br />
      <br />
      So với  cấu hình của các UMPC hiện tại thì thực sự HTC Shift chẳng đến đâu cả,  dùng chíp VIA, Ram 1Gb, HDD 30Gb, Windows Vista...Sony UX, Fujitsu,  Samsung đã bán ra UMPC với ổ cứng Flash và dùng chip Intel. Nếu dùng  HTC Shift để vào mạng bằng sóng di động thì cũng chẳng có gì là lạ,  Sony T cách đây 3 năm đã có khe gắn sim để vào mạng EDGE, và bây giờ  vẫn có.<br />
      <br />
      Không biết HTC Shift đối phó thế nào về khoản pin, khi  nói đến pin của một thiết bị di động thì người VN thường hỏi là máy anh  pin được mấy ngày chứ không hỏi được mấy giờ. Và HTC Shift với ổ cứng  30Gb, Windows Vista với hiệu ứng Aero... toàn những chuyên gia ăn pin  liệu có sống nổi qua 1 ngày?<br />
      <br />
      Tôi biết, rất nhiều người trong  chúng ta khao khát em này, nếu là một UMPC thì tôi cũng khao khát nó  chứ, nhưng chúng ta hãy bình tĩnh và xem xét, nó không đến nối kinh  khủng lắm. <br />
      <br />
      Một số người dùng HTC X7500 mà tôi gặp đã thấm mệt, có lẽ họ sẽ đổi lên HTC Shift chăng? <br />
    </p>
    <div align="justify"></div>
  </li>
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><div><strong>Tổng quan</strong></div></td>
        <td width="115"><div>Mạng</div></td>
        <td width="251"><div>HSDPA / GSM 850 / 900 / 1800 / 1900</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Ra mắt</div></td>
        <td width="251"><div>Quý 3 năm 2007</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><div><strong> Kích thước</strong></div></td>
        <td width="115"><div>Kích thước</div></td>
        <td width="251"><div>190 x 135 x 30 mm</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Trọng lượng</div></td>
        <td width="251"><div>-</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><div><strong> Hiển thị</strong></div></td>
        <td width="115"><div>Loại</div></td>
        <td width="251"><div>Màn hình cảm ứng TFT, 16 triệu màu</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Kích cở</div></td>
        <td width="251"><div>800 x 480 pixels (Wide-VGA), 7 inches</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>  </div></td>
        <td width="251"><div>- Bàn phím đầy đủ QWERTY  <br />
          - Nhận diện chữ viết tay</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><div><strong> Tùy chọn</strong></div></td>
        <td width="115"><div>Kiểu chuông</div></td>
        <td width="251"><div>Nhạc chuông đa âm sắc, MP3</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Rung</div></td>
        <td width="251"><div>Có</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Ngôn ngữ</div></td>
        <td width="251"><div>Tiếng Anh</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>  </div></td>
        <td width="251"><div>- 2 loa stereo</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><div><strong> Bộ nhớ</strong></div></td>
        <td width="115"><div>Lưu trong máy</div></td>
        <td width="251"><div>Rất nhiều trong bộ nhớ chia sẽ</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Các số đã gọi</div></td>
        <td width="251"><div>Rất nhiều</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Cuộc gọi đã nhận</div></td>
        <td width="251"><div>Rất nhiều</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Cuộc gọi nhỡ</div></td>
        <td width="251"><div>Rất nhiều</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>  </div></td>
        <td width="251"><div>- 1 GB bộ nhớ RAM  <br />
          - 30 GB ổ đĩa cứng  <br />
          - Bộ vi xử lý 1.2 GHz VIA CPU  <br />
          - Khe cắm thẻ nhớ miniSD</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Mua thêm thẻ nhớ</div></td>
        <td width="251"><div><strong> </strong> </div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><div><strong>  Đặc điểm</strong></div></td>
        <td width="115"><div>Tin nhắn</div></td>
        <td width="251"><div>SMS, MMS, Email, Instant Messaging</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Đồng hồ</div></td>
        <td width="251"><div>Có</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Báo thức</div></td>
        <td width="251"><div>Có</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Dữ liệu</div></td>
        <td width="251"><div>GPRS</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Hồng ngoại</div></td>
        <td width="251"><div>Không</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Bluetooth</div></td>
        <td width="251"><div>Có</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Trò chơi</div></td>
        <td width="251"><div>Có, Có thể tải thêm</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>Màu</div></td>
        <td width="251"><div>-</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"><div>  </div></td>
        <td width="251"><div>- Máy ảnh số 1.2 MP, videocall camera  <br />
          - Hệ điều hành Microsoft Vista Business  <br />
          - Mạng không dây WLAN Wi-Fi 802.11 b/g   <br />
          - Java MIDP 2.0  <br />
          - Máy ghi âm tích hợp  <br />
          - Phần mềm Windows media player 11  <br />
          - Video/audio album  <br />
          - Chương trình quản lý file  <br />
          - Tích hợp loa ngoài thoại rảnh tay  <br />
          - Lấy dấu điểm chỉ nhận dạng (dấu vân tay)  <br />
          - 3G :HSDPA   <br />
          - Bluetooth: v2.0  <br />
          - USB: miniUSB   <br />
          - Trình duyệt WAP 2.0/xHTML, HTML (PocketIE)</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"><div> Thời gian hoạt động pin</div></td>
        <td width="251"><div>Pin chuẩn, Li-Ion</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"><div> Thời gian chờ</div></td>
        <td width="251"><div>-</div></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"><div> Thời gian đàm thoại</div></td>
        <td width="251"><div>-</div></td>
      </tr>
    </tbody>
  </table>
</div>', N'1244779467_1243076951_HTCShift.jpg', NULL, 0, 0, 30, 2, 3, N'HTC-Shift-(May-tinh)', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (56, N'HTC Touch Cruise 09(T4242)', 7650000.0000, N'HTC Touch Cruise T4242 Hàng xịn nguyên bản vừa xuất hiện, mới 100%. Nguyên hộp đầy đủ phụ kiện kèm theo! (01 máy, 01 pin, 01 sạc nhanh, 01 tai nghe, 01 thẻ 1Gb, 01 sạc ôtô, đế trên ôtô, Cable, CD, hộp & sách hướng dẫn...)

- Điện thoại doanh nhân thời trang
- Camera 3.15 MP, quay phim
- Pocket Office (Word, Excel, PowerPoint, PDF viewer)
- Chức năng định vị GPS
- Wifi tốc độ cao
- Kết nối Bluetooth, 3G', N'<div>
  <div><strong>HTC  Touch Cruise T4242 Hàng xịn nguyên bản vừa xuất hiện, mới 100%. Nguyên  hộp đầy đủ phụ kiện kèm theo! (01 máy, 01 pin, 01 sạc nhanh, 01 tai  nghe, 01 thẻ 1Gb, 01 sạc ôtô, đế trên ôtô, Cable, CD, hộp &amp; sách  hướng dẫn...)</strong><br />
    <br />
    - Điện thoại doanh nhân thời trang<br />
    - Camera 3.15 MP, quay phim<br />
    - Pocket Office (Word, Excel, PowerPoint, PDF viewer)<br />
    - Chức năng định vị GPS<br />
    - Wifi tốc độ cao<br />
    - Kết nối Bluetooth, 3G<br />
  </div>
</div>
<div>
  <div><strong>Chức năng giải trí </strong></div>
  <p>Máy ảnh                                                3.15 MP, 2048x1536 pixels   </p>
  <p>Quay phim                                            Tùy thuộc bộ nhớ   </p>
  <p>Video call <span lang="EN-US" xml:lang="EN-US">                                             </span>Không   </p>
  <p>Xem phim <span lang="EN-US" xml:lang="EN-US">                                            </span>MP4, AVI   </p>
  <p>Nghe nhạc                                            MP3, WAV, WMV   </p>
  <p>FM Radio                                               Không   </p>
  <p>Xem tivi                                                  Không   </p>
  <p>Trò chơi                                                 Cài sẵn trong máy, có thể cài đặt thêm   </p>
  <p>Loa ngoài                                              Có   </p>
  <p>Ghi âm                                                   Tùy thuộc bộ nhớ   </p>
  <div>Ghi âm cuộc gọi <span lang="EN-US" xml:lang="EN-US">                                  </span>Có   </div>
  <p><strong>Phân khúc sản phẩm </strong></p>
  <p>Kiểu dáng                                             Kiểu Cảm ứng </p>
  <p>Phong cách                                            </p>
  <p><strong>Nhạc chuông </strong></p>
  <p>Loại                                                        40 âm sắc MP3, MIDI, WAV   </p>
  <p>Tải nhạc                                                Có   </p>
  <p>Báo rung                                               Có   </p>
  <p><strong>Bộ nhớ, danh bạ, tin nhắn </strong></p>
  <p>Danh bạ điện thoại                             Nhiều   </p>
  <p>Tin nhắn                                                SMS/MMS/Email/Instant Messaging   </p>
  <p>Bộ nhớ trong                                        Không   </p>
  <p>Thẻ nhớ ngoài <span lang="EN-US" xml:lang="EN-US">                                    </span>TransFlash <br />
    - 256 MB RAM<br />
    - 512 MB ROM<br />
    - Qualcomm MSM7225 528 Mhz processor   </p>
  <p><strong>Kết nối dữ liệu, phần mềm </strong></p>
  <p>GPRS                                                     Có   </p>
  <p>Trình duyệt                                            WAP 2.0/xHTML, HTML (PocketIE)   </p>
  <p>HSCSD <span lang="EN-US" xml:lang="EN-US">                                                 </span>Không   </p>
  <p>EDGE <span lang="EN-US" xml:lang="EN-US">                                                    </span>236.8 (kbps)   </p>
  <p>3G <span lang="EN-US" xml:lang="EN-US">                                                          </span>7.2 (Mbps)   </p>
  <p>UMTS                                                     Có   </p>
  <p>WCDMA                                                Có   </p>
  <p>Wifi                                                         Có ,Wi-Fi 802.11 b/g </p>
  <p>GPS                                                        Hỗ trợ A-GPS   </p>
  <p>Hồng ngoại                                           Không   </p>
  <p>Bluetooth <span lang="EN-US" xml:lang="EN-US">                                              </span>Có   </p>
  <p>USB <span lang="EN-US" xml:lang="EN-US">                                                       </span>Mini-USB   </p>
  <p>Java <span lang="EN-US" xml:lang="EN-US">                                                      </span>Không   </p>
  <p>Ứng dụng văn phòng                         Có   </p>
  <p>Băng tần                                                GSM 850/900/1800/1900; HSDPA 900/2100   </p>
  <p>Mạng di động hỗ trợ                           --------   </p>
  <p>Hỗ trợ 2 SIM <span lang="EN-US" xml:lang="EN-US">                                        </span>Không   </p>
  <p><strong>Hiển thị </strong></p>
  <p>Loại màn hình                                      TFT, 65.536 màu   </p>
  <p>Kích thước màn hình                          320 x 480 Pixels   </p>
  <p>Cảm ứng <span lang="EN-US" xml:lang="EN-US">                                              </span>Có <br />
    - Màn hình rộng 2.8 inches<span lang="EN-US" xml:lang="EN-US">                                </span>  </p>
  <p><strong>Pin </strong></p>
  <p>Loại pin <span lang="EN-US" xml:lang="EN-US">                                                                </span>Pin chuẩn Li-lon   </p>
  <p>Thời gian đàm thoại <span lang="EN-US" xml:lang="EN-US">                          </span>6 (giờ)   </p>
  <p>Thời gian chờ <span lang="EN-US" xml:lang="EN-US">                                      </span>400 (giờ)   </p>
  <p><strong>Đặc tính khác </strong><strong><span lang="EN-US" xml:lang="EN-US">              </span></strong></p>
  <p>Kích cỡ máy <span lang="EN-US" xml:lang="EN-US">                                        </span>102 x 53.5 x 14.5 mm   </p>
  <p>Trọng lượng <span lang="EN-US" xml:lang="EN-US">                                        </span>103 (g)   </p>
  <p>Hệ điều hành <span lang="EN-US" xml:lang="EN-US">                                      </span>Microsoft Windows Mobile 6.1 Professional   </p>
  <p>Ngôn ngữ <span lang="EN-US" xml:lang="EN-US">                                             </span></p>
</div>', N'1243753319_HTC.jpg', CAST(0x00009CAE00000000 AS DateTime), 8, 0, 94, 2, 2, N'HTC-Touch-Cruise-09(T4242)', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (57, N'Sony Ericsson Aino', 11290000.0000, N'Aino là chiếc di động giải trí với nhiều tính năng mới lạ. Remote Play ban đầu xuất hiện trên các máy chơi game PlayStation 3 (PS3) và PSP, trên Aino, máy cho phép người dùng điều khiển từ xa, tìm duyệt các nội dung giải trí đa phương tiện trên ổ cứng PS3 thông qua Wi-Fi hoặc 3G. Ngoài ra, với bộ nhớ flash (bộ nhớ máy và thẻ nhớ) trên điện thoại, người dùng cũng có thể đi vào tất cả các file nhạc và video trên PS3 dễ dàng bằng giao diện Xross Media Bar. Sony Ericsson cho biết, firmware cập nhật cho PS3 sẽ thêm tính năng này khi Aino bán ra vào quý IV.', N'<div> <strong>Thế giới nhạc và game trên Aino<br />
  <br />
  </strong>Nhấn mạnh vào các tính năng giải trí, kết nối, Sony Ericsson Aino còn là chiếc di động với thiết kế <br />
  <br />
  Tin  đồn về một chiếc PSP phone xuất hiện khá lâu trên Internet, Aino không  phải là model đó, nhưng sở hữu nhiều tính năng giải trí, chơi game  không thua kém PlayStation Portable của Sony. Theo thông tin từ Sony  Ericsson, sản phẩm này quý IV mới ra mắt. <br />
  <br />
  Aino là chiếc di  động giải trí với nhiều tính năng mới lạ. Remote Play ban đầu xuất hiện  trên các máy chơi game PlayStation 3 (PS3) và PSP, trên Aino, máy cho  phép người dùng điều khiển từ xa, tìm duyệt các nội dung giải trí đa  phương tiện trên ổ cứng PS3 thông qua Wi-Fi hoặc 3G. Ngoài ra, với bộ  nhớ flash (bộ nhớ máy và thẻ nhớ) trên điện thoại, người dùng cũng có  thể đi vào tất cả các file nhạc và video trên PS3 dễ dàng bằng giao  diện Xross Media Bar. Sony Ericsson cho biết, firmware cập nhật cho PS3  sẽ thêm tính năng này khi Aino bán ra vào quý IV. <br />
  <br />
  Aino là một  trong những chiếc di động thuộc dòng Entertainment Unlimited được Sony  Ericsson khai sinh tại MWC tháng 2 năm nay. Nền tảng mới hỗ trợ mạnh mẽ  giải trí đa phương tiện. Bên cạnh Remote Play, máy còn hỗ trợ kết nối  không dây thông qua Media Home - một tính năng cho phép người dùng  truyền tải file từ ứng dụng Media Go trên máy tính tới điện thoại. <br />
  <br />
  Aino  cũng hỗ trợ kết nối DLNA (Digital Living Network Alliance), đóng vai  trò một host và một chiếc máy chơi nhạc. Tức là, người dùng có thể đồng  bộ thiết bị với mạng không dây trong gia đình, chia sẻ các nội dung  giải trí đến TV, dàn âm thanh...  <br />
  <br />
  Trong bản demo mà Sony  Ericsson giới thiệu, Aino còn trang bị chương trình Google Latitude với  bản đồ Google Maps 3.0 cài sẵn, hỗ trợ người dùng tìm kiếm bạn bè trong  khu vực. <br />
  <br />
  Về thiết kế, Aino trông rất thời trang, bề mặt ngoài  mờ xỉn và trông khỏe khoắn khi cầm trên tay. Máy không có phím bấm ở  phía trước, người dùng sẽ ấn tượng khi sử dụng với màn hình cảm ứng.  Tuy nhiên, tính năng màn hình chạm của máy chỉ làm việc trong một số  ứng dụng như tìm kiếm nội dung giải trí, tùy chỉnh camera. <br />
  <br />
  Khi  đóng bàn phím bên dưới lại, bạn có thể dùng màn hình cảm ứng đi vào các  chương trình như chụp ảnh, gallery, chơi nhạc, xem phim, đài FM. Trên  màn hình, các nút bấm đủ lớn để dùng ngón tay điều khiển. <br />
  <br />
  Mặt  sau Aino là máy ảnh 8,1 Megapixel với đèn flash LED, đáng tiếc, máy  không có camera phía trước để đàm thoại video. Một giắc cắm tai nghe  3,5 mm cũng được trang bị, cho phép người dùng thưởng thức nhạc với  nhiều loại headphone khác phổ biến. <br />
  <br />
  Cần Aino trên tay, cảm  giác đầu tiên đây là một thiết kế đẹp, model sáng tạo và kế thừa giữa  hai series Cyber-shot và Walkman. Máy trang bị các kết nối HSDPA,  Wi-Fi, Bluetooth stereo và A-GPS để đìm đường. Màn hình cảm ứng của máy  có độ phân giải 432 x 240 pixel, 16 triệu màu, camera của máy hỗ trợ  quay video nHD.<br />
  <strong>Điện thoại Sony Ericsson Aino kết nối máy PS3<br />
  <br />
  </strong>Chiếc  smartphone của Sony Ericsson tạo ấn tượng ngay từ cái nhìn đầu tiên với  thiết kế lạ, màn hình 3 inch, camera 8,1 megapixel và cũng là điện  thoại đầu tiên kết nối trực tiếp tới máy chơi game PlayStation 3. <br />
  <br />
  Với  tính năng Remote Play, Aino cho phép truy cập đến PS3 qua Internet bất  cứ khi nào người sử dụng muốn chơi game. Họ cũng có thể dùng tính năng  PlayTV trên PS3 để xem các kênh truyền hình miễn phí.  <br />
  <br />
  Aino có bộ nhớ 55 MB và sẽ được xuất xưởng trong quý IV/2009 kèm thẻ nhớ 8 GB (có thể mở rộng lên 16 GB)<br />
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; HSDPA 850 / 900 / 2100</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 10/2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">104 x 50 x 15.5 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">134 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình cảm ứng điện dung TFT, 16 triệu màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 432 pixels, 3.0 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Accelerometer sensor for auto-rotate  <br />
          - Màn hình cảm ứng với những tính năng giải trí giới hạn</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3, AAC</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">1.000 mục x 20 fields, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 55 MB bộ nhớ trong     <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 16GB     <br />
          - Thẻ nhớ 8GB kèm theo hộp máy</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS (threaded view), MMS, Email, IM</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, motion-based, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen, Trắng</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 8.1 MP, 3264x2448 pixels, autofocus, LED flash     <br />
          - Touch focus, geo-tagging, face detection, image stabilizer, smart contrast, red-eye reduction, videocalling     <br />
          - Quay video, QVGA@30fps     <br />
          - Remote play for Playstation 3        <br />
          - Mạng không dây Wi-Fi 802.11 b/g, DLNA     <br />
          - Máy nghe nhạc MP3/AAC/MPEG4     <br />
          - Nghe đài Radio Stereo FM với RDS     <br />
          - Tích hợp hệ thống định vị toàn cầu GPS, hỗ trợ A-GPS; Wayfinder Navigator     <br />
          - Google Maps     <br />
          - Sửa hình /blogging     <br />
          - Các ứng dụng YouTube &amp; Facebook applications     <br />
          - Lịch tổ chức     <br />
          - Ghi âm giọng nói     <br />
          - Shake control         <br />
          - SensMe     <br />
          - T9     <br />
          - HSCSD     <br />
          - EDGE Class 10, 236.8 kbps     <br />
          - 3G: HSDPA, 7.2 Mbps; HSUPA, 2 Mbps  <br />
          - Bluetooth v2.0 with A2DP     <br />
          - USB v2.0     <br />
          - Trình duyệt WAP 2.0/HTML (NetFront), RSS reader     <br />
          - Java, MIDP 2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Po 1000 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 380h(G)/367h(3G)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 13 h (2G) / Lên đến 4 h 30 min (3G) / Nghe nhạc 31 giờ</td>
      </tr>
    </tbody>
  </table>
</div>', N'1256470115_Aino.jpg', CAST(0x00009C3B00000000 AS DateTime), 27, 0, 74, 5, 5, N'Sony-Ericsson-Aino', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (58, N'Sony Ericsson Satio', 14350000.0000, N'Ấn tượng khả năng chụp hình từ camera 12 Megapixel và giải trí mạnh mẽ, nhưng bản dùng thử của Sony Ericsson Satio có màn hình cảm ứng đơn giản.

Một vài phiên bản dùng thử đã xuất hiện ở Việt Nam dưới dáng máy test. Ấn tượng đầu tiên khi cầm Satio trên tay là máy có kích thước hơi lớn, màn hình cảm ứng rộng 3,5 inch với hình ảnh hiển thị thấp dưới màn gương chứ không nổi, đẹp bằng Xperia X2.

Dưới màn hình, 2 phím bấm gọi điện/ngắt cuộc gọi bố trí hai bên, ở giữa là phím gọi Menu đồng thời bấm trở lại các tính năng. Các nút bấm này được bố trí cao theo hình vòng cung.', N'<div> <strong>Dùng thử Sony Ericsson Satio<br />
  <br />
  </strong>Ấn  tượng khả năng chụp hình từ camera 12 Megapixel và giải trí mạnh mẽ,  nhưng bản dùng thử của Sony Ericsson Satio có màn hình cảm ứng đơn giản.<br />
  <br />
  Một  vài phiên bản dùng thử đã xuất hiện ở Việt Nam dưới dáng máy test. Ấn  tượng đầu tiên khi cầm Satio trên tay là máy có kích thước hơi lớn, màn  hình cảm ứng rộng 3,5 inch với hình ảnh hiển thị thấp dưới màn gương  chứ không nổi, đẹp bằng Xperia X2.<br />
  <br />
  Dưới màn hình, 2 phím bấm gọi  điện/ngắt cuộc gọi bố trí hai bên, ở giữa là phím gọi Menu đồng thời  bấm trở lại các tính năng. Các nút bấm này được bố trí cao theo hình  vòng cung.<br />
  <br />
  Cạnh phải Satio là phím tăng giảm âm tượng, đồng thời  có thể zoom khi chụp ảnh, nút gọi các chương trình giải trí đa phương  tiện, chuyển chế độ quay phim/chụp ảnh và nút bấm khởi động camera chụp  ảnh khá lớn.<br />
  <br />
  Cạnh trái máy là phím khóa màn hình, giắc cắm đặc  trưng của Sony Ericsson và khe cắm thẻ nhớ microSD được đậy nắp. Nút  nguồn được bố trí bên trên, trong khi phía dưới là lỗ treo dây đeo.<br />
  <br />
  Phía  sau, camera 12 Megapixel được bảo vệ nắp đậy lớn, khi đẩy ra máy ảnh sẽ  khởi động. Phía dưới là ống kính f=5,9mm, 1:2.8 cùng đèn LED và đèn  flash Xenon.<br />
  <br />
  Satio là chiếc smartphone giải trí, do đó giao diện  của máy gần như hỗ trợ rất tốt chức năng này. Các icon đẹp, nhưng thua  về độ long lanh so với Xperia X2 hay các smartphone có màn hình AMOLED  của Samsung.<br />
  <br />
  Máy trang bị công nghệ cảm ứng điện trở, người dùng  có thể tác dụng bằng bút, ngón tay. Trong firmware của phiên bản dùng  thử, chỉ một số ứng dụng được phép vuốt trượt như lướt web, xem bản đồ  Google Maps, trong khi Menu hay các tính năng khác, phải dùng thanh  cuộn bên phải khá bất tiện.<br />
  <br />
  So về khả năng thực thi cảm ứng,  Satio thua phiên bản Xperia X2, chưa thể bằng iPhone, di động Android  của HTC. Những khác biệt này có thể dễ nhận ra bởi máy dùng công nghệ  điện trở, ngoài ra, trong bản chính thức khi bán ra thị trường, Sony  Ericsson sẽ mang tới bản firmware khác với nhiều nâng cấp hứa hẹn tốt  hơn.<br />
  <br />
  Chạy Symbian S60 5th edition, máy có thể cài đặt các ứng  dụng thứ ba, phần mềm này giống với Nokia N97, 5800 XpressMusic hay  Omnia HD. Có thể thấy, Satio tương tự về cảm ứng của N97, thua độ rực  rỡ với Omnia HD, giao diệp mang dấu ấn Sony Ericsson.<br />
  <br />
  Ở màn hình  chính, phía dưới là 4 biểu tượng đi vào các ứng dụng: gọi điện, giải  trí, tin nhắn và tìm kiếm. Phía trên là 5 logo, cho phép đi vào các ứng  dụng : Danh bạ yêu thích, Internet/mạng xã hội (Picasa, Facebook,  YouYube, MySpace...), Màn hình chính, xem ảnh trực tiếp bằng cách kéo  lên và cuối cùng là các cài đặt (cấu hình, Wi-Fi, Blueototh, ghi chú,  radio...).<br />
  <br />
  Khi bấm vào phím trung tâm, menu chính hiện ra với  các icon đặc trưng Sony Ericsson. Menu không cho phép dùng ngón tay  vuốt lên, phải tác dụng lực vào thanh cuộn bên cạnh.<br />
  <br />
  Satio hỗ  trợ đầy đủ các kết nối, khả năng lướt web, xem video trực tuyến qua  Wi-Fi rất mượt mà. Ngoài ra, người dùng có thể đi vào các ứng dụng mạng  xã hội với giao diện phần mềm S60.<br />
  <br />
  Đặc biệt, máy chụp ảnh đẹp,  những lo lắng về việc Satio lưu các bức ảnh dung lượng cao mất thời  gian gần như không có. Các file ảnh được load nhanh. Tuy nhiên, bản  dùng thử chụp hơi chậm về khả năng lấy nét.<br />
  <br />
  Âm thanh từ loa  ngoài trung bình, tiếng trong và chi tiết khi thưởng thức trên tai  nghe. Để xem phim, nền chuyển mã các file video theo đúng định dạng,  nếu không hình ảnh hiển thị bị vỡ, xấu.<br />
  <br />
  Máy hỗ trợ bàn phím ảo,  khi soạn thảo, các nút bấm QWERTY hoặc số hiện ra (tùy trạng thái ngang  dọc), tuy nhiên giao diện hủy bỏ, thay vào đó là các ký tự được viết.  Sau khi soạn thảo, bấm ok thì trở lại giao diện/chức năng ban đầu.<br />
  <br />
  <strong>Sony Ericsson Idou đổi tên thành Satio<br />
  <br />
  </strong>Cùng  với bộ đôi điện thoại chơi game, hôm qua Sony Ericsson đổi tên di động  12 Megapixel thành Satio và sẽ đưa ra thị trường vào tháng 10 tới.<br />
  <br />
  Ngoài  ra, Sony Ericsson cũng thêm phiên bản màu đỏ Bordeaux thời trang hơn  bên cạnh các màu đen và bạc đã xuất hiện từ trước. Đây là chiếc di động  12 Megapixel đầu tiên trên thế giới, máy có đèn flash Xenon và lấy nét  bằng tay trên màn hình cảm ứng.<br />
  <br />
  Sony Ericsson Satio là một trong  những điện thoại chạy Symbian S60 phiên bản 5 mới bên cạnh Nokia N97,  Samsung Omnia HD sắp có mặt trên thị trường. Máy sở hữu màn hình cảm  ứng 3,5 inch, độ phân giải lên tới 360 x 640 pixel. <br />
  <br />
  Máy hỗ trợ các kết nối 3G/HSDPA, Wi-Fi, GPS, hỗ trợ nhiều ứng dụng giải trí, kết nối mạng xã hội. <br />
  <br />
  <strong>Sony Ericsson trình làng ''dế'' 12 Megapixel<br />
  <br />
  </strong>Sony  Erisson đã mở đầu cho cuộc đua điện thoại có camera 12 Megapixel tại  triển lãm điện thoại di động toàn cầu MWC 2009 với model mang tên Idou.  Bên cạnh đó hãng còn ra mắt chiếc Walkman 8 &quot;chấm&quot; màn hình cảm ứng. <br />
  <br />
  Sony  Ericsson vừa giới thiệu chiếc di động được xem là &quot;con yêu quái&quot; trên  lĩnh vực giải trí - Idou. Bên cạnh một model khác được đồn đại từ trước  mang tên W955 hay còn gọi là Hikaru. <br />
  <br />
  <strong>Sony Ericsson Idou</strong> <br />
  <br />
  Idou  là chiếc điện thoại 12 Megapixel đầu tiên trên thế giới. Model sở hữu  đèn flash Xenon, xác định điểm lấy nét bằng ngón tay, ống kính của máy  nằm ẩn dưới nắp trượt. <br />
  <br />
  Bên cạnh đó, Idou của Sony Ericsson còn  là model chạy theo xu hướng màn hình cảm ứng rộng hiện nay, với kích  thước màn hình 3,5 inch, 16 triệu màu. Tỷ lệ 16:9 (360 x 640 pixel),  nhấn mạnh khả năng giải trí đa phương tiện mạnh mẽ. Ngoài ra, Idou còn  tích hợp kết nối 3G và Wi-Fi. <br />
  <br />
  &quot;Cỗ máy giải trí&quot; 12 Megapixel  của Sony Ericsson sử dụng hệ điều hành Symbian S60 với giao diện mới.  Đây là nền tảng đầu tiên được phải triển trên liên minh nguồn mở mang  tên Symbian Foundation. <br />
  <br />
  Máy sở hữu các tính năng giải trí như xem video YouTube, chơi video phân giải cao HD. <br />
  <br />
  Ngoài  ra, liên mình Nhật Bản - Thụy Điển cũng tích hợp GPS cho Idou, người  dùng có thể sử dụng các phần mềm bản đồ, hiển thị rõ ràng trên màn hình  rộng. </div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; 3G: HSDPA 900 / 2100</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Sáng thứ Hai</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">112 x 55 x 13.3 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">126 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình cảm ứng TFT, 16 triệu màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">360 x 640 pixels, 3.5 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Accelerometer sensor</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3, AAC</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">Khả năng lưu các mục và fields không giới hạn, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">Lưu không giới hạn, tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">Lưu không giới hạn, tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">Lưu không giới hạn, tối đa 30 ngày</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 128 MB bộ nhớ trong        <br />
          - Khe cắm thẻ nhớ microSD (TransFlash), hỗ trợ lên đến 32GB        <br />
          - Thẻ nhớ 8GB kèm theo máy</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS, MMS, Email, IM</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm </td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen, Bạc, Đỏ Bordeaux</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh số 12 MP, 4000 x 3000 pixels, autofocus, xenon flash, quay video LED flash, VGA@30fps    <br />
          - Máy ảnh thứ 2 VGA, thoại video mạng 3G    <br />
          - Touch focus, geo-taggingg, nhận diện gương mặt và nụ cười    <br />
          - Hệ điều hành Symbian Series 60, 5th edition    <br />
          - Mạng không dây Wi-Fi 802.11 b/g, DLNA    <br />
          - Bộ vi xử lý ARM Cortex A8 600 MHz, PowerVR SGX graphics    <br />
          - Tích hợp hệ thống định vị toàn cầu (Built-in GPS), hỗ trợ A-GPS    <br />
          - Nghe đài FM radio với RDS    <br />
          - Máy nghe nhạc MP3/WMA/WAV/RA/AAC/M4A    <br />
          - Xem video WMV/RV/MP4/3GP    <br />
          - Google maps    <br />
          - Lịch tổ chức    <br />
          - Gesture control    <br />
          - Loa ngoài    <br />
          - Ghi âm giọng nói    <br />
          - Quay số bằng giọng nói    <br />
          - Java MIDP 2.0    <br />
          - Trình duyệt WAP 2.0/HTML, RSS reader    <br />
          - HSCSD    <br />
          - EDGE: Class 10, 236.8 kbps    <br />
          - 3G: HSDPA, 7.2 Mbps; HSUPA, 3.6 Mbps    <br />
          - Bluetooth v2.0 with A2DP    <br />
          - USB v2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Po 1000 mAh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 360h(2G)/340h(3G)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 11 h (2G) / 4 h 50 min (3G)</td>
      </tr>
    </tbody>
  </table>
</div>', N'1256469835_Idou.jpg', CAST(0x00009CAE00000000 AS DateTime), 3, 0, 23, 5, 4, N'Sony-Ericsson-Satio', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (59, N'Sony Ericsson T707', 4090000.0000, N'Sony Ericsson T707 sở hữu thiết kế siêu “nuột” gồm ba màu thời trang bắt mắt, body hấp dẫn cùng khả năng giải trí ngon nghẻ phết. Màn hình phía ngoài rực rỡ ánh sáng mỗi khi thấy tin nhắn hay cuộc gọi đến, teen sẽ dễ dàng “nhận dạng” chú dế cả trong đêm tối. Đặc biệt, chức năng kiểm soát bằng cử chỉ cũng được tích hợp, cho phép các ấy tắt âm cuộc gọi và chuông báo thức chỉ bằng cách lướt nhẹ tay trên màn hình ngoài điện thoại.

Theo như nhà hãng “quảng cáo”, Elle chỉ nặng 95 gram với số đo ba vòng 93 x 50 x 14,1 mm nên cầm vừa tay lắm í. Không chỉ hoạt động trên bốn băng tần mạng GSM phổ biến, Sony Ericsson T707 có cả kết nối Bluetooth hỗ trợ kết nối tai nghe không dây A2DP và mạng tốc độ cao HSDPA  nữa cơ. Theo lịch, Sony Ericsson T707 sẽ được ra mắt trong tháng 5/2009 nhưng hiện vẫn chưa có giá bán chính thức về mẫu dế nắp gập bình dân này.', N'<div>
  <div align="justify">Cách đây ít hôm, Sony Ericsson đã bắt đầu rục rịch phao tin xung quanh chú dế giải trí nắp gập mới nhất của mình có tên T707 Elle. Trái với những thông tin do giới chuyên môn dự đoán, Sony Ericsson T707 Elle  không phải “chị em” với W508 ra mắt cách đây ba tháng, tuy nhiên tính  năng lại hoàn toàn tương tự. Model điện thoại tầm trung trưng diện màn  hình QVGA 2.2 inch, màn hình ngoài nhỏ hơn (1.1 inch), trang bị camera  3.2 MP autofocus, zoom số 3x những thiếu mất đèn flash trợ sáng.</div>
  <div align="justify"></div>
  <div align="justify"> </div>
  <div align="justify"></div>
  <div align="justify"></div>
  <div align="justify">Sony Ericsson T707  sở hữu thiết kế siêu “nuột” gồm ba màu thời trang bắt mắt, body hấp dẫn  cùng khả năng giải trí ngon nghẻ phết. Màn hình phía ngoài rực rỡ ánh  sáng mỗi khi thấy tin nhắn hay cuộc gọi đến, teen sẽ dễ dàng “nhận  dạng” chú dế cả trong đêm tối. Đặc biệt, chức năng kiểm soát bằng cử  chỉ cũng được tích hợp, cho phép các ấy tắt âm cuộc gọi và chuông báo  thức chỉ bằng cách lướt nhẹ tay trên màn hình ngoài điện thoại.</div>
  <div align="justify">Theo như nhà hãng “quảng cáo”, Elle  chỉ nặng 95 gram với số đo ba vòng 93 x 50 x 14,1 mm nên cầm vừa tay  lắm í. Không chỉ hoạt động trên bốn băng tần mạng GSM phổ biến, Sony Ericsson T707 có cả kết nối Bluetooth hỗ trợ kết nối tai nghe không dây A2DP và mạng tốc độ cao HSDPA  nữa cơ. Theo lịch, Sony Ericsson T707 sẽ được ra mắt trong tháng 5/2009 nhưng hiện vẫn chưa có giá bán chính thức về mẫu dế nắp gập bình dân này.<br />
  </div>
  <div align="justify"></div>
  <div align="justify"></div>
  <div align="justify"></div>
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; HSDPA 2100</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Quý 2 năm 2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">93 x 50 x 14.1 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">95 gam</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình TFT, 262.144 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.2 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Màn hình ngoài mono, 36 x 128 pixels, 1.1&quot;  <br />
          - Mặt kính chống trầy  <br />
          - Điều khiển theo cử chỉ, điệu bộ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3, AAC</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">2.000 mục, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 100 MB bộ nhớ trong   <br />
          - Khe cắm thẻ nhớ Memory Stick Micro (M2), hỗ trợ lên đến 16 GB / microSD</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS (threaded view), MMS, Email, Push Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Đen, hồng, xanh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 3.15 MP, 2048x1536 pixels, đèn LED, Geo-tagging (cell-ID), quay video, video light   <br />
          - Stereo FM radio with RDS   <br />
          - Máy nghe nhạc MP3/eAAC+/WMA/WMApro   <br />
          - Xem video MPEG4/WMV/H.263   <br />
          - Nhận diện TrackID   <br />
          - T9   <br />
          - Lịch tổ chức   <br />
          - Ghi âm giọng nói   <br />
          - Java MIDP 2.0   <br />
          - Trình duyệt WAP 2.0/HTML (NetFront)   <br />
          - HSCSD   <br />
          - EDGE Class 10, 236.8 kbps   <br />
          - 3G: HSDPA   <br />
          - Bluetooth v2.0 with A2DP   <br />
          - USB v2.0</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Ion</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 400 giờ</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 10 h (2G) / Lên đến 4 h (3G)</td>
      </tr>
    </tbody>
  </table>
</div>', N'1238648220_T707.jpg', CAST(0x00009CAE00000000 AS DateTime), 2, 1, 84, 5, 3, N'Sony-Ericsson-T707', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (60, N'Sony Ericsson T715', 4650000.0000, N'Sony Ericsson T715 là chiếc di động ấn tượng bởi thiết kế bề ngoài. Mặt sau của máy được làm từ lớp vỏ nhôm, chải bóng. Model này có các màu như bạc, hồng. Máy có kích thước nhỏ gọn, 91,5 x 48,0 x 14,9 mm và nặng chỉ 96 gram, dáng trượt.  
 
T715 được trang bị camera 3,15 Megapixel với tính năng Cell-ID geotagging, đèn flash LED. Có tính năng quay video, tuy nhiên độ phân giải lại không cao. 
 
Mặt trước của máy, màn hình 2,2 inch khá lớn, độ phân giải QVGA, hỗ trợ hiển thị tốt dưới ánh sáng mặt trời. T715 trang bị các tính năng chơi nhạc như TrackID, PlayNow và Bluetooth 2.0 với A2DP, nghe đài FM với RDS.', N'<div> <strong>Sony Ericsson T715 thời trang<br />
  <br />
  </strong>Hôm  qua, Sony Ericsson ra mắt T715, chiếc di động với thiết kế chắc gọn,  dáng trượt thời trang, kết nối 3G và camera 3 Megapixel. <br />
  <br />
  Sony  Ericsson T715 là chiếc di động ấn tượng bởi thiết kế bề ngoài. Mặt sau  của máy được làm từ lớp vỏ nhôm, chải bóng. Model này có các màu như  bạc, hồng. Máy có kích thước nhỏ gọn, 91,5 x 48,0 x 14,9 mm và nặng chỉ  96 gram, dáng trượt.  <br />
  <br />
  T715 được trang bị camera 3,15 Megapixel  với tính năng Cell-ID geotagging, đèn flash LED. Có tính năng quay  video, tuy nhiên độ phân giải lại không cao. <br />
  <br />
  Mặt trước của  máy, màn hình 2,2 inch khá lớn, độ phân giải QVGA, hỗ trợ hiển thị tốt  dưới ánh sáng mặt trời. T715 trang bị các tính năng chơi nhạc như  TrackID, PlayNow và Bluetooth 2.0 với A2DP, nghe đài FM với RDS. <br />
  <br />
  Đây  là chiếc di động hỗ trợ kết nối tốt, với HSPA, T715 cho phép lướt web  thông qua trình duyệt NetFront, xem video trực tuyến trên YouTube thông  qua một chương trình cài đặt sẵn. Ngoài ra, kết nối tốc độ cao còn hỗ  trợ người dùng gọi điện bằng video. <br />
  <br />
  Máy hỗ trợ một vài chương  trình Google như Google Maps, Google Search. Một trong những trang bị  đáng chú ý là được hãng gọi là &quot;smart desktop feature&quot; hỗ trợ nhắc  việc, sinh nhật, các sự kiện trên toàn cầu. <br />
</div>
<div>
  <table border="1" bordercolor="#c0c0c0" cellspacing="1" width="100%">
    <tbody>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong>Tổng quan</strong></td>
        <td width="115">Mạng</td>
        <td width="251">GSM 850 / 900 / 1800 / 1900; HSDPA 2100</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ra mắt</td>
        <td width="251">Tháng 10/2009</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="2" width="80"><strong> Kích thước</strong></td>
        <td width="115">Kích thước</td>
        <td width="251">91.5 x 48 x 14.9 mm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trọng lượng</td>
        <td width="251">96 g</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="3" width="80"><strong> Hiển thị</strong></td>
        <td width="115">Loại</td>
        <td width="251">Màn hình TFT, 262,144 màu</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Kích cở</td>
        <td width="251">240 x 320 pixels, 2.2 inches</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Smart desktop</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="4" width="80"><strong> Tùy chọn</strong></td>
        <td width="115">Kiểu chuông</td>
        <td width="251">Nhạc chuông đa âm sắc, MP3, AAC</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Rung</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Ngôn ngữ</td>
        <td width="251">Có tiếng Việt</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251"></td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="6" width="80"><strong> Bộ nhớ</strong></td>
        <td width="115">Lưu trong máy</td>
        <td width="251">1.000 mục, danh bạ hình ảnh</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Các số đã gọi</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi đã nhận</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Cuộc gọi nhỡ</td>
        <td width="251">30</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- 90 MB bộ nhớ trong       <br />
          - Khe cắm thẻ nhớ microSD (TransFlash)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Mua thêm thẻ nhớ</td>
        <td width="251">&nbsp;</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td rowspan="9" width="80"><strong>  Đặc điểm</strong></td>
        <td width="115">Tin nhắn</td>
        <td width="251">SMS (threaded view), MMS, Email, Push Email</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Đồng hồ</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Báo thức</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Dữ liệu</td>
        <td width="251">GPRS Class 10 (4+1/3+2 slots), 32 - 48 kbps</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Hồng ngoại</td>
        <td width="251">Không</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Bluetooth</td>
        <td width="251">Có</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Trò chơi</td>
        <td width="251">Có sẵn trong máy, có thể tải thêm</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115">Màu</td>
        <td width="251">Bạc, hồng</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td width="115"> </td>
        <td width="251">- Máy ảnh chính 3.15 MP, 2048x1536 pixels, LED flash, Geo-tagging (cell-ID), videocalling, quay video       <br />
          - Máy nghe nhạc MP3/eAAC+/WMA       <br />
          - Xem video MPEG4/WMV/H.263       <br />
          - HSCSD       <br />
          - EDGE Class 10, 236.8 kbps       <br />
          - 3G: HSDPA       <br />
          - Bluetooth, v2.0 with A2DP       <br />
          - USB v2.0       <br />
          - Trình duyệt Browser WAP 2.0/HTML (NetFront)       <br />
          - Nghe đài Radio Stereo FM với RDS        <br />
          - Java, MIDP 2.0        <br />
          - Lịch tổ chức       <br />
          - GHi âm giọng nói       <br />
          - TrackID       <br />
          - YouTube       <br />
          - Google Maps       <br />
          - T9</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian hoạt động pin</td>
        <td width="251">Pin chuẩn, Li-Po 950 mAh (BST-33)</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian chờ</td>
        <td width="251">Lên đến 400 h (2G) / 350 h</td>
      </tr>
      <tr bgcolor="#f8f8f8">
        <td colspan="2" width="196"> Thời gian đàm thoại</td>
        <td width="251">Lên đến 10 h (2G) / 4 h (3G)</td>
      </tr>
    </tbody>
  </table>
</div>', N'1256470738_T715.jpg', CAST(0x00009CAE00000000 AS DateTime), 1, 0, 57, 5, 2, N'Sony-Ericsson-T715', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (68, N'   sdfdf df sd f   df    ', 12.0000, N'   saada s ds  ', N' ád<br />
<b> addasdass</b>   ', N'no_photo.jpg', CAST(0x00009E5E00000000 AS DateTime), 0, 0, 12, NULL, NULL, N'---sdfdf-df-sd-f---df----', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (69, N'qwqweeqwqw', 2122.0000, N'ádasdasdsda', N'sdsdsadasdsda', N'no_photo.jpg', CAST(0x0000A0FD009BE463 AS DateTime), 0, 0, 2, 1, 1, N'qwqweeqwqw', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (70, N'he he he', 12.0000, N'23123321', N'<br />
<div style="color:blue">
áddasđsa<br />
sadasđá
</div>', N'no_photo.jpg', CAST(0x0000A0FD009CF001 AS DateTime), 2, 0, 12, 2, NULL, N'he-he-he', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (72, N'ấd', 2333123.0000, N'asdasda', N'sdsdsdasd', N'no_photo.jpg', CAST(0x0000A0FD009DD523 AS DateTime), 0, 0, 12, 1, NULL, N'ad', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (73, N'ấd', 2333123.0000, N'asdasda', N'sdsdsdasd', N'no_photo.jpg', CAST(0x0000A0FD009E138F AS DateTime), 0, 0, 12, 1, NULL, N'ad', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (74, N'ke ke', 212.0000, N'sdasadasdsadsda   ', N'<div class="left">
        <h1>Asus Google Nexus 7</h1>
        <div class="quick-info">
            <ul>
                <li><span>Giá tiền:</span><span class="price">
                    5,350,000 vnđ
                    
                </span></li>
                <li><i>Giá trên đã bao gồm <b style="color:red;"> 10%</b>  VAT</i></li>
                <li><span>Hãng sản xuất:</span> <a href="/tim-kiem/?MobileBrand=29">Asus</a></li>
                <li>
                    <span>Danh mục:</span>
                    
                    <span><a href="/tim-kiem/?MobileCategory=2">Hàng công ty </a></span>
                    ,
                    <span><a href="/tim-kiem/?MobileCategory=11">Máy tính bảng</a></span>
                    ,
                    <span><a href="/tim-kiem/?MobileCategory=13">Android</a></span>
                    
                </li>
                <li><span>Kho hàng:</span> <a href="/tim-kiem/?MobileInstockID=1">Còn hàng</a></li>
                
                <li><span>Màu có sẵn:</span>
                    
                    <span><a href="/tim-kiem/?MobileColorID=7">Black</a></span>
                    

                </li>

                <li><span>Có bán tại:</span>
                    <ul class="clear">
                        
                            <li>
                                
                                <span><a href="/tim-kiem/?MarketID=4">392 cầu giấy - 0968.32.33.99</a></span>
                            </li>
                        
                            <li>
                                
                                <span><a href="/tim-kiem/?MarketID=1">194 Lê Duẩn - 043.518.6033</a></span>
                            </li>
                        
                            <li>
                                
                                <span><a href="/tim-kiem/?MarketID=3">122 Thái Hà  - 0973.79.0122</a></span>
                            </li>
                        
                            <li>
                                
                                <span><a href="/tim-kiem/?MarketID=2">382 Nguyễn Văn Cừ - 0125.363.2222</a></span>
                            </li>
                        
                    </ul>
                 </li>

                
                <li><span>Bộ bán hàng chuẩn:</span> 
                    
                    <span><a href="/tim-kiem/?DeviceComboID=1">Thân máy</a></span>
                    ,
                    <span><a href="/tim-kiem/?DeviceComboID=2">Pin</a></span>
                    ,
                    <span><a href="/tim-kiem/?DeviceComboID=3">Sạc</a></span>
                    ,
                    <span><a href="/tim-kiem/?DeviceComboID=5">Cáp USB</a></span>
                    ,
                    <span><a href="/tim-kiem/?DeviceComboID=10">Hộp</a></span>
                    ,
                    <span><a href="/tim-kiem/?DeviceComboID=11">Sách hướng dẫn</a></span>
                    
                </li>
                

                <li><span>Bảo hành:</span> Chính hãng 12 tháng.</li>

                
            </ul>
        </div>
		</div>', N'book2.jpg', CAST(0x0000A0FD00000000 AS DateTime), 2, 0, 21, 1, 1, N'ke-ke', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (75, N'quê hương là chùm khế ngọt', 10000.0000, N'ádsđssda', N'<div>			<div class="gift">Mua bất kỳ máy nào tại BachLongMobile bạn nhận được 1 trong các quà tặng sau</div>
             <div class="border2">
           	 <ul>
	<li>
		Tặng 01 miếng dán màn hình trị giá <em><span style="font-size: 14px;"><strong><span style="color: rgb(255, 0, 0);">150.000đ </span></strong></span></em>(Chỉ dành cho ipad 2, iphone 4, iphone 4S)</li>
	<li>
		Tặng 01 miếng dán bảo vệ màn hình cảm ứng trị giá <span style="font-size: 14px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: rgb(255, 0, 0);"><span style="float: none;" class="cam">50.000đ</span></span></strong></span></span> (HTC,Iphone,SamSung,Blackberry,Nokia,SonyErisson)</li>
	<li>
		Giảm <span style="font-size: 14px;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="color: rgb(255, 0, 0);"><strong><span style="float: none;" class="cam">10%</span></strong></span></span></span> giá phụ kiện khi mua kèm ngay thời điểm mua điện thoại.</li>
	<li>
		Giảm <span style="color: rgb(255, 0, 0);"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 14px;"><strong><span style="float: none;" class="cam">15%</span></strong></span></span></span> giá SIM (thuê bao trả trước, tuỳ chọn)</li>
</ul>
</div><br></div>', N'no_photo.jpg', CAST(0x0000A0FD00AAFD1A AS DateTime), 0, 0, 12, 3, NULL, N'que-huong-la-chum-khe-ngot', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (76, N'eweerrew', 12000.0000, N'addaasdsdadsa
sdaasdasdasd', N'<div>			<div class="gift">Mua bất kỳ máy nào tại BachLongMobile bạn nhận được 1 trong các quà tặng sau</div>
             <div class="border2">
           	 <ul>
	<li>
		Tặng 01 miếng dán màn hình trị giá <em><span style="font-size: 14px;"><strong><span style="color: rgb(255, 0, 0);">150.000đ </span></strong></span></em>(Chỉ dành cho ipad 2, iphone 4, iphone 4S)</li>
	<li>
		Tặng 01 miếng dán bảo vệ màn hình cảm ứng trị giá <span style="font-size: 14px;"><span style="font-family: tahoma,geneva,sans-serif;"><strong><span style="color: rgb(255, 0, 0);"><span style="float: none;" class="cam">50.000đ</span></span></strong></span></span> (HTC,Iphone,SamSung,Blackberry,Nokia,SonyErisson)</li>
	<li>
		Giảm <span style="font-size: 14px;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="color: rgb(255, 0, 0);"><strong><span style="float: none;" class="cam">10%</span></strong></span></span></span> giá phụ kiện khi mua kèm ngay thời điểm mua điện thoại.</li>
	<li>
		Giảm <span style="color: rgb(255, 0, 0);"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 14px;"><strong><span style="float: none;" class="cam">15%</span></strong></span></span></span> giá SIM (thuê bao trả trước, tuỳ chọn)</li>
</ul>
</div><br></div>', N'no_photo.jpg', CAST(0x0000A0FD00AB9733 AS DateTime), 0, 0, 12, 3, 1, N'eweerrew', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (77, N'sdfdfsdsf', 123.0000, N'áddsasda', N'ádsaasdsda', N'no_photo_1967226326.jpg', CAST(0x0000A0FD00AD39A5 AS DateTime), 15, 0, 12, 1, 1, N'sdfdfsdsf', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (78, N'asdasdsda', 122.0000, N'sadasdsd', N'asdasdsda', N'no_photo.jpg', CAST(0x0000A0FD00FEBC5D AS DateTime), 0, 0, 1, NULL, NULL, N'asdasdsda', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (79, N'xin chao ban', 211.0000, N'sdaasdsda', N'asdasdasd', N'book2_850665890.jpg', CAST(0x0000A0FD00000000 AS DateTime), 5, 0, 0, NULL, 1, N'xin-chao-ban', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (80, N'xxxxxxxxxxxxxxxxx', 12.0000, N'sadasdasd', N'asdasasd', N'no_photo.jpg', CAST(0x0000A0FD00000000 AS DateTime), 0, 0, 0, NULL, NULL, N'xxxxxxxxxxxxxxxxx', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (81, N'sasadsda', 21323.0000, N'231231231', N'12323123132', N'no_photo.jpg', CAST(0x0000A0FD00000000 AS DateTime), 0, 0, 0, NULL, NULL, N'sasadsda', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (82, N'213312321321', 123312312.0000, NULL, NULL, N'no_photo.jpg', CAST(0x0000A11800000000 AS DateTime), 0, 0, 0, NULL, NULL, N'213312321321', 1, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (83, N'2434243', 23432434.0000, NULL, NULL, N'no_photo.jpg', CAST(0x0000A11800000000 AS DateTime), 3, 0, 0, 11, 1, N'2434243', 0, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Description], [FullDescription], [Image], [CreateDate], [TotalView], [TotalSale], [TotalQuantity], [ManufactureId], [RegionId], [NameUnsign], [Deleted], [DeletedDate]) VALUES (84, N'ewew', 6.0000, NULL, NULL, N'no_photo.jpg', CAST(0x0000A11800000000 AS DateTime), 10, 0, 0, 10, NULL, N'ewew', 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name], [Position], [Deleted], [DeletedDate]) VALUES (1, N'Mỹ', 1, 0, NULL)
INSERT [dbo].[Region] ([Id], [Name], [Position], [Deleted], [DeletedDate]) VALUES (2, N'Nhật Bản', 2, 0, NULL)
INSERT [dbo].[Region] ([Id], [Name], [Position], [Deleted], [DeletedDate]) VALUES (3, N'Trung Quốc', 3, 0, NULL)
INSERT [dbo].[Region] ([Id], [Name], [Position], [Deleted], [DeletedDate]) VALUES (4, N'Hàn Quốc', 4, 0, NULL)
INSERT [dbo].[Region] ([Id], [Name], [Position], [Deleted], [DeletedDate]) VALUES (5, N'Đài Loan', 5, 0, NULL)
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (7, N'truong', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, N'abc@abc.com', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (8, N'hoang', N'Hoàng', N'nơi nào đó', CAST(0x00007ACE00000000 AS DateTime), N'09009877766', 0, NULL, CAST(0x0000A3C000000000 AS DateTime), NULL, N'sounj142@gmail.com', N'234455667', 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (9, N'tung', N'Xxzc', N'123 ngoo', CAST(0x00007DA500000000 AS DateTime), N'343324', 0, NULL, NULL, NULL, N'xinchao12@gmail.comm', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (10, N'hieu', N'Lê Thị Thu An', NULL, CAST(0x000084B000000000 AS DateTime), NULL, 1, NULL, NULL, NULL, N'aa@a.ccccdssdsdssd', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (11, N'111', NULL, NULL, CAST(0x00008BD300000000 AS DateTime), NULL, 0, NULL, NULL, NULL, N'aa11@a.com', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (12, N'mina', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'aa@a.com', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (13, N'12345', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'abc@abc.co', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (14, N'laa', N'Lee Yoong un', N'10 Lee Laaai', CAST(0x00006DDC00000000 AS DateTime), N'344332', 0, NULL, NULL, NULL, N'aa@a.ccccdssdsdsd', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (15, N'hoang1', NULL, NULL, CAST(0x00007DC900000000 AS DateTime), NULL, 0, NULL, NULL, NULL, N'ki@ki.ki', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (16, N'thihuong', N'Lê Thị Thu Hương', N'số mấy nhà mấy phố mấy', CAST(0x0000806700000000 AS DateTime), N'333333333', 0, NULL, NULL, NULL, N'abc@abc.comm', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (17, N'huyvu', N'Xã Xệ', N'123 Ngõ 4B, Lý thường kiệt, Quận Tây Hồ, Hà Nội', CAST(0x00005E8400000000 AS DateTime), N'1234567', 0, NULL, NULL, NULL, N'abc@abc.ccomm', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (18, N'minh', N'Trần Minh', N'thôn 4 xã 3', CAST(0x00008BF100000000 AS DateTime), N'22222222', 0, NULL, NULL, NULL, N'aa@a.ccccdsdsdssd', N'333333333', 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (19, N'admin', NULL, NULL, CAST(0x00006E7300000000 AS DateTime), NULL, 0, NULL, NULL, NULL, N'what@yahoo.com', NULL, 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (21, N'123', N'Lê Thị Thu Uyên', N'12/8 Phố Quán Sứ, Phường 8, Quận Ba Đình, Đống đa, Hà Nội', CAST(0x000089AC00000000 AS DateTime), N'343443', 0, NULL, NULL, NULL, N'aa@a.ccc', N'54545454', 0, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [Name], [Address], [Birthday], [PhoneNumber], [Banned], [BannedReason], [BannedExpireDate], [Comment], [Email], [IdentityCardNumber], [Deleted], [DeletedDate]) VALUES (22, N'1234', N'Lê Huỳnh Minh Trang', N'12 Ngõ 4, Xóm cô đơn, Nhà cô quạnh
Phố 4
Bình Lợi
Thái Bình', CAST(0x00007DC800000000 AS DateTime), N'112345', 0, NULL, NULL, NULL, N'aa@a.cC', N'11232323', 0, NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (7, CAST(0x0000A26C007F5AAC AS DateTime), NULL, 1, NULL, 0, N'ADzzJKyR2+9EGnWQGvIsoAsNofUva1BFnjh8XUKvTsVCeVpIGaGXW5b4prtEY/XI5Q==', CAST(0x0000A26C007F5AAC AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (8, CAST(0x0000A26C0081F218 AS DateTime), NULL, 1, CAST(0x0000A27F00706AEF AS DateTime), 0, N'AFe3HuWJHfGtqbdx/6jOn1hUCIkxrOm898X0SYe6ep132Ttf/JNtGnI6VrSXLn3hfw==', CAST(0x0000A27F000073EF AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (9, CAST(0x0000A26C00AAC385 AS DateTime), NULL, 1, CAST(0x0000A27E00E1DC11 AS DateTime), 8, N'AESgvbQIEHA/7Je6Dw4jpbBqPMj+/67qK0bBGr+hRS5t3aIOQR5YER4yCkva8SIxLA==', CAST(0x0000A27000A039A0 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (10, CAST(0x0000A26C00E36C5D AS DateTime), NULL, 1, NULL, 0, N'ACYel2A1ZXWpabVgN/tJeEoR5fm1Uhyj6vbW/yh5uZxv7EpM7hKQTqjTsZb5fraePA==', CAST(0x0000A26C00E36C5D AS DateTime), N'', N'Ik6RTxWsUCHzKM5JFGOMBQ2', CAST(0x0000A27101067BB5 AS DateTime))
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (11, CAST(0x0000A26C00F45399 AS DateTime), NULL, 1, NULL, 0, N'AIBvyk/CMmDzxxaJk8WQjakVvsSz/FDaRJ+SvMFFw9T5iPAJCuQ9YccsS0DxJr5g8A==', CAST(0x0000A26C00F45399 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (12, CAST(0x0000A27000330636 AS DateTime), NULL, 1, NULL, 0, N'APCOEkuGrt0Y02IQNa4sGG4lZgUw02gBQnlPVcob8H5qjQ49jZFhTJOXov05NlXbQw==', CAST(0x0000A27000330636 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (13, CAST(0x0000A270003590E6 AS DateTime), NULL, 1, NULL, 0, N'AE9ZXoPT9WbDeq619fPXUQb5pzfI5uF9jTigNl/eROweRQgL0wYL+i6OViQhJ50tUg==', CAST(0x0000A270003590E6 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (14, CAST(0x0000A270003D1009 AS DateTime), NULL, 1, NULL, 0, N'AGXSmAMjRbsL3F1+gTSnR8NrualOASAxdI7UgHPTe+vhbmv2p3d0rMgpOD6KKry/RQ==', CAST(0x0000A270003D1009 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (15, CAST(0x0000A2700056E82A AS DateTime), NULL, 1, NULL, 0, N'AMOZmX7TRbWquSA2+YG9wfhqssZbUZ8ZwLGKjnrz0iI+BJfv1b9nKsyMGJUgfBLsPA==', CAST(0x0000A2700056E82A AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (16, CAST(0x0000A270005EBE34 AS DateTime), NULL, 1, CAST(0x0000A27000A19946 AS DateTime), 4, N'ADskFtwevHZORsyaHQsiIHjp9tsYSGkeuci2oA0yMxLBVL4PV0HIck/Bdegk1IoIZQ==', CAST(0x0000A270009EF23E AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (17, CAST(0x0000A2710020A76C AS DateTime), NULL, 1, CAST(0x0000A2710020D546 AS DateTime), 0, N'AEto29AtNEKGxur8FrolSJGxbxzqxW0QtvjF8ggzTkcd0gazqeOayRb8AeUXW15SPw==', CAST(0x0000A2710020A76C AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (18, CAST(0x0000A27500C54F16 AS DateTime), NULL, 1, NULL, 0, N'AMwZ31NGDczy9zXY4cRvf3ZAf25V12Oxrs0P78Pmvq3G/IeTi2DjDi9hynp5c+1Y+g==', CAST(0x0000A27500C54F16 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (19, CAST(0x0000A27700BD2170 AS DateTime), NULL, 1, NULL, 0, N'AEVf+fqb0urI7pc96CIsY8QYfPZe5Q5bB0k9a8tl6zKUSO1IT+28CQzjJeE+qROxmA==', CAST(0x0000A27700BD2170 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (21, CAST(0x0000A27E00EFF467 AS DateTime), NULL, 1, NULL, 0, N'ALB3uo91a/DEB+D5bv7l1iw7dazqjEDKgPqyPhMVgFyarhkbRSkj78Do0AO1vBVBsQ==', CAST(0x0000A27E00EFF467 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (22, CAST(0x0000A27E00F08E2D AS DateTime), NULL, 1, NULL, 0, N'AL2POaMEbbAG4EiH5tv2Tyimms76JUEL0iid/+sPczUFyMSFqokv3ZOSc51USN7ffA==', CAST(0x0000A27E00F08E2D AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__A9D1053410946B2A]    Script Date: 12/5/2013 7:09:11 PM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61603115AF4F]    Script Date: 12/5/2013 7:09:11 PM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Manufacture] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[OrderStatus] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[OrderStatusChangedLog] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [TotalView]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [TotalSale]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [TotalQuantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[ProductComment] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_banned]  DEFAULT ((0)) FOR [Banned]
GO
ALTER TABLE [dbo].[UserProfile] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserProfile] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserProfile]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_FK1] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_FK1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [OrderDetail_FK1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [OrderDetail_FK1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [OrderDetail_FK2] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [OrderDetail_FK2]
GO
ALTER TABLE [dbo].[OrderStatusChangedLog]  WITH CHECK ADD FOREIGN KEY([NewOrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[OrderStatusChangedLog]  WITH CHECK ADD FOREIGN KEY([OldOrderStatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[OrderStatusChangedLog]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderStatusChangedLog]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusChangedLog_UserProfile] FOREIGN KEY([PeopleRequestId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[OrderStatusChangedLog] CHECK CONSTRAINT [FK_OrderStatusChangedLog_UserProfile]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Product_FK2] FOREIGN KEY([ManufactureId])
REFERENCES [dbo].[Manufacture] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK2]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Product_FK3] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK3]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Product]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_UserProfile] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_UserProfile]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_check1] CHECK  (([TotalPrice]>=(0)))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_check1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [OrderDetail_check1] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [OrderDetail_check1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [OrderDetail_check2] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [OrderDetail_check2]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Product_check1] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_check1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Product_check2] CHECK  (([TotalView]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_check2]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Product_check3] CHECK  (([TotalSale]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_check3]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Product_check4] CHECK  (([TotalQuantity]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_check4]
GO
USE [master]
GO
ALTER DATABASE [MobishopNew] SET  READ_WRITE 
GO
