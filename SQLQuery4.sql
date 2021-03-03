USE [master]
GO
/****** Object:  Database [Xpansion]    Script Date: 03-03-2021 13:16:57 ******/
CREATE DATABASE [Xpansion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Xpansion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2\MSSQL\DATA\Xpansion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Xpansion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2\MSSQL\DATA\Xpansion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Xpansion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Xpansion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Xpansion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Xpansion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Xpansion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Xpansion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Xpansion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Xpansion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Xpansion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Xpansion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Xpansion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Xpansion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Xpansion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Xpansion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Xpansion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Xpansion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Xpansion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Xpansion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Xpansion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Xpansion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Xpansion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Xpansion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Xpansion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Xpansion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Xpansion] SET RECOVERY FULL 
GO
ALTER DATABASE [Xpansion] SET  MULTI_USER 
GO
ALTER DATABASE [Xpansion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Xpansion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Xpansion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Xpansion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Xpansion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Xpansion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Xpansion', N'ON'
GO
ALTER DATABASE [Xpansion] SET QUERY_STORE = OFF
GO
USE [Xpansion]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[products] [varchar](30) NOT NULL,
	[productId] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[userId] [int] NOT NULL,
	[total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[UpdateBy] [varchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[UpdatedDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXAM]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXAM](
	[USERS] [varchar](20) NULL,
	[NUM] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Img_Name] [varchar](50) NOT NULL,
	[ImgUpdatedBy] [varchar](50) NULL,
	[ImgPath] [varchar](50) NOT NULL,
	[ImgType] [varchar](10) NOT NULL,
	[ImageID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[categoryId] [int] NOT NULL,
	[discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[UserAddress] [varchar](100) NULL,
	[DOB] [date] NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
/****** Object:  StoredProcedure [dbo].[discountItem]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[discountItem] (@productID int , @discount int) as
begin 
if exists (select * from [dbo].[Cart] where @productID = productId)
begin 
 Update [dbo].[Cart]
 Set amount = amount - amount * @discount /100 
 where productId = @productID
 end 
 else 
 begin 
  select * from Cart
  end
end
GO
/****** Object:  StoredProcedure [dbo].[productPrice]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[productPrice](@id int , @dis int ) as 
begin 
 if exists (select * from Products where ProductId = @id)
  begin 
     update Products
	 set [discount] = @dis
	 where ProductId = @id 
	 select * from Products;
	 end 
end
GO
/****** Object:  StoredProcedure [dbo].[showItem]    Script Date: 03-03-2021 13:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showItem](@id int ) as
begin 
	select * from Cart where productId = @id
end 
GO
USE [master]
GO
ALTER DATABASE [Xpansion] SET  READ_WRITE 
GO
