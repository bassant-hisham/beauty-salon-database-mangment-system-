USE [master]
GO
/****** Object:  Database [DBProject]    Script Date: 12/29/2022 4:47:47 AM ******/
CREATE DATABASE [DBProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBProject] SET RECOVERY FULL 
GO
ALTER DATABASE [DBProject] SET  MULTI_USER 
GO
ALTER DATABASE [DBProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBProject', N'ON'
GO
ALTER DATABASE [DBProject] SET QUERY_STORE = OFF
GO
USE [DBProject]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[NumberOfOrders] [int] NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[Name] [varchar](50) NOT NULL,
	[ID] [int] NOT NULL,
	[InMaintenance] [bit] NOT NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ProductName] [varchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[MinCapacity] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Type] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ID] [int] NOT NULL,
	[Cost] [int] NOT NULL,
	[TellerName] [varchar](50) NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[CompanyContact] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Type] ASC,
	[Name] ASC,
	[ID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintenance]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[DeviceName] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyContact] [varchar](50) NOT NULL,
	[Cost] [int] NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[DeviceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[NumberOfOrders] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[NumberOfOrders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cost] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TellerName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[CustomerName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[WorkerSSN] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[FinishTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceName] [varchar](50) NOT NULL,
	[ServiceDuration] [int] NOT NULL,
	[Price] [varchar](50) NOT NULL,
	[Discount] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesInOrder]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesInOrder](
	[OrderID] [int] NOT NULL,
	[ServiceName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ServicesInOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ServiceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[IsAdmin] [bit] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_SystemUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsedProductsInService]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsedProductsInService](
	[ServiceName] [varchar](50) NOT NULL,
	[UsedProduct] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UsedProductsInService] PRIMARY KEY CLUSTERED 
(
	[ServiceName] ASC,
	[UsedProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[Salary] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Monica', N'James', 2, N'01234757549', 1)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'ann', N'lee', 20, N'01523758436', 2)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Hana', N'Ahmed', 30, N'01236075444', 8)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Dina', N'Tarek', 9, N'01159637569', 9)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Hend', N'Mohamed', 5, N'01008567123', 10)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Niara', N'Ahmed', 24, N'01567952369', 11)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Malak', N'Hamed', 13, N'01011567686', 12)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Noha', N'Ismail', 3, N'01287968956', 13)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Mari', N'Wahid', 6, N'01005468999', 14)
