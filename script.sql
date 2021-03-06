USE [master]
GO
/****** Object:  Database [BhawnaDb]    Script Date: 24-02-2020 15:22:58 ******/
CREATE DATABASE [BhawnaDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BhawnaDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\BhawnaDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BhawnaDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\BhawnaDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BhawnaDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BhawnaDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BhawnaDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BhawnaDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BhawnaDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BhawnaDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BhawnaDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BhawnaDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BhawnaDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BhawnaDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BhawnaDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BhawnaDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BhawnaDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BhawnaDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BhawnaDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BhawnaDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BhawnaDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BhawnaDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BhawnaDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BhawnaDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BhawnaDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BhawnaDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BhawnaDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BhawnaDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BhawnaDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BhawnaDb] SET  MULTI_USER 
GO
ALTER DATABASE [BhawnaDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BhawnaDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BhawnaDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BhawnaDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BhawnaDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BhawnaDb] SET QUERY_STORE = OFF
GO
USE [BhawnaDb]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[AppUserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[AppRoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductPrice] [bigint] NOT NULL,
	[SellerDetailId] [int] NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
	[BrandId] [int] NULL,
	[SizeId] [int] NULL,
	[MaterialId] [int] NULL,
	[ColorId] [int] NULL,
	[LanguageId] [int] NULL,
	[AppRoleId] [int] NOT NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[SellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[PaymentDate] [datetimeoffset](7) NOT NULL,
	[OrderId] [int] NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CartValue] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerDetails]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerDetails](
	[SellerDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[PanNumber] [varchar](10) NOT NULL,
	[BankDetailId] [int] NOT NULL,
	[ShippingFeeDetailId] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_SellerDetails] PRIMARY KEY CLUSTERED 
(
	[SellerDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[PromoCodeId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [int] NOT NULL,
	[InvoiceDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vInvoices]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vInvoices]
AS
SELECT        dbo.Invoices.InvoiceId, dbo.Invoices.InvoiceDate, dbo.AppUsers.UserName, dbo.SellerDetails.CompanyName, dbo.Sellers.ProductName, dbo.CartItems.ProductQuantity, dbo.Sellers.ProductPrice, dbo.Orders.CreatedDate, 
                         dbo.Carts.CartValue
FROM            dbo.Payments INNER JOIN
                         dbo.Invoices ON dbo.Payments.PaymentId = dbo.Invoices.PaymentId INNER JOIN
                         dbo.Orders ON dbo.Payments.OrderId = dbo.Orders.OrderId INNER JOIN
                         dbo.AppUsers INNER JOIN
                         dbo.Carts ON dbo.AppUsers.AppUserId = dbo.Carts.AppUserId INNER JOIN
                         dbo.CartItems ON dbo.Carts.CartId = dbo.CartItems.CartId ON dbo.Orders.AppUserId = dbo.AppUsers.AppUserId INNER JOIN
                         dbo.SellerDetails ON dbo.AppUsers.AppUserId = dbo.SellerDetails.AppUserId INNER JOIN
                         dbo.Sellers ON dbo.SellerDetails.SellerDetailId = dbo.Sellers.SellerDetailId
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryId] [int] NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vCartItems]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCartItems]
AS
SELECT        dbo.Sellers.ProductName, dbo.Sellers.ProductPrice, dbo.CartItems.ProductQuantity, dbo.Carts.CartValue
FROM            dbo.Products INNER JOIN
                         dbo.Sellers ON dbo.Products.SellerId = dbo.Sellers.SellerId INNER JOIN
                         dbo.CartItems ON dbo.Products.ProductId = dbo.CartItems.ProductId INNER JOIN
                         dbo.Carts ON dbo.CartItems.CartId = dbo.Carts.CartId
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[AdvertisementId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [image] NULL,
	[OfferId] [int] NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[SellerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ValidityFrom] [datetimeoffset](7) NOT NULL,
	[ValidityTill] [datetimeoffset](7) NOT NULL,
	[DiscountPrice] [int] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OfferPercentage] [int] NOT NULL,
	[DiscountId] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAdvertisements]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAdvertisements]
