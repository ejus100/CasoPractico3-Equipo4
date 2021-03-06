USE [master]
GO
/****** Object:  Database [Cine]    Script Date: 05/10/2021 11:42:12 p. m. ******/
CREATE DATABASE [Cine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.EQUIPO\MSSQL\DATA\Cine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.EQUIPO\MSSQL\DATA\Cine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cine] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cine] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cine] SET RECOVERY FULL 
GO
ALTER DATABASE [Cine] SET  MULTI_USER 
GO
ALTER DATABASE [Cine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cine] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cine', N'ON'
GO
ALTER DATABASE [Cine] SET QUERY_STORE = OFF
GO
USE [Cine]
GO
/****** Object:  User [cliente]    Script Date: 05/10/2021 11:42:13 p. m. ******/
CREATE USER [cliente] FOR LOGIN [cliente] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [cliente]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [cliente]
GO
/****** Object:  Schema [Cinee]    Script Date: 05/10/2021 11:42:13 p. m. ******/
CREATE SCHEMA [Cinee]
GO
/****** Object:  Table [Cinee].[Cliente]    Script Date: 05/10/2021 11:42:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cinee].[Cliente](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [nchar](10) NOT NULL,
	[Telefono] [nchar](13) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Cinee].[Peliculas]    Script Date: 05/10/2021 11:42:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cinee].[Peliculas](
	[Id] [uniqueidentifier] NOT NULL,
	[Titulo] [nchar](50) NULL,
	[Genero] [nchar](50) NOT NULL,
	[Clasificacion] [nchar](10) NOT NULL,
	[Duracion] [varchar](50) NOT NULL,
	[AñoPublicacion] [int] NOT NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Cinee].[Peliculas] ([Id], [Titulo], [Genero], [Clasificacion], [Duracion], [AñoPublicacion]) VALUES (N'50ba8843-4de8-4c3b-b5c0-a78f99b6468e', N'Megalodon                                         ', N'Ciencia Ficción                                   ', N'PG-13     ', N'2:10:04', 2018)
INSERT [Cinee].[Peliculas] ([Id], [Titulo], [Genero], [Clasificacion], [Duracion], [AñoPublicacion]) VALUES (N'947ef64c-6a55-4100-9be2-d91a5792ff01', N'Rápido y Furioso                                  ', N'Acción                                            ', N'PG-13     ', N'01:55:05', 2002)
GO
ALTER TABLE [Cinee].[Cliente] ADD  CONSTRAINT [DF_Cliente_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Cinee].[Peliculas] ADD  CONSTRAINT [DF_Peliculas_Id]  DEFAULT (newid()) FOR [Id]
GO
USE [master]
GO
ALTER DATABASE [Cine] SET  READ_WRITE 
GO