INSERT [dbo].[Customer] ([FirstName], [LastName], [NumberOfOrders], [Phone], [ID]) VALUES (N'Aml', N'Nader', 7, N'01236899325', 15)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Hair dryer', 11, 1)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Hair dryer', 12, 1)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Hair dryer', 13, 1)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Hair dryer', 14, 1)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Hair dryer', 15, 0)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Curling iron', 21, 0)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Curling iron', 22, 0)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Straightening iron', 31, 0)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Straightening iron', 32, 0)
INSERT [dbo].[Devices] ([Name], [ID], [InMaintenance]) VALUES (N'Straightening iron', 33, 1)
GO
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Clay', 50, 25, 3)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Conditioner', 60, 20, 2)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Hair dyes', 110, 30, 5)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Hair oil', 80, 11, 2)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Hair powder', 90, 26, 6)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Hair serums', 120, 12, 2)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Hair spray', 150, 20, 2)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Lip balms', 30, 70, 10)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Nail polish', 20, 40, 6)
INSERT [dbo].[Inventory] ([ProductName], [Price], [Capacity], [MinCapacity]) VALUES (N'Shampoo', 40, 20, 2)
GO
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'maintenance ', N'Hair dryer ', 12, 50, N'amin', N'BestFix', N'01054646554', CAST(N'2022-11-29' AS Date))
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'maintenance ', N'Hair dryer ', 13, 50, N'amin', N'BestFix', N'01054646554', CAST(N'2022-10-28' AS Date))
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'maintenance', N'Hair dryer', 14, 50, N'amin', N'BestFix', N'01054646554', CAST(N'2022-12-28' AS Date))
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'Service', N'Hair Color', 26, 180, N'maria', N'BestSalon', N'01129665659', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'Service', N'Hair Mask', 20, 150, N'amin', N'BestSalon', N'01129665659', CAST(N'2022-12-29' AS Date))
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'Service', N'Hair Styling', 26, 200, N'maria', N'BestSalon', N'01129665659', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[Logs] ([Type], [Name], [ID], [Cost], [TellerName], [Company], [CompanyContact], [Date]) VALUES (N'Service', N'Haircut', 26, 100, N'maria', N'BestSalon', N'01129665659', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[Maintenance] ([DeviceName], [CompanyName], [CompanyContact], [Cost], [Duration]) VALUES (N'Curling iron', N'CurlingFixed', N'01122334455', 80, 2)
INSERT [dbo].[Maintenance] ([DeviceName], [CompanyName], [CompanyContact], [Cost], [Duration]) VALUES (N'Hair dryer', N'BestFix', N'01054646554', 50, 1)
INSERT [dbo].[Maintenance] ([DeviceName], [CompanyName], [CompanyContact], [Cost], [Duration]) VALUES (N'Straightening iron', N'FixIt', N'01122334533', 80, 2)
GO
INSERT [dbo].[Offers] ([NumberOfOrders], [Discount]) VALUES (0, 0)
INSERT [dbo].[Offers] ([NumberOfOrders], [Discount]) VALUES (10, 20)
INSERT [dbo].[Offers] ([NumberOfOrders], [Discount]) VALUES (20, 35)
INSERT [dbo].[Offers] ([NumberOfOrders], [Discount]) VALUES (40, 75)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (20, 150, CAST(N'2022-12-29' AS Date), N'amin')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (21, 150, CAST(N'2022-12-29' AS Date), N'amin')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (25, 300, CAST(N'2022-12-29' AS Date), N'peter')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (26, 580, CAST(N'2022-11-04' AS Date), N'maria')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (27, 120, CAST(N'2022-11-05' AS Date), N'peter')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (28, 650, CAST(N'2022-11-05' AS Date), N'peter')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (29, 280, CAST(N'2022-10-08' AS Date), N'maria')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (30, 100, CAST(N'2022-12-22' AS Date), N'amin')
INSERT [dbo].[Order] ([ID], [Cost], [Date], [TellerName]) VALUES (31, 80, CAST(N'2022-11-20' AS Date), N'maria')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Schedule] ([CustomerName], [OrderID], [WorkerSSN], [StartTime], [FinishTime]) VALUES (N'amin test', 20, N'36479526894659', CAST(N'2022-12-29T00:58:46.000' AS DateTime), CAST(N'2022-12-29T01:38:46.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Blow Out', 25, N'60', 0, 7)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Face Mask', 30, N'60', 0, 5)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Hair Color', 60, N'180', 0, 6)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Hair Mask', 40, N'150', 0, 0)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Hair styling', 60, N'200', 0, 1)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Haircut', 30, N'100', 0, 2)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Hot Towel Treatments', 20, N'80', 0, 3)
INSERT [dbo].[Services] ([ServiceName], [ServiceDuration], [Price], [Discount], [ID]) VALUES (N'Nail treatments', 30, N'120', 0, 4)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
INSERT [dbo].[ServicesInOrder] ([OrderID], [ServiceName]) VALUES (20, N'Hair Mask')
INSERT [dbo].[ServicesInOrder] ([OrderID], [ServiceName]) VALUES (26, N'Hair color')
INSERT [dbo].[ServicesInOrder] ([OrderID], [ServiceName]) VALUES (26, N'Hair styling')
INSERT [dbo].[ServicesInOrder] ([OrderID], [ServiceName]) VALUES (26, N'Haircut')
GO
INSERT [dbo].[SystemUser] ([IsAdmin], [Username], [Password], [FirstName], [LastName], [Phone], [SSN], [Salary]) VALUES (0, N'amin', N'amin12', N'mohamed', N'amin', N'01129665659', N'11223344556677', 2000)
INSERT [dbo].[SystemUser] ([IsAdmin], [Username], [Password], [FirstName], [LastName], [Phone], [SSN], [Salary]) VALUES (1, N'bassant', N'bassant12', N'bassant', N'hisham', N'01155909550', N'12345678901234', NULL)
INSERT [dbo].[SystemUser] ([IsAdmin], [Username], [Password], [FirstName], [LastName], [Phone], [SSN], [Salary]) VALUES (1, N'EngMarwa', N'123456', N'Eng', N'Marwa', N'01011265368', N'15679856321567', 10000)
INSERT [dbo].[SystemUser] ([IsAdmin], [Username], [Password], [FirstName], [LastName], [Phone], [SSN], [Salary]) VALUES (0, N'maria', N'maria12', N'maria', N'kamal', N'01551869818', N'12121212121212', 4000)
INSERT [dbo].[SystemUser] ([IsAdmin], [Username], [Password], [FirstName], [LastName], [Phone], [SSN], [Salary]) VALUES (0, N'peter', N'peter12', N'peter', N'ashraf', N'01277844086', N'12341234123412', 6000)
GO
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Blow Out', N'Conditioner')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Blow Out', N'Shampoo')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Face Mask', N'Clay')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair Color', N'Conditioner')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair Color', N'Hair dyes')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair Mask', N'Hair oil')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair Mask', N'Hair serums')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair styling', N'Conditioner')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair styling', N'Hair spray')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Hair styling', N'Shampoo')
INSERT [dbo].[UsedProductsInService] ([ServiceName], [UsedProduct]) VALUES (N'Nail treatments', N'Nail polish')
GO
INSERT [dbo].[Worker] ([FirstName], [LastName], [SSN], [Salary], [Phone]) VALUES (N'rayn', N'james', N'24789564897464', N'2000', N'01111111114')
INSERT [dbo].[Worker] ([FirstName], [LastName], [SSN], [Salary], [Phone]) VALUES (N'mary', N'ahmed', N'32168964848752', N'2000', N'01111111112')
INSERT [dbo].[Worker] ([FirstName], [LastName], [SSN], [Salary], [Phone]) VALUES (N'mohamed', N'amin', N'35798648799797', N'2250', N'01129665659')
INSERT [dbo].[Worker] ([FirstName], [LastName], [SSN], [Salary], [Phone]) VALUES (N'seif', N'ahmed', N'36479526894659', N'3000', N'01111111113')
INSERT [dbo].[Worker] ([FirstName], [LastName], [SSN], [Salary], [Phone]) VALUES (N'ahmed', N'mohamed', N'36495686152356', N'3000', N'01111111111')
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_NumberOfOrders]  DEFAULT ((0)) FOR [NumberOfOrders]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_TellerName]  DEFAULT ('x') FOR [TellerName]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_Password]  DEFAULT ((123456)) FOR [Password]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_SystemUser] FOREIGN KEY([TellerName])
REFERENCES [dbo].[SystemUser] ([Username])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_SystemUser]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_SystemUser] FOREIGN KEY([TellerName])
REFERENCES [dbo].[SystemUser] ([Username])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_SystemUser]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_SystemUser1] FOREIGN KEY([TellerName])
REFERENCES [dbo].[SystemUser] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_SystemUser1]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Order]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Order1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Order1]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Worker] FOREIGN KEY([WorkerSSN])
REFERENCES [dbo].[Worker] ([SSN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Worker]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Worker1] FOREIGN KEY([WorkerSSN])
REFERENCES [dbo].[Worker] ([SSN])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Worker1]
GO
ALTER TABLE [dbo].[ServicesInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServicesInOrder_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServicesInOrder] CHECK CONSTRAINT [FK_ServicesInOrder_Order]
GO
ALTER TABLE [dbo].[ServicesInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServicesInOrder_Services] FOREIGN KEY([ServiceName])
REFERENCES [dbo].[Services] ([ServiceName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServicesInOrder] CHECK CONSTRAINT [FK_ServicesInOrder_Services]
GO
ALTER TABLE [dbo].[UsedProductsInService]  WITH CHECK ADD  CONSTRAINT [FK_UsedProductsInService_Inventory] FOREIGN KEY([UsedProduct])
REFERENCES [dbo].[Inventory] ([ProductName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsedProductsInService] CHECK CONSTRAINT [FK_UsedProductsInService_Inventory]
GO
/****** Object:  StoredProcedure [dbo].[countWorkers]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[countWorkers]
AS
BEGIN
SELECT Count(*)
From Worker
END
GO
/****** Object:  StoredProcedure [dbo].[deleteDevice]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDevice]
	@DeviceId  int
AS
BEGIN
Delete From Devices
Where Id=@DeviceId
END
GO
/****** Object:  StoredProcedure [dbo].[deleteService]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteService]
@ServiceName varchar(50)

AS
BEGIN
Delete from Services
Where ServiceName=@ServiceName
END
GO
/****** Object:  StoredProcedure [dbo].[inserDevice]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[inserDevice]
	@DeviceId  int, 
	@DeviceName varchar(50),
	@MaintainceStatus int=1
AS
BEGIN
Insert Into Devices (id,name,InMaintenance)
Values (@DeviceId,@DeviceName,@MaintainceStatus)

END
GO
/****** Object:  StoredProcedure [dbo].[inserSevice]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[inserSevice]
	@discount  int, 
	@ServiceName varchar(50),
	@duration int,
	@price int
AS
BEGIN
Insert Into Services (Discount,price,ServiceDuration,servicename)
Values (@discount,@price,@duration,@ServiceName)

END
GO
/****** Object:  StoredProcedure [dbo].[selectDevicesInfo]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectDevicesInfo]
AS
BEGIN
Select *
From Devices
END
GO
/****** Object:  StoredProcedure [dbo].[selectInventoryItems]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectInventoryItems]
AS
BEGIN
SELECT ProductName ,Capacity ,MinCapacity
From Inventory
END
GO
/****** Object:  StoredProcedure [dbo].[selectProductsCount]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectProductsCount]
AS
BEGIN
SELECT Count(*)
From Inventory
END
GO
/****** Object:  StoredProcedure [dbo].[updateDiscount]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateDiscount]
	@discount  int, 
	@ServiceName varchar(50)
AS
BEGIN
Update Services
Set Discount=@discount
Where ServiceName=@ServiceName
END
GO
/****** Object:  StoredProcedure [dbo].[updateDuration]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateDuration]
	@duration  int, 
	@ServiceName varchar(50)
AS
BEGIN
Update Services
Set ServiceDuration=@duration
Where ServiceName=@ServiceName
END
GO
/****** Object:  StoredProcedure [dbo].[updateInventoryCapacity]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateInventoryCapacity]
	@newCap  int, 
	@ProductName varchar(50)
AS
BEGIN
Update Inventory
Set Capacity=@newCap
Where ProductName=@ProductName
END
GO
/****** Object:  StoredProcedure [dbo].[updatePrice]    Script Date: 12/29/2022 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePrice]
	@price  int, 
	@ServiceName varchar(50)
AS
BEGIN
Update Services
Set Price=@price
Where ServiceName=@ServiceName
END
GO
USE [master]
GO
ALTER DATABASE [DBProject] SET  READ_WRITE 
GO
