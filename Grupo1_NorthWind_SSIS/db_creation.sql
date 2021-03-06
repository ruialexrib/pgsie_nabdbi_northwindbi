USE [master]
GO
/****** Object:  Database [Grupo1_NorthWind_DW]    Script Date: 11/04/2020 23:02:08 ******/
CREATE DATABASE [Grupo1_NorthWind_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NorthWind_DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NorthWind_DW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NorthWind_DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NorthWind_DW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Grupo1_NorthWind_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET  MULTI_USER 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Grupo1_NorthWind_DW', N'ON'
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET QUERY_STORE = OFF
GO
USE [Grupo1_NorthWind_DW]
GO
/****** Object:  Table [dbo].[DimCategorias]    Script Date: 11/04/2020 23:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategorias](
	[categoria_id] [int] NOT NULL,
	[categoria_nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimCategories] PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocal]    Script Date: 11/04/2020 23:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocal](
	[local_id] [int] IDENTITY(1,1) NOT NULL,
	[local_cidade] [nvarchar](50) NULL,
	[local_pais] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimLocal] PRIMARY KEY CLUSTERED 
(
	[local_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProdutos]    Script Date: 11/04/2020 23:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProdutos](
	[produto_id] [int] NOT NULL,
	[produto_nome] [nvarchar](50) NULL,
	[produto_precounitario] [money] NULL,
 CONSTRAINT [PK_DimProducts] PRIMARY KEY CLUSTERED 
(
	[produto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTempo]    Script Date: 11/04/2020 23:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTempo](
	[IdData] [int] NOT NULL,
	[Ano] [int] NULL,
	[NumeroTrimestre] [int] NULL,
	[NomeTrimestre] [nvarchar](20) NULL,
	[NumeroMes] [int] NULL,
	[NomeMes] [nvarchar](20) NULL,
	[DiadoMes] [int] NULL,
	[DiadaSemana] [nvarchar](50) NULL,
	[ValorData] [datetime] NULL,
 CONSTRAINT [PK_DimTempo] PRIMARY KEY CLUSTERED 
(
	[IdData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FVendas]    Script Date: 11/04/2020 23:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FVendas](
	[categoria_id] [int] NOT NULL,
	[produto_id] [int] NOT NULL,
	[local_id] [int] NOT NULL,
	[data_id] [int] NOT NULL,
	[quantidade] [decimal](18, 2) NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_FVendas] PRIMARY KEY CLUSTERED 
(
	[categoria_id] ASC,
	[produto_id] ASC,
	[local_id] ASC,
	[data_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FVendas]  WITH NOCHECK ADD  CONSTRAINT [FK_FVendas_DimCategorias] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[DimCategorias] ([categoria_id])
GO
ALTER TABLE [dbo].[FVendas] CHECK CONSTRAINT [FK_FVendas_DimCategorias]
GO
ALTER TABLE [dbo].[FVendas]  WITH NOCHECK ADD  CONSTRAINT [FK_FVendas_DimLocal] FOREIGN KEY([local_id])
REFERENCES [dbo].[DimLocal] ([local_id])
GO
ALTER TABLE [dbo].[FVendas] CHECK CONSTRAINT [FK_FVendas_DimLocal]
GO
ALTER TABLE [dbo].[FVendas]  WITH NOCHECK ADD  CONSTRAINT [FK_FVendas_DimProdutos] FOREIGN KEY([produto_id])
REFERENCES [dbo].[DimProdutos] ([produto_id])
GO
ALTER TABLE [dbo].[FVendas] CHECK CONSTRAINT [FK_FVendas_DimProdutos]
GO
ALTER TABLE [dbo].[FVendas]  WITH NOCHECK ADD  CONSTRAINT [FK_FVendas_DimTempo] FOREIGN KEY([data_id])
REFERENCES [dbo].[DimTempo] ([IdData])
GO
ALTER TABLE [dbo].[FVendas] CHECK CONSTRAINT [FK_FVendas_DimTempo]
GO
USE [master]
GO
ALTER DATABASE [Grupo1_NorthWind_DW] SET  READ_WRITE 
GO
