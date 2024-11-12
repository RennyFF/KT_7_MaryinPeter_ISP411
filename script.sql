USE [master]
GO
/****** Object:  Database [MasterFloorDB]    Script Date: 12.11.2024 11:05:31 ******/
CREATE DATABASE [MasterFloorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterFloorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterFloorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterFloorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterFloorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MasterFloorDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterFloorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterFloorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterFloorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterFloorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterFloorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterFloorDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterFloorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterFloorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterFloorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterFloorDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterFloorDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterFloorDB] SET  MULTI_USER 
GO
ALTER DATABASE [MasterFloorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterFloorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterFloorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterFloorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterFloorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterFloorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterFloorDB] SET QUERY_STORE = OFF
GO
USE [MasterFloorDB]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[PatronomycName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProcentOfBrak] [decimal](8, 4) NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductNameId] [int] NOT NULL,
	[PartnerNameId] [int] NOT NULL,
	[Countity] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DirectorId] [int] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[PostCodeId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[StreetId] [int] NOT NULL,
	[HouseNumber] [nvarchar](50) NOT NULL,
	[INN] [nvarchar](50) NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerTypes]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCodes]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PostCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Articul] [nvarchar](50) NOT NULL,
	[MinimalCost] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductMultiply] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 12.11.2024 11:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1, N'Юрга')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2, N'Северодвинск')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N'Приморск')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (4, N'Реутов')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (5, N'Старый Оскол')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([Id], [SecondName], [FirstName], [PatronomycName]) VALUES (1, N'Иванова', N'Александра', N'Ивановна')
INSERT [dbo].[Directors] ([Id], [SecondName], [FirstName], [PatronomycName]) VALUES (2, N'Петров', N'Василий', N'Петрович')
INSERT [dbo].[Directors] ([Id], [SecondName], [FirstName], [PatronomycName]) VALUES (3, N'Соловьев', N'Андрей', N'Николаевич')
INSERT [dbo].[Directors] ([Id], [SecondName], [FirstName], [PatronomycName]) VALUES (4, N'Воробьева', N'Екатерина', N'Валерьевна')
INSERT [dbo].[Directors] ([Id], [SecondName], [FirstName], [PatronomycName]) VALUES (5, N'Степанов', N'Степан', N'Сергеевич')
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Id], [ProcentOfBrak]) VALUES (1, CAST(0.0010 AS Decimal(8, 4)))
INSERT [dbo].[MaterialType] ([Id], [ProcentOfBrak]) VALUES (2, CAST(0.0095 AS Decimal(8, 4)))
INSERT [dbo].[MaterialType] ([Id], [ProcentOfBrak]) VALUES (3, CAST(0.0028 AS Decimal(8, 4)))
INSERT [dbo].[MaterialType] ([Id], [ProcentOfBrak]) VALUES (4, CAST(0.0055 AS Decimal(8, 4)))
INSERT [dbo].[MaterialType] ([Id], [ProcentOfBrak]) VALUES (5, CAST(0.0034 AS Decimal(8, 4)))
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProducts] ON 

INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (1, 4, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (2, 2, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (3, 3, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (4, 1, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (6, 2, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (7, 4, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (8, 4, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (9, 1, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (10, 3, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (11, 2, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (13, 2, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (14, 3, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (15, 4, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProducts] ([Id], [ProductNameId], [PartnerNameId], [Countity], [SaleDate]) VALUES (16, 1, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [PostCodeId], [RegionId], [CityId], [StreetId], [HouseNumber], [INN], [Rating]) VALUES (1, 1, N'База Строитель', 1, N'aleksandraivanova@ml.ru', N'+7(493)-123-45-67', 1, 1, 1, 1, N'15', N'2222455179', 7)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [PostCodeId], [RegionId], [CityId], [StreetId], [HouseNumber], [INN], [Rating]) VALUES (2, 3, N'Паркет 29', 2, N'vppetrov@vl.ru', N'+7(987)-123-56-78', 2, 2, 2, 2, N'18', N'3333888520', 7)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [PostCodeId], [RegionId], [CityId], [StreetId], [HouseNumber], [INN], [Rating]) VALUES (3, 4, N'Стройсервис', 3, N'ansolovev@st.ru', N'+7(812)-223-32-00', 3, 3, 3, 3, N'21', N'4440391035', 7)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [PostCodeId], [RegionId], [CityId], [StreetId], [HouseNumber], [INN], [Rating]) VALUES (4, 2, N'Ремонт и отделка', 4, N'ekaterina.vorobeva@ml.ru', N'+7(444)-222-33-11', 4, 4, 4, 4, N'51', N'1111520857', 5)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [PostCodeId], [RegionId], [CityId], [StreetId], [HouseNumber], [INN], [Rating]) VALUES (5, 1, N'МонтажПро', 5, N'stepanov@stepan.ru', N'+7(912)-888-33-33', 5, 5, 5, 5, N'122', N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerTypes] ON 

INSERT [dbo].[PartnerTypes] ([Id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerTypes] ([Id], [Name]) VALUES (2, N'ОАО')
INSERT [dbo].[PartnerTypes] ([Id], [Name]) VALUES (3, N'ООО')
INSERT [dbo].[PartnerTypes] ([Id], [Name]) VALUES (4, N'ПАО')
SET IDENTITY_INSERT [dbo].[PartnerTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[PostCodes] ON 

INSERT [dbo].[PostCodes] ([Id], [Name]) VALUES (1, N'652050')
INSERT [dbo].[PostCodes] ([Id], [Name]) VALUES (2, N'164500')
INSERT [dbo].[PostCodes] ([Id], [Name]) VALUES (3, N'188910')
INSERT [dbo].[PostCodes] ([Id], [Name]) VALUES (4, N'143960')
INSERT [dbo].[PostCodes] ([Id], [Name]) VALUES (5, N'309500')
SET IDENTITY_INSERT [dbo].[PostCodes] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductTypeId], [Name], [Articul], [MinimalCost]) VALUES (1, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(8, 2)))
INSERT [dbo].[Products] ([Id], [ProductTypeId], [Name], [Articul], [MinimalCost]) VALUES (2, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(8, 2)))
INSERT [dbo].[Products] ([Id], [ProductTypeId], [Name], [Articul], [MinimalCost]) VALUES (3, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(8, 2)))
INSERT [dbo].[Products] ([Id], [ProductTypeId], [Name], [Articul], [MinimalCost]) VALUES (4, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(8, 2)))
INSERT [dbo].[Products] ([Id], [ProductTypeId], [Name], [Articul], [MinimalCost]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(8, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(8, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(8, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Regions] ON 

INSERT [dbo].[Regions] ([Id], [Name]) VALUES (1, N'Кемеровская область')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (2, N'Архангельская область')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (3, N'Ленинградская область')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (4, N'Московская область')
INSERT [dbo].[Regions] ([Id], [Name]) VALUES (5, N'Белгородская область')
SET IDENTITY_INSERT [dbo].[Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Streets] ON 

INSERT [dbo].[Streets] ([Id], [Name]) VALUES (1, N'Лесная')
INSERT [dbo].[Streets] ([Id], [Name]) VALUES (2, N'Строителей')
INSERT [dbo].[Streets] ([Id], [Name]) VALUES (3, N'Парковая')
INSERT [dbo].[Streets] ([Id], [Name]) VALUES (4, N'Свободы')
INSERT [dbo].[Streets] ([Id], [Name]) VALUES (5, N'Рабочая')
SET IDENTITY_INSERT [dbo].[Streets] OFF
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_Products] FOREIGN KEY([ProductNameId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_Products]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Cities]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Directors] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Directors]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PartnerTypes] FOREIGN KEY([PartnerTypeId])
REFERENCES [dbo].[PartnerTypes] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_PartnerTypes]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PostCodes] FOREIGN KEY([PostCodeId])
REFERENCES [dbo].[PostCodes] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_PostCodes]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Regions] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Regions] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Regions]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Streets] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Streets] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Streets]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
USE [master]
GO
ALTER DATABASE [MasterFloorDB] SET  READ_WRITE 
GO