AS
SELECT        dbo.Advertisements.AdvertisementId, dbo.Offers.OfferPercentage, dbo.Discounts.DiscountPrice
FROM            dbo.Advertisements INNER JOIN
                         dbo.Offers ON dbo.Advertisements.OfferId = dbo.Offers.OfferId INNER JOIN
                         dbo.Discounts ON dbo.Offers.DiscountId = dbo.Discounts.DiscountId
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vBrands]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBrands]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Brands ON dbo.Sellers.BrandId = dbo.Brands.BrandId
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[Size] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vSizes]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSizes]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Sizes ON dbo.Sellers.SizeId = dbo.Sizes.SizeId
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[Material] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vMaterials]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMaterials]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Materials ON dbo.Sellers.MaterialId = dbo.Materials.MaterialId
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vColors]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vColors]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Colors ON dbo.Sellers.ColorId = dbo.Colors.ColorId
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Language] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vLanguages]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLanguages]
AS
SELECT        dbo.Sellers.ProductName
FROM            dbo.Sellers INNER JOIN
                         dbo.Languages ON dbo.Sellers.LanguageId = dbo.Languages.LanguageId
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[AppRoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmazonApplicationObjects]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmazonApplicationObjects](
	[AmazonApplicationObjectId] [int] IDENTITY(1,1) NOT NULL,
	[AmazonApplicationObjectName] [varchar](50) NOT NULL,
	[AmazonApplicationObjectTypeId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjects] PRIMARY KEY CLUSTERED 
(
	[AmazonApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmazonApplicationObjectTypes]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmazonApplicationObjectTypes](
	[AmazonApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AmazonApplicationObjectTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationObjectTypes] PRIMARY KEY CLUSTERED 
(
	[AmazonApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRolePermissions]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRolePermissions](
	[AppRolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[AppRoleId] [int] NOT NULL,
	[CanView] [bit] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[AppRolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[AppRoleId] [int] IDENTITY(1,1) NOT NULL,
	[AppRoleName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[AppRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankDetails](
	[BankDetailId] [int] IDENTITY(1,1) NOT NULL,
	[AccountHolderName] [varchar](50) NOT NULL,
	[AccountType] [varchar](50) NOT NULL,
	[AccountNumber] [int] NOT NULL,
 CONSTRAINT [PK_BankDetails] PRIMARY KEY CLUSTERED 
(
	[BankDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [bigint] NOT NULL,
	[CardType] [varchar](50) NOT NULL,
	[ExpiryDate] [varchar](50) NOT NULL,
	[Cvv] [smallint] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [varchar](50) NULL,
	[Image] [image] NULL,
	[Ratings] [float] NOT NULL,
	[AppUserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musics]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musics](
	[MusicId] [int] IDENTITY(1,1) NOT NULL,
	[MusicName] [varchar](20) NOT NULL,
	[MusicSubCategoryId] [int] NOT NULL,
	[AlbumName] [varchar](20) NOT NULL,
	[ArtistName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Musics] PRIMARY KEY CLUSTERED 
(
	[MusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusicSubCategories]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicSubCategories](
	[MusicSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[PrimeMusicId] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_MusicSubCategories] PRIMARY KEY CLUSTERED 
(
	[MusicSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ExpectedDate] [datetimeoffset](7) NOT NULL,
	[ShippingFeeDetailId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_OrdeDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otps]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otps](
	[OtpId] [int] IDENTITY(1,1) NOT NULL,
	[OtpNumber] [int] NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Otps] PRIMARY KEY CLUSTERED 
(
	[OtpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimeMusics]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimeMusics](
	[PrimeMusicId] [int] IDENTITY(1,1) NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_PrimeMusics] PRIMARY KEY CLUSTERED 
(
	[PrimeMusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryName] [varchar](50) NOT NULL,
	[StoreId] [int] NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubCategories](
	[ProductSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryName] [varchar](50) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductSubCategories] PRIMARY KEY CLUSTERED 
(
	[ProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromoCodes]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoCodes](
	[PromoCodeId] [int] IDENTITY(1,1) NOT NULL,
	[PromoCodeName] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[ValidFrom] [datetimeoffset](7) NOT NULL,
	[ValidTill] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PromoCodes] PRIMARY KEY CLUSTERED 
(
	[PromoCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ShippingDate] [datetimeoffset](7) NOT NULL,
	[SellerId] [int] NOT NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingFeeDetails]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingFeeDetails](
	[ShippingFeeDetailId] [int] IDENTITY(1,1) NOT NULL,
	[LocalAmount] [int] NOT NULL,
	[RegionalAmount] [int] NOT NULL,
	[NationalAmount] [int] NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
 CONSTRAINT [PK_ShippingFeeDetails] PRIMARY KEY CLUSTERED 
(
	[ShippingFeeDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[TaxDetails] [varchar](50) NOT NULL,
	[Gst] [varchar](50) NOT NULL,
	[Signature] [image] NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[UserAddressId] [int] IDENTITY(1,1) NOT NULL,
	[HouseNumber] [varchar](50) NOT NULL,
	[Area] [varchar](50) NULL,
	[Landmark] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[AmazonApplicationObjectId] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[UserAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_AppRoles] FOREIGN KEY([AppRoleId])
REFERENCES [dbo].[AppRoles] ([AppRoleId])
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_AppRoles]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_Offers] FOREIGN KEY([OfferId])
REFERENCES [dbo].[Offers] ([OfferId])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_Offers]
GO
ALTER TABLE [dbo].[AmazonApplicationObjects]  WITH CHECK ADD  CONSTRAINT [FK_AmazonApplicationObjects_AmazonApplicationObjectTypes] FOREIGN KEY([AmazonApplicationObjectTypeId])
REFERENCES [dbo].[AmazonApplicationObjectTypes] ([AmazonApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[AmazonApplicationObjects] CHECK CONSTRAINT [FK_AmazonApplicationObjects_AmazonApplicationObjectTypes]
GO
ALTER TABLE [dbo].[AppRolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_AppRolePermissions_AppRoles] FOREIGN KEY([AppRoleId])
REFERENCES [dbo].[AppRoles] ([AppRoleId])
GO
ALTER TABLE [dbo].[AppRolePermissions] CHECK CONSTRAINT [FK_AppRolePermissions_AppRoles]
GO
ALTER TABLE [dbo].[AppUsers]  WITH CHECK ADD  CONSTRAINT [FK_AppUsers_AppRoles] FOREIGN KEY([AppRoleId])
REFERENCES [dbo].[AppRoles] ([AppRoleId])
GO
ALTER TABLE [dbo].[AppUsers] CHECK CONSTRAINT [FK_AppUsers_AppRoles]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_AppUsers]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([CartId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AppUsers]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Products]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Sellers]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_AppUsers]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Payments] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Payments]
GO
ALTER TABLE [dbo].[Musics]  WITH CHECK ADD  CONSTRAINT [FK_Musics_MusicSubCategories] FOREIGN KEY([MusicSubCategoryId])
REFERENCES [dbo].[MusicSubCategories] ([MusicSubCategoryId])
GO
ALTER TABLE [dbo].[Musics] CHECK CONSTRAINT [FK_Musics_MusicSubCategories]
GO
ALTER TABLE [dbo].[MusicSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_MusicSubCategories_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[MusicSubCategories] CHECK CONSTRAINT [FK_MusicSubCategories_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[MusicSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_MusicSubCategories_PrimeMusics] FOREIGN KEY([PrimeMusicId])
REFERENCES [dbo].[PrimeMusics] ([PrimeMusicId])
GO
ALTER TABLE [dbo].[MusicSubCategories] CHECK CONSTRAINT [FK_MusicSubCategories_PrimeMusics]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Discounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([DiscountId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Discounts]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([CartId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_Carts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdeDetails_ShippingFeeDetails] FOREIGN KEY([ShippingFeeDetailId])
REFERENCES [dbo].[ShippingFeeDetails] ([ShippingFeeDetailId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrdeDetails_ShippingFeeDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AppUsers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PromoCodes] FOREIGN KEY([PromoCodeId])
REFERENCES [dbo].[PromoCodes] ([PromoCodeId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PromoCodes]
GO
ALTER TABLE [dbo].[Otps]  WITH CHECK ADD  CONSTRAINT [FK_Otps_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[Otps] CHECK CONSTRAINT [FK_Otps_AppUsers]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders]
GO
ALTER TABLE [dbo].[PrimeMusics]  WITH CHECK ADD  CONSTRAINT [FK_PrimeMusics_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[PrimeMusics] CHECK CONSTRAINT [FK_PrimeMusics_AppUsers]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Stores]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductSubCategories] FOREIGN KEY([ProductSubCategoryId])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductSubCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sellers]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategories_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategories_ProductCategories]
GO
ALTER TABLE [dbo].[SellerDetails]  WITH CHECK ADD  CONSTRAINT [FK_SellerDetails_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[SellerDetails] CHECK CONSTRAINT [FK_SellerDetails_AppUsers]
GO
ALTER TABLE [dbo].[SellerDetails]  WITH CHECK ADD  CONSTRAINT [FK_SellerDetails_SellerDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[BankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[SellerDetails] CHECK CONSTRAINT [FK_SellerDetails_SellerDetails]
GO
ALTER TABLE [dbo].[SellerDetails]  WITH CHECK ADD  CONSTRAINT [FK_SellerDetails_ShippingFeeDetails] FOREIGN KEY([ShippingFeeDetailId])
REFERENCES [dbo].[ShippingFeeDetails] ([ShippingFeeDetailId])
GO
ALTER TABLE [dbo].[SellerDetails] CHECK CONSTRAINT [FK_SellerDetails_ShippingFeeDetails]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_AppRoles] FOREIGN KEY([AppRoleId])
REFERENCES [dbo].[AppRoles] ([AppRoleId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_AppRoles]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Brands]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([ColorId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Colors]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Languages]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Materials] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([MaterialId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Materials]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_SellerDetails] FOREIGN KEY([SellerDetailId])
REFERENCES [dbo].[SellerDetails] ([SellerDetailId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_SellerDetails]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Sizes] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([SizeId])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Sizes]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_Sellers]
GO
ALTER TABLE [dbo].[ShippingFeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingFeeDetails_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[ShippingFeeDetails] CHECK CONSTRAINT [FK_ShippingFeeDetails_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_AmazonApplicationObjects] FOREIGN KEY([AmazonApplicationObjectId])
REFERENCES [dbo].[AmazonApplicationObjects] ([AmazonApplicationObjectId])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_AmazonApplicationObjects]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_AppUsers] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([AppUserId])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_AppUsers]
GO
/****** Object:  StoredProcedure [dbo].[spSearchProducts]    Script Date: 24-02-2020 15:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchProducts]
	-- Add the parameters for the stored procedure here
	@Product varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductName from Sellers where (ProductName like @Product + '%') 
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Advertisements"
            Begin Extent = 
               Top = 210
               Left = 59
               Bottom = 340
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Offers"
            Begin Extent = 
               Top = 115
               Left = 327
               Bottom = 245
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discounts"
            Begin Extent = 
               Top = 28
               Left = 580
               Bottom = 156
               Right = 750
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdvertisements'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdvertisements'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brands"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBrands'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBrands'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[5] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Carts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 35
               Left = 1058
               Bottom = 165
               Right = 1252
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 66
               Left = 707
               Bottom = 179
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CartItems"
            Begin Extent = 
               Top = 146
               Left = 367
               Bottom = 276
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vCartItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Colors"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vColors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vColors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AppUsers"
            Begin Extent = 
               Top = 193
               Left = 910
               Bottom = 323
               Right = 1080
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CartItems"
            Begin Extent = 
               Top = 0
               Left = 23
               Bottom = 130
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Carts"
            Begin Extent = 
               Top = 20
               Left = 316
               Bottom = 150
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Invoices"
            Begin Extent = 
               Top = 0
               Left = 563
               Bottom = 113
               Right = 733
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Payments"
            Begin Extent = 
               Top = 5
               Left = 805
               Bottom = 135
               Right = 1044
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 1154
               Bottom = 136
               Right = 1324
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 277
            End
            DisplayFlags = 28' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
            TopColumn = 0
         End
         Begin Table = "SellerDetails"
            Begin Extent = 
               Top = 180
               Left = 402
               Bottom = 310
               Right = 596
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vInvoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Languages"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLanguages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vLanguages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Materials"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMaterials'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vMaterials'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sellers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sizes"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 102
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vSizes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vSizes'
GO
USE [master]
GO
ALTER DATABASE [BhawnaDb] SET  READ_WRITE 
GO
