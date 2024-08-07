USE [master]
GO
/****** Object:  Database [20114101]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE DATABASE [20114101]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'20114101', FILENAME = N'/var/opt/data/20114101.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'20114101_log', FILENAME = N'/var/opt/data/20114101_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [20114101] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [20114101].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [20114101] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [20114101] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [20114101] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [20114101] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [20114101] SET ARITHABORT OFF 
GO
ALTER DATABASE [20114101] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [20114101] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [20114101] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [20114101] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [20114101] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [20114101] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [20114101] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [20114101] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [20114101] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [20114101] SET  DISABLE_BROKER 
GO
ALTER DATABASE [20114101] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [20114101] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [20114101] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [20114101] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [20114101] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [20114101] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [20114101] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [20114101] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [20114101] SET  MULTI_USER 
GO
ALTER DATABASE [20114101] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [20114101] SET DB_CHAINING OFF 
GO
ALTER DATABASE [20114101] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [20114101] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [20114101] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [20114101] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [20114101] SET QUERY_STORE = ON
GO
ALTER DATABASE [20114101] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [20114101]
GO
/****** Object:  Schema [20114101]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE SCHEMA [20114101]
GO
/****** Object:  Table [20114101].[AspNetRoleClaims]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[AspNetRoles]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[AspNetUserClaims]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[AspNetUserLogins]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[AspNetUserRoles]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [20114101].[AspNetUsers]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[AspNetUserTokens]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[Customers]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[PhoneNumber] [nvarchar](100) NOT NULL,
	[Address1Line] [nvarchar](255) NOT NULL,
	[Address2Line] [nvarchar](255) NULL,
	[City] [nvarchar](100) NOT NULL,
	[PostCode] [nvarchar](50) NOT NULL,
	[EcontOfficeCode] [nvarchar](50) NULL,
	[Updated_20114101] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Customers_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [20114101].[log_20114101]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[log_20114101](
	[TableName] [nvarchar](50) NOT NULL,
	[Operation] [nvarchar](50) NOT NULL,
	[OperationTime] [datetime2](7) NOT NULL,
	[Updated_20114101] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [20114101].[Orders]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Updated_20114101] [datetime2](7) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [20114101].[ProductCategories]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Updated_20114101] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [20114101].[Products]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Updated_20114101] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [20114101].[ProductsOrders]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[ProductsOrders](
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Updated_20114101] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductsOrders] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [20114101].[ProductsProductCategories]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [20114101].[ProductsProductCategories](
	[ProductId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Updated_20114101] [datetime2](7) NULL,
 CONSTRAINT [PK_ProductsProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [20114101].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5b74ffa9-2bb6-4c35-a301-513c54454ea5', N'Customer', N'CUSTOMER', NULL)
INSERT [20114101].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9238e0ae-f351-4f3c-b619-2fa1c113f72c', N'SiteOwner', N'SITEOWNER', NULL)
INSERT [20114101].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'968f73c7-5a2f-4bb8-abe6-d230a5aa493a', N'Administrator', N'ADMINISTRATOR', NULL)
GO
INSERT [20114101].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c05df755-f278-400f-bf85-d8d5001e05f0', N'9238e0ae-f351-4f3c-b619-2fa1c113f72c')
INSERT [20114101].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'08b90f7c-4e07-46cb-9fb7-78b03c5f075f', N'968f73c7-5a2f-4bb8-abe6-d230a5aa493a')
GO
INSERT [20114101].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [CustomerId]) VALUES (N'08b90f7c-4e07-46cb-9fb7-78b03c5f075f', N'ros20021999xbox@gmail.com', N'ROS20021999XBOX@GMAIL.COM', N'ros20021999xbox@gmail.com', N'ROS20021999XBOX@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEM6QsLGpfZmiSqtEhacj8SWp1o+Z9wEMLa183avnEUBADTqMsKPh39nL0Ssu3ZIZOg==', N'XWGQDXHFMTUSVOGR6QESIOPU77J6GPSB', N'25a63e1e-3a15-48ea-a9fd-8fa70549d1f3', NULL, 0, 0, NULL, 1, 0, 3)
INSERT [20114101].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [CustomerId]) VALUES (N'c05df755-f278-400f-bf85-d8d5001e05f0', N'ros20021999@gmail.com', N'ROS20021999@GMAIL.COM', N'ros20021999@gmail.com', N'ROS20021999@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGuXkmNUMV/SaDvePdl1n3tWLqmoLYLQC//MBt/l19qsaAFxjlIRZcEHv+2nBgt9mA==', N'2LB32WST4V45IHKHRMDNOKRLWQRLWJJD', N'dd08285b-0d77-4829-a9b9-9636929d3641', NULL, 0, 0, NULL, 1, 0, 1)
GO
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-20T17:06:17.8366667' AS DateTime2), CAST(N'2024-05-20T17:06:17.8366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-20T17:06:38.9666667' AS DateTime2), CAST(N'2024-05-20T17:06:38.9666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-20T18:30:03.3100000' AS DateTime2), CAST(N'2024-05-20T18:30:03.3100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-20T18:30:44.6266667' AS DateTime2), CAST(N'2024-05-20T18:30:44.6266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-21T16:52:12.2500000' AS DateTime2), CAST(N'2024-05-21T16:52:12.2500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T20:59:25.4000000' AS DateTime2), CAST(N'2024-05-21T20:59:25.4000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T20:59:25.4066667' AS DateTime2), CAST(N'2024-05-21T20:59:25.4066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:00:56.4366667' AS DateTime2), CAST(N'2024-05-21T21:00:56.4366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T21:00:56.4400000' AS DateTime2), CAST(N'2024-05-21T21:00:56.4400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:01:18.9966667' AS DateTime2), CAST(N'2024-05-21T21:01:18.9966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T21:01:19.0000000' AS DateTime2), CAST(N'2024-05-21T21:01:19.0000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T21:01:19.0000000' AS DateTime2), CAST(N'2024-05-21T21:01:19.0000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:02:32.1833333' AS DateTime2), CAST(N'2024-05-21T21:02:32.1833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T21:02:32.1833333' AS DateTime2), CAST(N'2024-05-21T21:02:32.1833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-22T01:24:29.8900000' AS DateTime2), CAST(N'2024-05-22T01:24:29.8900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-22T01:24:30.5933333' AS DateTime2), CAST(N'2024-05-22T01:24:30.5933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-22T01:24:30.6566667' AS DateTime2), CAST(N'2024-05-22T01:24:30.6566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-22T01:27:20.8366667' AS DateTime2), CAST(N'2024-05-22T01:27:20.8366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-22T01:27:22.2400000' AS DateTime2), CAST(N'2024-05-22T01:27:22.2400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-22T01:27:22.3466667' AS DateTime2), CAST(N'2024-05-22T01:27:22.3466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-22T01:27:22.5100000' AS DateTime2), CAST(N'2024-05-22T01:27:22.5100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-22T01:27:22.5100000' AS DateTime2), CAST(N'2024-05-22T01:27:22.5100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-22T02:39:19.8100000' AS DateTime2), CAST(N'2024-05-22T02:39:19.8100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-22T02:45:12.1633333' AS DateTime2), CAST(N'2024-05-22T02:45:12.1633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T02:46:21.9466667' AS DateTime2), CAST(N'2024-05-22T02:46:21.9466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T02:46:21.9733333' AS DateTime2), CAST(N'2024-05-22T02:46:21.9733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T15:18:43.8266667' AS DateTime2), CAST(N'2024-05-22T15:18:43.8266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T15:18:43.8900000' AS DateTime2), CAST(N'2024-05-22T15:18:43.8900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T15:20:29.6300000' AS DateTime2), CAST(N'2024-05-22T15:20:29.6300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T15:20:29.7300000' AS DateTime2), CAST(N'2024-05-22T15:20:29.7300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T15:24:11.3400000' AS DateTime2), CAST(N'2024-05-22T15:24:11.3400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T15:24:11.3500000' AS DateTime2), CAST(N'2024-05-22T15:24:11.3500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T15:25:34.7066667' AS DateTime2), CAST(N'2024-05-22T15:25:34.7066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T15:25:34.7166667' AS DateTime2), CAST(N'2024-05-22T15:25:34.7166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-22T15:29:18.1000000' AS DateTime2), CAST(N'2024-05-22T15:29:18.1000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'UPDATE', CAST(N'2024-05-22T15:29:18.1033333' AS DateTime2), CAST(N'2024-05-22T15:29:18.1033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-22T15:30:16.9733333' AS DateTime2), CAST(N'2024-05-22T15:30:16.9733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'UPDATE', CAST(N'2024-05-22T15:30:16.9800000' AS DateTime2), CAST(N'2024-05-22T15:30:16.9800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-22T15:31:24.5000000' AS DateTime2), CAST(N'2024-05-22T15:31:24.5000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'UPDATE', CAST(N'2024-05-22T15:31:24.5033333' AS DateTime2), CAST(N'2024-05-22T15:31:24.5033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-22T15:32:14.8700000' AS DateTime2), CAST(N'2024-05-22T15:32:14.8700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'UPDATE', CAST(N'2024-05-22T15:32:14.8766667' AS DateTime2), CAST(N'2024-05-22T15:32:14.8766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-22T15:47:05.2966667' AS DateTime2), CAST(N'2024-05-22T15:47:05.2966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'UPDATE', CAST(N'2024-05-22T15:47:05.3000000' AS DateTime2), CAST(N'2024-05-22T15:47:05.3000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T20:54:49.5700000' AS DateTime2), CAST(N'2024-05-22T20:54:49.5700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T20:54:49.6666667' AS DateTime2), CAST(N'2024-05-22T20:54:49.6666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:23:49.5366667' AS DateTime2), CAST(N'2024-05-22T22:23:49.5366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:25:14.5633333' AS DateTime2), CAST(N'2024-05-22T22:25:14.5633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:25:14.6400000' AS DateTime2), CAST(N'2024-05-22T22:25:14.6400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.6600000' AS DateTime2), CAST(N'2024-05-22T22:26:15.6600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.7900000' AS DateTime2), CAST(N'2024-05-22T22:26:15.7900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.3933333' AS DateTime2), CAST(N'2024-05-22T22:27:09.3933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.4500000' AS DateTime2), CAST(N'2024-05-22T22:27:09.4500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.4900000' AS DateTime2), CAST(N'2024-05-22T22:27:09.4900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.6133333' AS DateTime2), CAST(N'2024-05-22T22:27:09.6133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.7266667' AS DateTime2), CAST(N'2024-05-22T22:27:09.7266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.8466667' AS DateTime2), CAST(N'2024-05-22T22:27:09.8466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.3433333' AS DateTime2), CAST(N'2024-05-22T22:28:46.3433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.3700000' AS DateTime2), CAST(N'2024-05-22T22:28:46.3700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.3933333' AS DateTime2), CAST(N'2024-05-22T22:28:46.3933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.7833333' AS DateTime2), CAST(N'2024-05-22T22:28:46.7833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.7933333' AS DateTime2), CAST(N'2024-05-22T22:28:46.7933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8000000' AS DateTime2), CAST(N'2024-05-22T22:28:46.8000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8533333' AS DateTime2), CAST(N'2024-05-22T22:28:46.8533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8566667' AS DateTime2), CAST(N'2024-05-22T22:28:46.8566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9166667' AS DateTime2), CAST(N'2024-05-22T22:28:46.9166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9300000' AS DateTime2), CAST(N'2024-05-22T22:28:46.9300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9333333' AS DateTime2), CAST(N'2024-05-22T22:28:46.9333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9400000' AS DateTime2), CAST(N'2024-05-22T22:28:46.9400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9500000' AS DateTime2), CAST(N'2024-05-22T22:28:46.9500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9733333' AS DateTime2), CAST(N'2024-05-22T22:28:46.9733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.0566667' AS DateTime2), CAST(N'2024-05-22T22:29:33.0566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.0666667' AS DateTime2), CAST(N'2024-05-22T22:29:33.0666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.1700000' AS DateTime2), CAST(N'2024-05-22T22:29:33.1700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.1866667' AS DateTime2), CAST(N'2024-05-22T22:29:33.1866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.2466667' AS DateTime2), CAST(N'2024-05-22T22:29:33.2466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.2800000' AS DateTime2), CAST(N'2024-05-22T22:29:33.2800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.2866667' AS DateTime2), CAST(N'2024-05-22T22:29:33.2866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.3066667' AS DateTime2), CAST(N'2024-05-22T22:29:33.3066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4100000' AS DateTime2), CAST(N'2024-05-22T22:29:33.4100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4600000' AS DateTime2), CAST(N'2024-05-22T22:29:33.4600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4666667' AS DateTime2), CAST(N'2024-05-22T22:29:33.4666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4966667' AS DateTime2), CAST(N'2024-05-22T22:29:33.4966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.5433333' AS DateTime2), CAST(N'2024-05-22T22:29:33.5433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.5466667' AS DateTime2), CAST(N'2024-05-22T22:29:33.5466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.5866667' AS DateTime2), CAST(N'2024-05-22T22:29:33.5866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.6633333' AS DateTime2), CAST(N'2024-05-22T22:29:33.6633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.6666667' AS DateTime2), CAST(N'2024-05-22T22:29:33.6666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4466667' AS DateTime2), CAST(N'2024-05-22T22:29:34.4466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4500000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4566667' AS DateTime2), CAST(N'2024-05-22T22:29:34.4566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4633333' AS DateTime2), CAST(N'2024-05-22T22:29:34.4633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4666667' AS DateTime2), CAST(N'2024-05-22T22:29:34.4666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4700000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4766667' AS DateTime2), CAST(N'2024-05-22T22:29:34.4766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4900000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5033333' AS DateTime2), CAST(N'2024-05-22T22:29:34.5033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5300000' AS DateTime2), CAST(N'2024-05-22T22:29:34.5300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5400000' AS DateTime2), CAST(N'2024-05-22T22:29:34.5400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T23:16:58.7900000' AS DateTime2), CAST(N'2024-05-22T23:16:58.7900000' AS DateTime2))
GO
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-22T23:27:45.1633333' AS DateTime2), CAST(N'2024-05-22T23:27:45.1633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T10:27:27.2466667' AS DateTime2), CAST(N'2024-05-23T10:27:27.2466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T10:27:27.2533333' AS DateTime2), CAST(N'2024-05-23T10:27:27.2533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T13:03:00.7766667' AS DateTime2), CAST(N'2024-05-23T13:03:00.7766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T13:03:00.9233333' AS DateTime2), CAST(N'2024-05-23T13:03:00.9233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T13:03:00.9500000' AS DateTime2), CAST(N'2024-05-23T13:03:00.9500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T13:03:01.0033333' AS DateTime2), CAST(N'2024-05-23T13:03:01.0033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T13:03:01.0066667' AS DateTime2), CAST(N'2024-05-23T13:03:01.0066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T13:06:04.7000000' AS DateTime2), CAST(N'2024-05-23T13:06:04.7000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T13:06:04.7133333' AS DateTime2), CAST(N'2024-05-23T13:06:04.7133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-21T16:52:18.9300000' AS DateTime2), CAST(N'2024-05-21T16:52:18.9300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-21T17:44:53.5700000' AS DateTime2), CAST(N'2024-05-21T17:44:53.5700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T17:44:53.6100000' AS DateTime2), CAST(N'2024-05-21T17:44:53.6100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-21T18:11:01.0466667' AS DateTime2), CAST(N'2024-05-21T18:11:01.0466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T18:11:01.0800000' AS DateTime2), CAST(N'2024-05-21T18:11:01.0800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-21T18:14:28.6566667' AS DateTime2), CAST(N'2024-05-21T18:14:28.6566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T18:14:28.6666667' AS DateTime2), CAST(N'2024-05-21T18:14:28.6666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:02:09.7833333' AS DateTime2), CAST(N'2024-05-21T21:02:09.7833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T21:02:09.7866667' AS DateTime2), CAST(N'2024-05-21T21:02:09.7866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:12:03.4066667' AS DateTime2), CAST(N'2024-05-21T21:12:03.4066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T21:12:03.4100000' AS DateTime2), CAST(N'2024-05-21T21:12:03.4100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:12:13.1433333' AS DateTime2), CAST(N'2024-05-21T21:12:13.1433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T21:12:13.1433333' AS DateTime2), CAST(N'2024-05-21T21:12:13.1433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T21:12:13.1500000' AS DateTime2), CAST(N'2024-05-21T21:12:13.1500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-21T21:25:41.7966667' AS DateTime2), CAST(N'2024-05-21T21:25:41.7966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-21T21:28:07.6200000' AS DateTime2), CAST(N'2024-05-21T21:28:07.6200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-21T21:36:57.9233333' AS DateTime2), CAST(N'2024-05-21T21:36:57.9233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-21T21:37:06.6033333' AS DateTime2), CAST(N'2024-05-21T21:37:06.6033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-21T22:58:24.0566667' AS DateTime2), CAST(N'2024-05-21T22:58:24.0566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-21T23:42:33.7333333' AS DateTime2), CAST(N'2024-05-21T23:42:33.7333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-21T23:56:53.9366667' AS DateTime2), CAST(N'2024-05-21T23:56:53.9366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-22T00:08:02.3933333' AS DateTime2), CAST(N'2024-05-22T00:08:02.3933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-22T00:08:03.4100000' AS DateTime2), CAST(N'2024-05-22T00:08:03.4100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-22T00:10:14.6800000' AS DateTime2), CAST(N'2024-05-22T00:10:14.6800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-22T00:10:15.9400000' AS DateTime2), CAST(N'2024-05-22T00:10:15.9400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-22T00:10:16.0800000' AS DateTime2), CAST(N'2024-05-22T00:10:16.0800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-22T02:42:09.0166667' AS DateTime2), CAST(N'2024-05-22T02:42:09.0166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T14:54:19.8166667' AS DateTime2), CAST(N'2024-05-22T14:54:19.8166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T14:54:19.8600000' AS DateTime2), CAST(N'2024-05-22T14:54:19.8600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T15:14:35.8566667' AS DateTime2), CAST(N'2024-05-22T15:14:35.8566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T15:14:35.9200000' AS DateTime2), CAST(N'2024-05-22T15:14:35.9200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-22T19:06:48.2966667' AS DateTime2), CAST(N'2024-05-22T19:06:48.2966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-22T19:06:48.9266667' AS DateTime2), CAST(N'2024-05-22T19:06:48.9266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-22T19:06:49.0333333' AS DateTime2), CAST(N'2024-05-22T19:06:49.0333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-22T19:06:49.2100000' AS DateTime2), CAST(N'2024-05-22T19:06:49.2100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-22T19:06:49.2100000' AS DateTime2), CAST(N'2024-05-22T19:06:49.2100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-22T20:07:13.7500000' AS DateTime2), CAST(N'2024-05-22T20:07:13.7500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-22T20:56:01.4233333' AS DateTime2), CAST(N'2024-05-22T20:56:01.4233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-22T20:56:01.4400000' AS DateTime2), CAST(N'2024-05-22T20:56:01.4400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:25:14.5600000' AS DateTime2), CAST(N'2024-05-22T22:25:14.5600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:25:14.6266667' AS DateTime2), CAST(N'2024-05-22T22:25:14.6266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.6666667' AS DateTime2), CAST(N'2024-05-22T22:26:15.6666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.7433333' AS DateTime2), CAST(N'2024-05-22T22:26:15.7433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.7900000' AS DateTime2), CAST(N'2024-05-22T22:26:15.7900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.8166667' AS DateTime2), CAST(N'2024-05-22T22:26:15.8166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.9133333' AS DateTime2), CAST(N'2024-05-22T22:26:15.9133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:26:15.9300000' AS DateTime2), CAST(N'2024-05-22T22:26:15.9300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.3933333' AS DateTime2), CAST(N'2024-05-22T22:27:09.3933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.4233333' AS DateTime2), CAST(N'2024-05-22T22:27:09.4233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.4366667' AS DateTime2), CAST(N'2024-05-22T22:27:09.4366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.4900000' AS DateTime2), CAST(N'2024-05-22T22:27:09.4900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.5166667' AS DateTime2), CAST(N'2024-05-22T22:27:09.5166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.5700000' AS DateTime2), CAST(N'2024-05-22T22:27:09.5700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.6400000' AS DateTime2), CAST(N'2024-05-22T22:27:09.6400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:27:09.6633333' AS DateTime2), CAST(N'2024-05-22T22:27:09.6633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.3500000' AS DateTime2), CAST(N'2024-05-22T22:28:46.3500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.3700000' AS DateTime2), CAST(N'2024-05-22T22:28:46.3700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.4166667' AS DateTime2), CAST(N'2024-05-22T22:28:46.4166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.7933333' AS DateTime2), CAST(N'2024-05-22T22:28:46.7933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8000000' AS DateTime2), CAST(N'2024-05-22T22:28:46.8000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8533333' AS DateTime2), CAST(N'2024-05-22T22:28:46.8533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8566667' AS DateTime2), CAST(N'2024-05-22T22:28:46.8566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8833333' AS DateTime2), CAST(N'2024-05-22T22:28:46.8833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9166667' AS DateTime2), CAST(N'2024-05-22T22:28:46.9166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9266667' AS DateTime2), CAST(N'2024-05-22T22:28:46.9266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9666667' AS DateTime2), CAST(N'2024-05-22T22:28:46.9666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.9700000' AS DateTime2), CAST(N'2024-05-22T22:28:46.9700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:47.0066667' AS DateTime2), CAST(N'2024-05-22T22:28:47.0066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:47.0400000' AS DateTime2), CAST(N'2024-05-22T22:28:47.0400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.0666667' AS DateTime2), CAST(N'2024-05-22T22:29:33.0666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.0933333' AS DateTime2), CAST(N'2024-05-22T22:29:33.0933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.1300000' AS DateTime2), CAST(N'2024-05-22T22:29:33.1300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.1500000' AS DateTime2), CAST(N'2024-05-22T22:29:33.1500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.2166667' AS DateTime2), CAST(N'2024-05-22T22:29:33.2166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4600000' AS DateTime2), CAST(N'2024-05-22T22:29:33.4600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4666667' AS DateTime2), CAST(N'2024-05-22T22:29:33.4666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.4966667' AS DateTime2), CAST(N'2024-05-22T22:29:33.4966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.5366667' AS DateTime2), CAST(N'2024-05-22T22:29:33.5366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.6666667' AS DateTime2), CAST(N'2024-05-22T22:29:33.6666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4466667' AS DateTime2), CAST(N'2024-05-22T22:29:34.4466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4500000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4600000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4633333' AS DateTime2), CAST(N'2024-05-22T22:29:34.4633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4700000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4900000' AS DateTime2), CAST(N'2024-05-22T22:29:34.4900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5000000' AS DateTime2), CAST(N'2024-05-22T22:29:34.5000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5100000' AS DateTime2), CAST(N'2024-05-22T22:29:34.5100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5300000' AS DateTime2), CAST(N'2024-05-22T22:29:34.5300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5333333' AS DateTime2), CAST(N'2024-05-22T22:29:34.5333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5400000' AS DateTime2), CAST(N'2024-05-22T22:29:34.5400000' AS DateTime2))
GO
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.5433333' AS DateTime2), CAST(N'2024-05-22T22:29:34.5433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:32:22.8500000' AS DateTime2), CAST(N'2024-05-22T22:32:22.8500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:32:29.3066667' AS DateTime2), CAST(N'2024-05-22T22:32:29.3066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:32:52.3966667' AS DateTime2), CAST(N'2024-05-22T22:32:52.3966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:33:45.3100000' AS DateTime2), CAST(N'2024-05-22T22:33:45.3100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:43:46.8300000' AS DateTime2), CAST(N'2024-05-22T22:43:46.8300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:43:46.8533333' AS DateTime2), CAST(N'2024-05-22T22:43:46.8533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:43:46.8566667' AS DateTime2), CAST(N'2024-05-22T22:43:46.8566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T23:16:58.8000000' AS DateTime2), CAST(N'2024-05-22T23:16:58.8000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T00:42:48.6833333' AS DateTime2), CAST(N'2024-05-23T00:42:48.6833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T00:42:48.7100000' AS DateTime2), CAST(N'2024-05-23T00:42:48.7100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T00:43:03.4500000' AS DateTime2), CAST(N'2024-05-23T00:43:03.4500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T01:43:06.9266667' AS DateTime2), CAST(N'2024-05-23T01:43:06.9266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-21T18:12:03.7000000' AS DateTime2), CAST(N'2024-05-21T18:12:03.7000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T18:12:03.7333333' AS DateTime2), CAST(N'2024-05-21T18:12:03.7333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-21T18:13:41.0600000' AS DateTime2), CAST(N'2024-05-21T18:13:41.0600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T18:13:41.0733333' AS DateTime2), CAST(N'2024-05-21T18:13:41.0733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-21T18:14:19.6966667' AS DateTime2), CAST(N'2024-05-21T18:14:19.6966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T18:14:19.7000000' AS DateTime2), CAST(N'2024-05-21T18:14:19.7000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T20:58:50.7600000' AS DateTime2), CAST(N'2024-05-21T20:58:50.7600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T20:58:50.7633333' AS DateTime2), CAST(N'2024-05-21T20:58:50.7633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:03:45.8600000' AS DateTime2), CAST(N'2024-05-21T21:03:45.8600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T21:03:45.8633333' AS DateTime2), CAST(N'2024-05-21T21:03:45.8633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T21:03:45.8666667' AS DateTime2), CAST(N'2024-05-21T21:03:45.8666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:05:20.8533333' AS DateTime2), CAST(N'2024-05-21T21:05:20.8533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-21T21:05:20.8566667' AS DateTime2), CAST(N'2024-05-21T21:05:20.8566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-21T21:14:16.2166667' AS DateTime2), CAST(N'2024-05-21T21:14:16.2166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-21T21:14:16.2233333' AS DateTime2), CAST(N'2024-05-21T21:14:16.2233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:28:46.8033333' AS DateTime2), CAST(N'2024-05-22T22:28:46.8033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:33.3733333' AS DateTime2), CAST(N'2024-05-22T22:29:33.3733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-22T22:29:34.4233333' AS DateTime2), CAST(N'2024-05-22T22:29:34.4233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T02:11:59.1166667' AS DateTime2), CAST(N'2024-05-23T02:11:59.1166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-23T02:29:27.7133333' AS DateTime2), CAST(N'2024-05-23T02:29:27.7133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-23T02:29:29.0166667' AS DateTime2), CAST(N'2024-05-23T02:29:29.0166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-23T02:29:31.0000000' AS DateTime2), CAST(N'2024-05-23T02:29:31.0000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T10:26:41.6500000' AS DateTime2), CAST(N'2024-05-23T10:26:41.6500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T10:26:41.6700000' AS DateTime2), CAST(N'2024-05-23T10:26:41.6700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T10:27:08.6000000' AS DateTime2), CAST(N'2024-05-23T10:27:08.6000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T10:27:08.6100000' AS DateTime2), CAST(N'2024-05-23T10:27:08.6100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T10:27:40.2466667' AS DateTime2), CAST(N'2024-05-23T10:27:40.2466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-23T10:27:40.2466667' AS DateTime2), CAST(N'2024-05-23T10:27:40.2466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T11:33:36.6700000' AS DateTime2), CAST(N'2024-05-23T11:33:36.6700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T11:33:48.7366667' AS DateTime2), CAST(N'2024-05-23T11:33:48.7366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T11:34:13.9233333' AS DateTime2), CAST(N'2024-05-23T11:34:13.9233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T11:41:48.8666667' AS DateTime2), CAST(N'2024-05-23T11:41:48.8666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T11:41:49.1833333' AS DateTime2), CAST(N'2024-05-23T11:41:49.1833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T11:41:49.2133333' AS DateTime2), CAST(N'2024-05-23T11:41:49.2133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T11:41:49.2866667' AS DateTime2), CAST(N'2024-05-23T11:41:49.2866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T11:41:49.2866667' AS DateTime2), CAST(N'2024-05-23T11:41:49.2866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T12:19:30.2100000' AS DateTime2), CAST(N'2024-05-23T12:19:30.2100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T12:56:07.8500000' AS DateTime2), CAST(N'2024-05-23T12:56:07.8500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T12:56:47.7033333' AS DateTime2), CAST(N'2024-05-23T12:56:47.7033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'UPDATE', CAST(N'2024-05-23T13:03:22.6600000' AS DateTime2), CAST(N'2024-05-23T13:03:22.6600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T13:03:58.5933333' AS DateTime2), CAST(N'2024-05-23T13:03:58.5933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:19:14.6766667' AS DateTime2), CAST(N'2024-05-23T13:19:14.6766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T13:19:48.3900000' AS DateTime2), CAST(N'2024-05-23T13:19:48.3900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:24:02.9000000' AS DateTime2), CAST(N'2024-05-23T13:24:02.9000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:24:03.0500000' AS DateTime2), CAST(N'2024-05-23T13:24:03.0500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:25:15.0533333' AS DateTime2), CAST(N'2024-05-23T13:25:15.0533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:25:15.0800000' AS DateTime2), CAST(N'2024-05-23T13:25:15.0800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:27:08.8533333' AS DateTime2), CAST(N'2024-05-23T13:27:08.8533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:27:08.8800000' AS DateTime2), CAST(N'2024-05-23T13:27:08.8800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.1700000' AS DateTime2), CAST(N'2024-05-23T13:30:46.1700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.2633333' AS DateTime2), CAST(N'2024-05-23T13:30:46.2633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.3233333' AS DateTime2), CAST(N'2024-05-23T13:30:46.3233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.3400000' AS DateTime2), CAST(N'2024-05-23T13:30:46.3400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:33:56.2700000' AS DateTime2), CAST(N'2024-05-23T13:33:56.2700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:23.9700000' AS DateTime2), CAST(N'2024-05-23T13:35:23.9700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:31.2566667' AS DateTime2), CAST(N'2024-05-23T13:35:31.2566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:31.3133333' AS DateTime2), CAST(N'2024-05-23T13:35:31.3133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:31.3733333' AS DateTime2), CAST(N'2024-05-23T13:35:31.3733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:31.3900000' AS DateTime2), CAST(N'2024-05-23T13:35:31.3900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.5600000' AS DateTime2), CAST(N'2024-05-23T13:39:51.5600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.7033333' AS DateTime2), CAST(N'2024-05-23T13:39:51.7033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8266667' AS DateTime2), CAST(N'2024-05-23T13:39:51.8266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8300000' AS DateTime2), CAST(N'2024-05-23T13:39:51.8300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8400000' AS DateTime2), CAST(N'2024-05-23T13:39:51.8400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.9300000' AS DateTime2), CAST(N'2024-05-23T13:39:51.9300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:41:37.4033333' AS DateTime2), CAST(N'2024-05-23T13:41:37.4033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:41:41.8566667' AS DateTime2), CAST(N'2024-05-23T13:41:41.8566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:41:45.9633333' AS DateTime2), CAST(N'2024-05-23T13:41:45.9633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T13:48:14.6633333' AS DateTime2), CAST(N'2024-05-23T13:48:14.6633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T13:48:14.7966667' AS DateTime2), CAST(N'2024-05-23T13:48:14.7966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T13:48:14.8300000' AS DateTime2), CAST(N'2024-05-23T13:48:14.8300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T13:48:14.8666667' AS DateTime2), CAST(N'2024-05-23T13:48:14.8666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T13:48:14.8700000' AS DateTime2), CAST(N'2024-05-23T13:48:14.8700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T14:54:44.6800000' AS DateTime2), CAST(N'2024-05-23T14:54:44.6800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T15:00:14.7933333' AS DateTime2), CAST(N'2024-05-23T15:00:14.7933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T15:23:40.9966667' AS DateTime2), CAST(N'2024-05-23T15:23:40.9966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T15:23:56.1366667' AS DateTime2), CAST(N'2024-05-23T15:23:56.1366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T15:24:23.7766667' AS DateTime2), CAST(N'2024-05-23T15:24:23.7766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-23T15:25:02.1366667' AS DateTime2), CAST(N'2024-05-23T15:25:02.1366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T15:43:21.8966667' AS DateTime2), CAST(N'2024-05-23T15:43:21.8966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T15:43:21.9266667' AS DateTime2), CAST(N'2024-05-23T15:43:21.9266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T15:44:50.7433333' AS DateTime2), CAST(N'2024-05-23T15:44:50.7433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T15:44:50.8233333' AS DateTime2), CAST(N'2024-05-23T15:44:50.8233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T16:04:36.2633333' AS DateTime2), CAST(N'2024-05-23T16:04:36.2633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T16:04:36.4966667' AS DateTime2), CAST(N'2024-05-23T16:04:36.4966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T16:04:36.5566667' AS DateTime2), CAST(N'2024-05-23T16:04:36.5566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T16:04:36.6600000' AS DateTime2), CAST(N'2024-05-23T16:04:36.6600000' AS DateTime2))
GO
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T16:04:36.6600000' AS DateTime2), CAST(N'2024-05-23T16:04:36.6600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:09:25.7033333' AS DateTime2), CAST(N'2024-05-23T16:09:25.7033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T16:21:07.2033333' AS DateTime2), CAST(N'2024-05-23T16:21:07.2033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:21:32.0433333' AS DateTime2), CAST(N'2024-05-23T16:21:32.0433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T16:21:32.1466667' AS DateTime2), CAST(N'2024-05-23T16:21:32.1466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:25:38.0800000' AS DateTime2), CAST(N'2024-05-23T16:25:38.0800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T16:27:57.9466667' AS DateTime2), CAST(N'2024-05-23T16:27:57.9466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:27:57.9733333' AS DateTime2), CAST(N'2024-05-23T16:27:57.9733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T16:30:26.0033333' AS DateTime2), CAST(N'2024-05-23T16:30:26.0033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:30:26.0200000' AS DateTime2), CAST(N'2024-05-23T16:30:26.0200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T16:31:42.7133333' AS DateTime2), CAST(N'2024-05-23T16:31:42.7133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:31:42.7233333' AS DateTime2), CAST(N'2024-05-23T16:31:42.7233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T16:35:29.0033333' AS DateTime2), CAST(N'2024-05-23T16:35:29.0033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T16:35:29.0166667' AS DateTime2), CAST(N'2024-05-23T16:35:29.0166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T16:35:50.6233333' AS DateTime2), CAST(N'2024-05-23T16:35:50.6233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:36:08.6600000' AS DateTime2), CAST(N'2024-05-23T16:36:08.6600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T16:36:08.7400000' AS DateTime2), CAST(N'2024-05-23T16:36:08.7400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T16:43:49.9266667' AS DateTime2), CAST(N'2024-05-23T16:43:49.9266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T13:09:39.6333333' AS DateTime2), CAST(N'2024-05-23T13:09:39.6333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T13:09:39.6400000' AS DateTime2), CAST(N'2024-05-23T13:09:39.6400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:11:03.2733333' AS DateTime2), CAST(N'2024-05-23T13:11:03.2733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:11:03.2766667' AS DateTime2), CAST(N'2024-05-23T13:11:03.2766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T13:18:58.7266667' AS DateTime2), CAST(N'2024-05-23T13:18:58.7266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T13:18:58.7333333' AS DateTime2), CAST(N'2024-05-23T13:18:58.7333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:19:14.5733333' AS DateTime2), CAST(N'2024-05-23T13:19:14.5733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:19:14.6700000' AS DateTime2), CAST(N'2024-05-23T13:19:14.6700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T13:19:48.3466667' AS DateTime2), CAST(N'2024-05-23T13:19:48.3466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T13:20:58.0933333' AS DateTime2), CAST(N'2024-05-23T13:20:58.0933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T13:20:58.1000000' AS DateTime2), CAST(N'2024-05-23T13:20:58.1000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:24:02.9000000' AS DateTime2), CAST(N'2024-05-23T13:24:02.9000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:24:03.0366667' AS DateTime2), CAST(N'2024-05-23T13:24:03.0366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:24:03.0500000' AS DateTime2), CAST(N'2024-05-23T13:24:03.0500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:25:15.0500000' AS DateTime2), CAST(N'2024-05-23T13:25:15.0500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:25:15.1000000' AS DateTime2), CAST(N'2024-05-23T13:25:15.1000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:27:08.8400000' AS DateTime2), CAST(N'2024-05-23T13:27:08.8400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:27:08.8800000' AS DateTime2), CAST(N'2024-05-23T13:27:08.8800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:27:08.9633333' AS DateTime2), CAST(N'2024-05-23T13:27:08.9633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.3000000' AS DateTime2), CAST(N'2024-05-23T13:30:46.3000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.3300000' AS DateTime2), CAST(N'2024-05-23T13:30:46.3300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:30:46.3433333' AS DateTime2), CAST(N'2024-05-23T13:30:46.3433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:31.3400000' AS DateTime2), CAST(N'2024-05-23T13:35:31.3400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:35:31.3533333' AS DateTime2), CAST(N'2024-05-23T13:35:31.3533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.5300000' AS DateTime2), CAST(N'2024-05-23T13:39:51.5300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.6066667' AS DateTime2), CAST(N'2024-05-23T13:39:51.6066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8166667' AS DateTime2), CAST(N'2024-05-23T13:39:51.8166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8333333' AS DateTime2), CAST(N'2024-05-23T13:39:51.8333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8700000' AS DateTime2), CAST(N'2024-05-23T13:39:51.8700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8833333' AS DateTime2), CAST(N'2024-05-23T13:39:51.8833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.8900000' AS DateTime2), CAST(N'2024-05-23T13:39:51.8900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T13:39:51.9466667' AS DateTime2), CAST(N'2024-05-23T13:39:51.9466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T13:45:27.1000000' AS DateTime2), CAST(N'2024-05-23T13:45:27.1000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T13:45:27.1266667' AS DateTime2), CAST(N'2024-05-23T13:45:27.1266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetRoles', N'INSERT', CAST(N'2024-05-23T14:33:26.3900000' AS DateTime2), CAST(N'2024-05-23T14:33:26.3900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetRoles', N'INSERT', CAST(N'2024-05-23T14:33:26.4366667' AS DateTime2), CAST(N'2024-05-23T14:33:26.4366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetRoles', N'INSERT', CAST(N'2024-05-23T14:33:26.4400000' AS DateTime2), CAST(N'2024-05-23T14:33:26.4400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T15:03:58.4633333' AS DateTime2), CAST(N'2024-05-23T15:03:58.4633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T15:05:40.0133333' AS DateTime2), CAST(N'2024-05-23T15:05:40.0133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T15:19:08.1200000' AS DateTime2), CAST(N'2024-05-23T15:19:08.1200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T15:19:09.2533333' AS DateTime2), CAST(N'2024-05-23T15:19:09.2533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T15:19:09.3366667' AS DateTime2), CAST(N'2024-05-23T15:19:09.3366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T15:19:09.5033333' AS DateTime2), CAST(N'2024-05-23T15:19:09.5033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T15:19:09.5066667' AS DateTime2), CAST(N'2024-05-23T15:19:09.5066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'UPDATE', CAST(N'2024-05-23T15:20:29.2900000' AS DateTime2), CAST(N'2024-05-23T15:20:29.2900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T15:23:47.3766667' AS DateTime2), CAST(N'2024-05-23T15:23:47.3766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T15:24:44.0900000' AS DateTime2), CAST(N'2024-05-23T15:24:44.0900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T15:25:06.3066667' AS DateTime2), CAST(N'2024-05-23T15:25:06.3066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T15:31:00.9500000' AS DateTime2), CAST(N'2024-05-23T15:31:00.9500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T15:31:00.9700000' AS DateTime2), CAST(N'2024-05-23T15:31:00.9700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T15:32:48.1000000' AS DateTime2), CAST(N'2024-05-23T15:32:48.1000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T15:32:48.2666667' AS DateTime2), CAST(N'2024-05-23T15:32:48.2666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T15:32:48.2833333' AS DateTime2), CAST(N'2024-05-23T15:32:48.2833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T15:32:48.3133333' AS DateTime2), CAST(N'2024-05-23T15:32:48.3133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T15:32:48.3166667' AS DateTime2), CAST(N'2024-05-23T15:32:48.3166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T16:05:52.3833333' AS DateTime2), CAST(N'2024-05-23T16:05:52.3833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:09:38.6300000' AS DateTime2), CAST(N'2024-05-23T16:09:38.6300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T16:12:28.1333333' AS DateTime2), CAST(N'2024-05-23T16:12:28.1333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T16:12:28.1600000' AS DateTime2), CAST(N'2024-05-23T16:12:28.1600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T16:31:51.4100000' AS DateTime2), CAST(N'2024-05-23T16:31:51.4100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T16:32:05.1566667' AS DateTime2), CAST(N'2024-05-23T16:32:05.1566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-23T16:32:05.1566667' AS DateTime2), CAST(N'2024-05-23T16:32:05.1566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:32:05.1566667' AS DateTime2), CAST(N'2024-05-23T16:32:05.1566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T16:34:01.2633333' AS DateTime2), CAST(N'2024-05-23T16:34:01.2633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:34:01.2766667' AS DateTime2), CAST(N'2024-05-23T16:34:01.2766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-23T16:34:21.5566667' AS DateTime2), CAST(N'2024-05-23T16:34:21.5566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T16:34:32.1833333' AS DateTime2), CAST(N'2024-05-23T16:34:32.1833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-23T16:34:32.1900000' AS DateTime2), CAST(N'2024-05-23T16:34:32.1900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:34:32.1900000' AS DateTime2), CAST(N'2024-05-23T16:34:32.1900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T16:34:39.0166667' AS DateTime2), CAST(N'2024-05-23T16:34:39.0166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-23T16:34:39.0200000' AS DateTime2), CAST(N'2024-05-23T16:34:39.0200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:34:39.0200000' AS DateTime2), CAST(N'2024-05-23T16:34:39.0200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T16:38:09.1366667' AS DateTime2), CAST(N'2024-05-23T16:38:09.1366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T16:38:09.1500000' AS DateTime2), CAST(N'2024-05-23T16:38:09.1500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:44:16.0833333' AS DateTime2), CAST(N'2024-05-23T16:44:16.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T16:44:16.1100000' AS DateTime2), CAST(N'2024-05-23T16:44:16.1100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T16:44:32.0100000' AS DateTime2), CAST(N'2024-05-23T16:44:32.0100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T16:44:32.0200000' AS DateTime2), CAST(N'2024-05-23T16:44:32.0200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T16:45:03.0666667' AS DateTime2), CAST(N'2024-05-23T16:45:03.0666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T16:43:49.9400000' AS DateTime2), CAST(N'2024-05-23T16:43:49.9400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T16:44:02.2633333' AS DateTime2), CAST(N'2024-05-23T16:44:02.2633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T16:45:22.4433333' AS DateTime2), CAST(N'2024-05-23T16:45:22.4433333' AS DateTime2))
GO
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T16:45:22.4533333' AS DateTime2), CAST(N'2024-05-23T16:45:22.4533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T17:51:39.4966667' AS DateTime2), CAST(N'2024-05-23T17:51:39.4966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T17:51:39.5300000' AS DateTime2), CAST(N'2024-05-23T17:51:39.5300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T17:51:50.0300000' AS DateTime2), CAST(N'2024-05-23T17:51:50.0300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T17:52:08.8333333' AS DateTime2), CAST(N'2024-05-23T17:52:08.8333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T17:52:08.9100000' AS DateTime2), CAST(N'2024-05-23T17:52:08.9100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T17:52:21.3633333' AS DateTime2), CAST(N'2024-05-23T17:52:21.3633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-23T17:52:21.3700000' AS DateTime2), CAST(N'2024-05-23T17:52:21.3700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T17:52:21.3700000' AS DateTime2), CAST(N'2024-05-23T17:52:21.3700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-23T17:52:35.1500000' AS DateTime2), CAST(N'2024-05-23T17:52:35.1500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-23T17:52:35.1600000' AS DateTime2), CAST(N'2024-05-23T17:52:35.1600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-23T17:54:15.6100000' AS DateTime2), CAST(N'2024-05-23T17:54:15.6100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-23T17:54:15.6233333' AS DateTime2), CAST(N'2024-05-23T17:54:15.6233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:09:44.5066667' AS DateTime2), CAST(N'2024-05-30T19:09:44.5066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:16:16.2800000' AS DateTime2), CAST(N'2024-05-30T19:16:16.2800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:16:31.1666667' AS DateTime2), CAST(N'2024-05-30T19:16:31.1666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:16:39.3133333' AS DateTime2), CAST(N'2024-05-30T19:16:39.3133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:29:31.1500000' AS DateTime2), CAST(N'2024-05-30T19:29:31.1500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:29:39.1266667' AS DateTime2), CAST(N'2024-05-30T19:29:39.1266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:29:56.3633333' AS DateTime2), CAST(N'2024-05-30T19:29:56.3633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-30T19:30:08.4200000' AS DateTime2), CAST(N'2024-05-30T19:30:08.4200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-30T19:30:08.4433333' AS DateTime2), CAST(N'2024-05-30T19:30:08.4433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:30:39.3733333' AS DateTime2), CAST(N'2024-05-30T19:30:39.3733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:31:01.4600000' AS DateTime2), CAST(N'2024-05-30T19:31:01.4600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-30T19:31:01.5333333' AS DateTime2), CAST(N'2024-05-30T19:31:01.5333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-30T19:31:54.2900000' AS DateTime2), CAST(N'2024-05-30T19:31:54.2900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-30T19:31:54.2933333' AS DateTime2), CAST(N'2024-05-30T19:31:54.2933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-30T19:32:03.0833333' AS DateTime2), CAST(N'2024-05-30T19:32:03.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-30T19:32:03.0833333' AS DateTime2), CAST(N'2024-05-30T19:32:03.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-30T19:32:03.0833333' AS DateTime2), CAST(N'2024-05-30T19:32:03.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-30T19:32:27.6766667' AS DateTime2), CAST(N'2024-05-30T19:32:27.6766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-30T19:32:27.6833333' AS DateTime2), CAST(N'2024-05-30T19:32:27.6833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-30T19:32:35.9866667' AS DateTime2), CAST(N'2024-05-30T19:32:35.9866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-30T19:32:40.5600000' AS DateTime2), CAST(N'2024-05-30T19:32:40.5600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:33:09.1200000' AS DateTime2), CAST(N'2024-05-30T19:33:09.1200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:33:17.5433333' AS DateTime2), CAST(N'2024-05-30T19:33:17.5433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-30T19:34:43.5266667' AS DateTime2), CAST(N'2024-05-30T19:34:43.5266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-30T19:34:43.7266667' AS DateTime2), CAST(N'2024-05-30T19:34:43.7266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-30T19:34:43.7533333' AS DateTime2), CAST(N'2024-05-30T19:34:43.7533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-30T19:34:43.8766667' AS DateTime2), CAST(N'2024-05-30T19:34:43.8766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-30T19:34:43.8766667' AS DateTime2), CAST(N'2024-05-30T19:34:43.8766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:35:03.4233333' AS DateTime2), CAST(N'2024-05-30T19:35:03.4233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-17T21:34:29.3700000' AS DateTime2), CAST(N'2024-06-17T21:34:29.3700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-06-17T21:35:55.6000000' AS DateTime2), CAST(N'2024-06-17T21:35:55.6000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-17T21:35:55.9100000' AS DateTime2), CAST(N'2024-06-17T21:35:55.9100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-06-17T21:35:56.0566667' AS DateTime2), CAST(N'2024-06-17T21:35:56.0566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-17T21:35:56.0600000' AS DateTime2), CAST(N'2024-06-17T21:35:56.0600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-17T21:36:16.2400000' AS DateTime2), CAST(N'2024-06-17T21:36:16.2400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-06-19T11:19:00.3166667' AS DateTime2), CAST(N'2024-06-19T11:19:00.3166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-06-19T11:19:00.3266667' AS DateTime2), CAST(N'2024-06-19T11:19:00.3266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-19T11:19:15.2233333' AS DateTime2), CAST(N'2024-06-19T11:19:15.2233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-19T11:19:34.2433333' AS DateTime2), CAST(N'2024-06-19T11:19:34.2433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-19T11:19:34.2866667' AS DateTime2), CAST(N'2024-06-19T11:19:34.2866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-19T11:20:07.0000000' AS DateTime2), CAST(N'2024-06-19T11:20:07.0000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-19T11:21:25.5833333' AS DateTime2), CAST(N'2024-06-19T11:21:25.5833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-19T11:21:25.5866667' AS DateTime2), CAST(N'2024-06-19T11:21:25.5866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-19T11:21:25.5900000' AS DateTime2), CAST(N'2024-06-19T11:21:25.5900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-19T11:23:11.3500000' AS DateTime2), CAST(N'2024-06-19T11:23:11.3500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-06-19T13:04:34.3666667' AS DateTime2), CAST(N'2024-06-19T13:04:34.3666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-19T13:04:34.4133333' AS DateTime2), CAST(N'2024-06-19T13:04:34.4133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-19T13:04:45.3366667' AS DateTime2), CAST(N'2024-06-19T13:04:45.3366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-19T13:04:45.3400000' AS DateTime2), CAST(N'2024-06-19T13:04:45.3400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-19T13:04:50.1633333' AS DateTime2), CAST(N'2024-06-19T13:04:50.1633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-19T13:04:50.1633333' AS DateTime2), CAST(N'2024-06-19T13:04:50.1633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-23T17:53:55.4300000' AS DateTime2), CAST(N'2024-05-23T17:53:55.4300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-23T17:53:55.7666667' AS DateTime2), CAST(N'2024-05-23T17:53:55.7666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T17:53:55.8000000' AS DateTime2), CAST(N'2024-05-23T17:53:55.8000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-23T17:53:55.8933333' AS DateTime2), CAST(N'2024-05-23T17:53:55.8933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-23T17:53:55.8966667' AS DateTime2), CAST(N'2024-05-23T17:53:55.8966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-23T17:54:30.1933333' AS DateTime2), CAST(N'2024-05-23T17:54:30.1933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-23T17:54:44.5800000' AS DateTime2), CAST(N'2024-05-23T17:54:44.5800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-23T17:54:44.5933333' AS DateTime2), CAST(N'2024-05-23T17:54:44.5933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-05-30T19:20:08.9166667' AS DateTime2), CAST(N'2024-05-30T19:20:08.9166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-05-30T19:20:09.3566667' AS DateTime2), CAST(N'2024-05-30T19:20:09.3566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-30T19:20:09.4366667' AS DateTime2), CAST(N'2024-05-30T19:20:09.4366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-05-30T19:20:09.5800000' AS DateTime2), CAST(N'2024-05-30T19:20:09.5800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-05-30T19:20:09.5833333' AS DateTime2), CAST(N'2024-05-30T19:20:09.5833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:20:32.1800000' AS DateTime2), CAST(N'2024-05-30T19:20:32.1800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:33:30.4200000' AS DateTime2), CAST(N'2024-05-30T19:33:30.4200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-05-30T19:41:22.7466667' AS DateTime2), CAST(N'2024-05-30T19:41:22.7466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-05-30T19:41:22.7500000' AS DateTime2), CAST(N'2024-05-30T19:41:22.7500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:41:31.6633333' AS DateTime2), CAST(N'2024-05-30T19:41:31.6633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-05-30T19:42:18.0066667' AS DateTime2), CAST(N'2024-05-30T19:42:18.0066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-30T19:42:18.0200000' AS DateTime2), CAST(N'2024-05-30T19:42:18.0200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-30T19:42:46.5400000' AS DateTime2), CAST(N'2024-05-30T19:42:46.5400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-30T19:42:46.5400000' AS DateTime2), CAST(N'2024-05-30T19:42:46.5400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-05-30T19:42:46.5400000' AS DateTime2), CAST(N'2024-05-30T19:42:46.5400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-05-30T19:43:13.8133333' AS DateTime2), CAST(N'2024-05-30T19:43:13.8133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-06-17T21:35:55.8500000' AS DateTime2), CAST(N'2024-06-17T21:35:55.8500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-19T11:22:13.3300000' AS DateTime2), CAST(N'2024-06-19T11:22:13.3300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-19T11:22:13.3366667' AS DateTime2), CAST(N'2024-06-19T11:22:13.3366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-19T11:22:13.3366667' AS DateTime2), CAST(N'2024-06-19T11:22:13.3366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-06-20T09:37:08.2200000' AS DateTime2), CAST(N'2024-06-20T09:37:08.2200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-06-20T09:37:08.4500000' AS DateTime2), CAST(N'2024-06-20T09:37:08.4500000' AS DateTime2))
GO
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-20T09:37:08.5000000' AS DateTime2), CAST(N'2024-06-20T09:37:08.5000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-06-20T09:37:08.5600000' AS DateTime2), CAST(N'2024-06-20T09:37:08.5600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-20T09:37:08.5600000' AS DateTime2), CAST(N'2024-06-20T09:37:08.5600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-06-20T09:37:27.0066667' AS DateTime2), CAST(N'2024-06-20T09:37:27.0066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-06-20T09:37:27.0233333' AS DateTime2), CAST(N'2024-06-20T09:37:27.0233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-20T09:37:46.0966667' AS DateTime2), CAST(N'2024-06-20T09:37:46.0966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-20T09:38:03.3600000' AS DateTime2), CAST(N'2024-06-20T09:38:03.3600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-20T09:38:03.4000000' AS DateTime2), CAST(N'2024-06-20T09:38:03.4000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-20T09:38:37.2500000' AS DateTime2), CAST(N'2024-06-20T09:38:37.2500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-06-20T09:39:37.9966667' AS DateTime2), CAST(N'2024-06-20T09:39:37.9966667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-20T09:39:38.0133333' AS DateTime2), CAST(N'2024-06-20T09:39:38.0133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-06-20T09:40:09.4166667' AS DateTime2), CAST(N'2024-06-20T09:40:09.4166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-20T09:41:14.6333333' AS DateTime2), CAST(N'2024-06-20T09:41:14.6333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-20T09:41:39.3933333' AS DateTime2), CAST(N'2024-06-20T09:41:39.3933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-06-20T16:26:01.4333333' AS DateTime2), CAST(N'2024-06-20T16:26:01.4333333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-06-20T16:26:01.6166667' AS DateTime2), CAST(N'2024-06-20T16:26:01.6166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-20T16:26:01.6500000' AS DateTime2), CAST(N'2024-06-20T16:26:01.6500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-06-20T16:26:01.7400000' AS DateTime2), CAST(N'2024-06-20T16:26:01.7400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-20T16:26:01.7400000' AS DateTime2), CAST(N'2024-06-20T16:26:01.7400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-20T16:28:17.0533333' AS DateTime2), CAST(N'2024-06-20T16:28:17.0533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-06-20T16:29:21.4533333' AS DateTime2), CAST(N'2024-06-20T16:29:21.4533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-20T16:29:37.3166667' AS DateTime2), CAST(N'2024-06-20T16:29:37.3166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-20T16:29:37.3200000' AS DateTime2), CAST(N'2024-06-20T16:29:37.3200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-20T16:29:37.3200000' AS DateTime2), CAST(N'2024-06-20T16:29:37.3200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-06-21T13:48:15.2566667' AS DateTime2), CAST(N'2024-06-21T13:48:15.2566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-06-21T13:48:15.4566667' AS DateTime2), CAST(N'2024-06-21T13:48:15.4566667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-21T13:48:15.4900000' AS DateTime2), CAST(N'2024-06-21T13:48:15.4900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-06-21T13:48:15.5500000' AS DateTime2), CAST(N'2024-06-21T13:48:15.5500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-21T13:48:15.5500000' AS DateTime2), CAST(N'2024-06-21T13:48:15.5500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-06-21T13:48:20.3300000' AS DateTime2), CAST(N'2024-06-21T13:48:20.3300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-06-21T13:48:20.3433333' AS DateTime2), CAST(N'2024-06-21T13:48:20.3433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-21T13:48:52.3600000' AS DateTime2), CAST(N'2024-06-21T13:48:52.3600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-21T13:49:12.0200000' AS DateTime2), CAST(N'2024-06-21T13:49:12.0200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-21T13:49:12.0600000' AS DateTime2), CAST(N'2024-06-21T13:49:12.0600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-21T13:49:38.8133333' AS DateTime2), CAST(N'2024-06-21T13:49:38.8133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-21T13:49:54.8933333' AS DateTime2), CAST(N'2024-06-21T13:49:54.8933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-21T13:50:13.1733333' AS DateTime2), CAST(N'2024-06-21T13:50:13.1733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-06-21T14:22:30.2500000' AS DateTime2), CAST(N'2024-06-21T14:22:30.2500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-21T14:22:30.2700000' AS DateTime2), CAST(N'2024-06-21T14:22:30.2700000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-06-21T14:22:42.4300000' AS DateTime2), CAST(N'2024-06-21T14:22:42.4300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:33:53.1500000' AS DateTime2), CAST(N'2024-05-30T19:33:53.1500000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-20T09:39:51.7800000' AS DateTime2), CAST(N'2024-06-20T09:39:51.7800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-20T09:39:51.7866667' AS DateTime2), CAST(N'2024-06-20T09:39:51.7866667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-20T09:39:55.6366667' AS DateTime2), CAST(N'2024-06-20T09:39:55.6366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-20T09:39:55.6400000' AS DateTime2), CAST(N'2024-06-20T09:39:55.6400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-20T09:40:22.0833333' AS DateTime2), CAST(N'2024-06-20T09:40:22.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-20T09:40:22.0833333' AS DateTime2), CAST(N'2024-06-20T09:40:22.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-20T09:40:22.0833333' AS DateTime2), CAST(N'2024-06-20T09:40:22.0833333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:40:58.6533333' AS DateTime2), CAST(N'2024-05-30T19:40:58.6533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-05-30T19:41:10.9633333' AS DateTime2), CAST(N'2024-05-30T19:41:10.9633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:41:43.7233333' AS DateTime2), CAST(N'2024-05-30T19:41:43.7233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-30T19:41:43.7300000' AS DateTime2), CAST(N'2024-05-30T19:41:43.7300000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-05-30T19:42:28.8233333' AS DateTime2), CAST(N'2024-05-30T19:42:28.8233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-05-30T19:42:28.8233333' AS DateTime2), CAST(N'2024-05-30T19:42:28.8233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-05-30T19:43:08.9133333' AS DateTime2), CAST(N'2024-05-30T19:43:08.9133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:43:24.8066667' AS DateTime2), CAST(N'2024-05-30T19:43:24.8066667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-05-30T19:43:45.9766667' AS DateTime2), CAST(N'2024-05-30T19:43:45.9766667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-06-19T11:18:27.4133333' AS DateTime2), CAST(N'2024-06-19T11:18:27.4133333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-06-19T11:18:27.6033333' AS DateTime2), CAST(N'2024-06-19T11:18:27.6033333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-19T11:18:27.6400000' AS DateTime2), CAST(N'2024-06-19T11:18:27.6400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-06-19T11:18:27.6900000' AS DateTime2), CAST(N'2024-06-19T11:18:27.6900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-19T11:18:27.6933333' AS DateTime2), CAST(N'2024-06-19T11:18:27.6933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-06-19T11:21:12.8000000' AS DateTime2), CAST(N'2024-06-19T11:21:12.8000000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-19T11:21:12.8100000' AS DateTime2), CAST(N'2024-06-19T11:21:12.8100000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'INSERT', CAST(N'2024-06-19T11:21:51.1166667' AS DateTime2), CAST(N'2024-06-19T11:21:51.1166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductCategories', N'UPDATE', CAST(N'2024-06-19T11:22:00.3666667' AS DateTime2), CAST(N'2024-06-19T11:22:00.3666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-06-20T16:26:20.2466667' AS DateTime2), CAST(N'2024-06-20T16:26:20.2466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-06-20T16:26:20.2600000' AS DateTime2), CAST(N'2024-06-20T16:26:20.2600000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-20T16:26:50.4366667' AS DateTime2), CAST(N'2024-06-20T16:26:50.4366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-20T16:27:06.9800000' AS DateTime2), CAST(N'2024-06-20T16:27:06.9800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-20T16:27:07.0266667' AS DateTime2), CAST(N'2024-06-20T16:27:07.0266667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-20T16:27:46.7400000' AS DateTime2), CAST(N'2024-06-20T16:27:46.7400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-06-20T16:29:01.4800000' AS DateTime2), CAST(N'2024-06-20T16:29:01.4800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-20T16:29:01.4933333' AS DateTime2), CAST(N'2024-06-20T16:29:01.4933333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-20T16:30:09.5666667' AS DateTime2), CAST(N'2024-06-20T16:30:09.5666667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'INSERT', CAST(N'2024-06-21T10:20:04.0533333' AS DateTime2), CAST(N'2024-06-21T10:20:04.0533333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-21T10:20:04.0900000' AS DateTime2), CAST(N'2024-06-21T10:20:04.0900000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-21T10:20:11.7733333' AS DateTime2), CAST(N'2024-06-21T10:20:11.7733333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'UPDATE', CAST(N'2024-06-21T10:20:11.7800000' AS DateTime2), CAST(N'2024-06-21T10:20:11.7800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsProductCategories', N'INSERT', CAST(N'2024-06-21T10:20:11.7800000' AS DateTime2), CAST(N'2024-06-21T10:20:11.7800000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'INSERT', CAST(N'2024-06-21T14:17:33.8166667' AS DateTime2), CAST(N'2024-06-21T14:17:33.8166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'INSERT', CAST(N'2024-06-21T14:17:33.9400000' AS DateTime2), CAST(N'2024-06-21T14:17:33.9400000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-21T14:17:33.9633333' AS DateTime2), CAST(N'2024-06-21T14:17:33.9633333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUserRoles', N'INSERT', CAST(N'2024-06-21T14:17:34.0166667' AS DateTime2), CAST(N'2024-06-21T14:17:34.0166667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'AspNetUsers', N'UPDATE', CAST(N'2024-06-21T14:17:34.0233333' AS DateTime2), CAST(N'2024-06-21T14:17:34.0233333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'INSERT', CAST(N'2024-06-21T14:18:16.8366667' AS DateTime2), CAST(N'2024-06-21T14:18:16.8366667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'ProductsOrders', N'INSERT', CAST(N'2024-06-21T14:18:16.8466667' AS DateTime2), CAST(N'2024-06-21T14:18:16.8466667' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-21T14:18:57.2433333' AS DateTime2), CAST(N'2024-06-21T14:18:57.2433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-21T14:19:34.4200000' AS DateTime2), CAST(N'2024-06-21T14:19:34.4200000' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Products', N'UPDATE', CAST(N'2024-06-21T14:19:34.4433333' AS DateTime2), CAST(N'2024-06-21T14:19:34.4433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Orders', N'UPDATE', CAST(N'2024-06-21T14:20:24.7433333' AS DateTime2), CAST(N'2024-06-21T14:20:24.7433333' AS DateTime2))
INSERT [20114101].[log_20114101] ([TableName], [Operation], [OperationTime], [Updated_20114101]) VALUES (N'Customers', N'UPDATE', CAST(N'2024-06-21T14:23:10.7433333' AS DateTime2), CAST(N'2024-06-21T14:23:10.7433333' AS DateTime2))
GO
SET IDENTITY_INSERT [20114101].[ProductCategories] ON 

INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (12, N'Samsung', CAST(N'2024-05-23T12:23:56.1514351' AS DateTime2))
INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (13, N'Apple', CAST(N'2024-05-23T12:25:02.1308932' AS DateTime2))
INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (14, N'Xiaomi', CAST(N'2024-05-23T12:24:44.0911767' AS DateTime2))
INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (15, N'IOS', CAST(N'2024-05-23T12:25:06.3091469' AS DateTime2))
INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (16, N'Huawei', CAST(N'2024-05-23T13:31:51.4008755' AS DateTime2))
INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (17, N'Harmony OS', CAST(N'2024-05-23T13:34:21.5560787' AS DateTime2))
INSERT [20114101].[ProductCategories] ([Id], [Name], [Updated_20114101]) VALUES (23, N'Iphonr14', CAST(N'2024-06-21T11:22:42.4285390' AS DateTime2))
SET IDENTITY_INSERT [20114101].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [20114101].[Products] ON 

INSERT [20114101].[Products] ([Id], [Name], [Price], [Description], [Quantity], [Updated_20114101]) VALUES (8, N'Samsung Galaxy Note 9', CAST(700 AS Decimal(18, 0)), N'Body 	Dimensions 	161.9 x 76.4 x 8.8 mm (6.37 x 3.01 x 0.35 in)
Weight 	201 g (7.09 oz)
Build 	Glass front (Gorilla Glass 5), glass back (Gorilla Glass 5), aluminum frame
SIM 	Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)
 	IP68 dust/water resistant (up to 1.5m for 30 min)
Stylus (Bluetooth integration)
Display 	Type 	Super AMOLED, HDR10
Size 	6.4 inches, 103.2 cm2 (~83.4% screen-to-body ratio)
Resolution 	1440 x 2960 pixels, 18.5:9 ratio (~516 ppi density)
Protection 	Corning Gorilla Glass 5
 	Always-on display
Platform 	OS 	Android 8.1 (Oreo), upgradable to Android 10, One UI 2.5
Chipset 	Exynos 9810 (10 nm) - EMEA
Qualcomm SDM845 Snapdragon 845 (10 nm) - USA/LATAM, China
CPU 	Octa-core (4x2.7 GHz Mongoose M3 & 4x1.8 GHz Cortex-A55) - EMEA
Octa-core (4x2.8 GHz Kryo 385 Gold & 4x1.7 GHz Kryo 385 Silver) - USA/LATAM, China
GPU 	Mali-G72 MP18 - EMEA
Adreno 630 - USA/LATAM, China
Memory 	Card slot 	microSDXC (uses shared SIM slot)
Internal 	128GB 6GB RAM, 128GB 8GB RAM, 512GB 8GB RAM
 	UFS 2.1', 4990, CAST(N'2024-06-21T11:19:34.4415003' AS DateTime2))
INSERT [20114101].[Products] ([Id], [Name], [Price], [Description], [Quantity], [Updated_20114101]) VALUES (9, N'Xiaomi 13T Pro', CAST(1300 AS Decimal(18, 0)), N'Body 	Dimensions 	162.2 x 75.7 x 8.5 mm (6.39 x 2.98 x 0.33 in)
Weight 	200 g or 206 g (7.05 oz)
Build 	Glass front (Gorilla Glass 5), glass back or silicone polymer back, plastic frame
SIM 	Nano-SIM and eSIM or Dual SIM (Nano-SIM, dual stand-by)
 	IP68 dust/water resistant (up to 1.5m for 30 min)
Display 	Type 	AMOLED, 68B colors, 144Hz, Dolby Vision, HDR10+, 1200 nits (HBM), 2600 nits (peak)
Size 	6.67 inches, 107.4 cm2 (~87.5% screen-to-body ratio)
Resolution 	1220 x 2712 pixels, 20:9 ratio (~446 ppi density)
Protection 	Corning Gorilla Glass 5
Platform 	OS 	Android 13, upgradable to Android 14, HyperOS
Chipset 	Mediatek Dimensity 9200+ (4 nm)
CPU 	Octa-core (1x3.35 GHz Cortex-X3 & 3x3.0 GHz Cortex-A715 & 4x2.0 GHz Cortex-A510)
GPU 	Immortalis-G715 MC11
Memory 	Card slot 	No
Internal 	256GB 12GB RAM, 512GB 12GB RAM, 1TB 16GB RAM
 	UFS 4.0', 1996, CAST(N'2024-06-20T06:38:03.4014173' AS DateTime2))
INSERT [20114101].[Products] ([Id], [Name], [Price], [Description], [Quantity], [Updated_20114101]) VALUES (10, N'Huawei P60 Pro', CAST(2000 AS Decimal(18, 0)), N'Body 	Dimensions 	161 x 74.5 x 8.3 mm (6.34 x 2.93 x 0.33 in)
Weight 	200 g (7.05 oz)
SIM 	Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)
 	IP68 dust/water resistant (up to 1.5m for 30 min)
Display 	Type 	LTPO OLED, 1B colors, 120Hz
Size 	6.67 inches, 107.7 cm2 (~89.8% screen-to-body ratio)
Resolution 	1220 x 2700 pixels (~444 ppi density)
Protection 	Kunlun Glass
Platform 	OS 	HarmonyOS 3.1 (China), EMUI 13.1 (Europe), no Google Play Services
Chipset 	Qualcomm SM8475 Snapdragon 8+ Gen 1 4G (4 nm)
CPU 	Octa-core (1x3.19 GHz Cortex-X2 & 3x2.75 GHz Cortex-A710 & 4x2.0 GHz Cortex-A510)
GPU 	Adreno 730
Memory 	Card slot 	NM (Nano Memory), up to 256GB (uses shared SIM slot)
Internal 	256GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM
 	UFS', 4997, CAST(N'2024-05-23T14:52:08.8986870' AS DateTime2))
INSERT [20114101].[Products] ([Id], [Name], [Price], [Description], [Quantity], [Updated_20114101]) VALUES (11, N'Huawei Mate 60 Pro', CAST(2100 AS Decimal(18, 0)), N'Body 	Dimensions 	162.2 x 75.7 x 8.5 mm (6.39 x 2.98 x 0.33 in)
Weight 	200 g or 206 g (7.05 oz)
Build 	Glass front (Gorilla Glass 5), glass back or silicone polymer back, plastic frame
SIM 	Nano-SIM and eSIM or Dual SIM (Nano-SIM, dual stand-by)
 	IP68 dust/water resistant (up to 1.5m for 30 min)
Display 	Type 	AMOLED, 68B colors, 144Hz, Dolby Vision, HDR10+, 1200 nits (HBM), 2600 nits (peak)
Size 	6.67 inches, 107.4 cm2 (~87.5% screen-to-body ratio)
Resolution 	1220 x 2712 pixels, 20:9 ratio (~446 ppi density)
Protection 	Corning Gorilla Glass 5
Platform 	OS 	Android 13, upgradable to Android 14, HyperOS
Chipset 	Mediatek Dimensity 9200+ (4 nm)
CPU 	Octa-core (1x3.35 GHz Cortex-X3 & 3x3.0 GHz Cortex-A715 & 4x2.0 GHz Cortex-A510)
GPU 	Immortalis-G715 MC11
Memory 	Card slot 	No
Internal 	256GB 12GB RAM, 512GB 12GB RAM, 1TB 16GB RAM
 	UFS 4.0
Main Camera 	Triple 	50 MP, f/1.9, 24mm (wide), 1/1.28", 1.22µm, PDAF, OIS
50 MP, f/1.9, 50mm (telephoto), 1/2.88", 0.61µm, PDAF, 2x optical zoom
12 MP, f/2.2, 15mm (ultrawide), 1/3.06", 1.12µm
Features 	Leica lens, LED flash, HDR, panorama
Video 	8K@24fps, 4K@24/30/60fps, 4K/1080p@30fps HDR10+, 1080p@30/60/120/240fps; 10-bit LOG, gyro-EIS
Selfie camera 	Single 	20 MP, f/2.2, (wide), 0.8µm
Features 	HDR
Video 	1080p@30fps, HDR10+', 5993, CAST(N'2024-06-20T13:27:07.0248114' AS DateTime2))
INSERT [20114101].[Products] ([Id], [Name], [Price], [Description], [Quantity], [Updated_20114101]) VALUES (12, N'Iphone 13 Pro', CAST(2600 AS Decimal(18, 0)), N'Body 	Dimensions 	146.7 x 71.5 x 7.7 mm (5.78 x 2.81 x 0.30 in)
Weight 	204 g (7.20 oz)
Build 	Glass front (Corning-made glass), glass back (Corning-made glass), stainless steel frame
SIM 	Nano-SIM and eSIM or Dual SIM (Nano-SIM, dual stand-by)
 	IP68 dust/water resistant (up to 6m for 30 min)
Apple Pay (Visa, MasterCard, AMEX certified)
Display 	Type 	Super Retina XDR OLED, 120Hz, HDR10, Dolby Vision, 1000 nits (HBM), 1200 nits (peak)
Size 	6.1 inches, 90.2 cm2 (~86.0% screen-to-body ratio)
Resolution 	1170 x 2532 pixels, 19.5:9 ratio (~460 ppi density)
Protection 	Ceramic Shield glass
Platform 	OS 	iOS 15, upgradable to iOS 17.5.1
Chipset 	Apple A15 Bionic (5 nm)
CPU 	Hexa-core (2x3.23 GHz Avalanche + 4x1.82 GHz Blizzard)
GPU 	Apple GPU (5-core graphics)
Memory 	Card slot 	No
Internal 	128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM, 1TB 6GB RAM
 	NVMe
Main Camera 	Triple 	12 MP, f/1.5, 26mm (wide), 1/1.7", 1.9µm, dual pixel PDAF, sensor-shift OIS
12 MP, f/2.8, 77mm (telephoto), PDAF, 1/3.4", 1.0µm, OIS, 3x optical zoom
12 MP, f/1.8, 13mm, 120˚ (ultrawide), 1/3.4", 1.0µm, PDAF
TOF 3D LiDAR scanner (depth)
Features 	Dual-LED dual-tone flash, HDR (photo/panorama)
Video 	4K@24/30/60fps, 1080p@30/60/120/240fps, 10‑bit HDR, Dolby Vision HDR (up to 60fps), ProRes, Cinematic mode (1080p@30fps), stereo sound rec.
Selfie camera 	Single 	12 MP, f/2.2, 23mm (wide), 1/3.6"
SL 3D, (depth/biometrics sensor)
Features 	HDR
Video 	4K@24/25/30/60fps, 1080p@30/60/120fps, gyro-EIS', 2998, CAST(N'2024-06-19T08:19:34.2787605' AS DateTime2))
SET IDENTITY_INSERT [20114101].[Products] OFF
GO
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (8, 12, CAST(N'2024-05-23T13:27:57.8981653' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (9, 14, CAST(N'2024-05-23T13:30:25.9975633' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (10, 16, CAST(N'2024-05-23T13:34:39.0071561' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (10, 17, CAST(N'2024-05-23T13:34:39.0071572' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (11, 12, CAST(N'2024-05-23T14:52:21.3534762' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (11, 16, CAST(N'2024-05-23T14:52:21.3533565' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (11, 17, CAST(N'2024-05-23T14:52:21.3534681' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (12, 13, CAST(N'2024-05-30T16:32:03.0766915' AS DateTime2))
INSERT [20114101].[ProductsProductCategories] ([ProductId], [ProductCategoryId], [Updated_20114101]) VALUES (12, 15, CAST(N'2024-05-30T16:32:03.0767166' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [20114101].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [20114101].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [20114101].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [20114101].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [20114101].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [20114101].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [20114101].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_Id_CustomerId]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Orders_Id_CustomerId] ON [20114101].[Orders]
(
	[Id] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductCategories_Id_Name]    Script Date: 30.6.2024 г. 2:46:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductCategories_Id_Name] ON [20114101].[ProductCategories]
(
	[Id] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [20114101].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [20114101].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [20114101].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [20114101].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [20114101].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [20114101].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [20114101].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [20114101].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [20114101].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [20114101].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [20114101].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [20114101].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [20114101].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [20114101].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [20114101].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [20114101].[ProductsOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductsOrders_Orders] FOREIGN KEY([OrderId])
REFERENCES [20114101].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[ProductsOrders] CHECK CONSTRAINT [FK_ProductsOrders_Orders]
GO
ALTER TABLE [20114101].[ProductsOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductsOrders_Products] FOREIGN KEY([ProductId])
REFERENCES [20114101].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[ProductsOrders] CHECK CONSTRAINT [FK_ProductsOrders_Products]
GO
ALTER TABLE [20114101].[ProductsProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductsProductCategories_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [20114101].[ProductCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[ProductsProductCategories] CHECK CONSTRAINT [FK_ProductsProductCategories_ProductCategories]
GO
ALTER TABLE [20114101].[ProductsProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductsProductCategories_Products] FOREIGN KEY([ProductId])
REFERENCES [20114101].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [20114101].[ProductsProductCategories] CHECK CONSTRAINT [FK_ProductsProductCategories_Products]
GO
/****** Object:  Trigger [20114101].[AspNetRoleClaimsInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [20114101].[AspNetRoleClaimsInsertUpdateLogger] 
   ON  [20114101].[AspNetRoleClaims]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetRoleClaims', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetRoleClaims] ENABLE TRIGGER [AspNetRoleClaimsInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[AspNetRolesInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[AspNetRolesInsertUpdateLogger] 
   ON  [20114101].[AspNetRoles]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetRoles', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetRoles] ENABLE TRIGGER [AspNetRolesInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[AspNetUserClaimsInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[AspNetUserClaimsInsertUpdateLogger] 
   ON  [20114101].[AspNetUserClaims]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetUserClaims', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetUserClaims] ENABLE TRIGGER [AspNetUserClaimsInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[AspNetUserLoginsInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[AspNetUserLoginsInsertUpdateLogger] 
   ON  [20114101].[AspNetUserLogins]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetUserLogins', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetUserLogins] ENABLE TRIGGER [AspNetUserLoginsInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[AspNetUserRolesInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[AspNetUserRolesInsertUpdateLogger] 
   ON  [20114101].[AspNetUserRoles]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetUserRoles', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetUserRoles] ENABLE TRIGGER [AspNetUserRolesInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[AspNetUsersInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[AspNetUsersInsertUpdateLogger] 
   ON  [20114101].[AspNetUsers]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetUsers', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetUsers] ENABLE TRIGGER [AspNetUsersInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[AspNetUserTokensInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[AspNetUserTokensInsertUpdateLogger] 
   ON  [20114101].[AspNetUserTokens]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('AspNetUserTokens', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[AspNetUserTokens] ENABLE TRIGGER [AspNetUserTokensInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[CustomersInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[CustomersInsertUpdateLogger] 
   ON  [20114101].[Customers]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('Customers', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[Customers] ENABLE TRIGGER [CustomersInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[OrdersInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[OrdersInsertUpdateLogger] 
   ON  [20114101].[Orders]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('Orders', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[Orders] ENABLE TRIGGER [OrdersInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[ProductCategoriesInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[ProductCategoriesInsertUpdateLogger] 
   ON  [20114101].[ProductCategories]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('ProductCategories', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[ProductCategories] ENABLE TRIGGER [ProductCategoriesInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[ProductsInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[ProductsInsertUpdateLogger] 
   ON  [20114101].[Products]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('Products', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[Products] ENABLE TRIGGER [ProductsInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[ProductsOrdersInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[ProductsOrdersInsertUpdateLogger] 
   ON  [20114101].[ProductsOrders]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('ProductsOrders', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[ProductsOrders] ENABLE TRIGGER [ProductsOrdersInsertUpdateLogger]
GO
/****** Object:  Trigger [20114101].[ProductsProductCategoriesInsertUpdateLogger]    Script Date: 30.6.2024 г. 2:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [20114101].[ProductsProductCategoriesInsertUpdateLogger] 
   ON  [20114101].[ProductsProductCategories]
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @action as nvarchar(50);

    SET @action = 'INSERT';
    IF EXISTS(SELECT * FROM DELETED)
    BEGIN
	IF EXISTS(SELECT * FROM INSERTED)
        SET @action =  'UPDATE' 
    END

	INSERT INTO [20114101].[log_20114101] (TableName, Operation, OperationTime, Updated_20114101)
	VALUES('ProductsProductCategories', @action, GETDATE(), GETDATE())

END
GO
ALTER TABLE [20114101].[ProductsProductCategories] ENABLE TRIGGER [ProductsProductCategoriesInsertUpdateLogger]
GO
USE [master]
GO
ALTER DATABASE [20114101] SET  READ_WRITE 
GO
