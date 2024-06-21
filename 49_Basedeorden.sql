USE [master]
GO
/****** Object:  Database [Orden]    Script Date: 13/5/2024 18:28:22 ******/
CREATE DATABASE [Orden]
 /* CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Orden', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Orden.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Orden_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Orden_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB ) 
 WITH CATALOG_COLLATION = DATABASE_DEFAULT */
GO
ALTER DATABASE [Orden] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Orden].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Orden] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Orden] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Orden] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Orden] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Orden] SET ARITHABORT OFF 
GO
ALTER DATABASE [Orden] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Orden] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Orden] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Orden] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Orden] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Orden] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Orden] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Orden] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Orden] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Orden] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Orden] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Orden] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Orden] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Orden] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Orden] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Orden] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Orden] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Orden] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Orden] SET  MULTI_USER 
GO
ALTER DATABASE [Orden] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Orden] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Orden] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Orden] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Orden] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Orden] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Orden] SET QUERY_STORE = OFF
GO
USE [Orden]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[idLocalidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[idEstado] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[num_item] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio] [decimal](10, 2) NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[num_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[localidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden](
	[idorden] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[dni_cliente] [int] NULL,
	[idestado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idorden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden2]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden2](
	[idorden] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[dni_cliente] [int] NULL,
	[idestado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenxItem]    Script Date: 13/5/2024 18:28:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenxItem](
	[idorden] [int] NOT NULL,
	[num_item] [int] NOT NULL,
	[precio] [decimal](10, 2) NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pkordenItem] PRIMARY KEY CLUSTERED 
(
	[idorden] ASC,
	[num_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cliente] ([dni], [nombre], [apellido], [idLocalidad]) VALUES (123, N'joser', N'joser', 4)
INSERT [dbo].[cliente] ([dni], [nombre], [apellido], [idLocalidad]) VALUES (456, N'manuel', N'manuel', 4)
INSERT [dbo].[cliente] ([dni], [nombre], [apellido], [idLocalidad]) VALUES (48454, N'miguel ', N'lorenzo', 3)
GO
INSERT [dbo].[estado] ([idEstado], [descripcion]) VALUES (1, N'Pagado')
INSERT [dbo].[estado] ([idEstado], [descripcion]) VALUES (2, N'Pend. Pago')
INSERT [dbo].[estado] ([idEstado], [descripcion]) VALUES (3, N'Rechazado')
GO
SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([num_item], [descripcion], [precio], [stock]) VALUES (1, N'raqueta', CAST(45.00 AS Decimal(10, 2)), 45)
INSERT [dbo].[item] ([num_item], [descripcion], [precio], [stock]) VALUES (2, N'red', CAST(125.00 AS Decimal(10, 2)), 12)
INSERT [dbo].[item] ([num_item], [descripcion], [precio], [stock]) VALUES (3, N'pelota', CAST(568.00 AS Decimal(10, 2)), 456)
INSERT [dbo].[item] ([num_item], [descripcion], [precio], [stock]) VALUES (4, N'mesa', CAST(15000.00 AS Decimal(10, 2)), 15)
SET IDENTITY_INSERT [dbo].[item] OFF
GO
SET IDENTITY_INSERT [dbo].[localidad] ON 

INSERT [dbo].[localidad] ([idLocalidad], [localidad]) VALUES (1, N'buenos aires')
INSERT [dbo].[localidad] ([idLocalidad], [localidad]) VALUES (2, N'santa rosa')
INSERT [dbo].[localidad] ([idLocalidad], [localidad]) VALUES (3, N'claromeco')
INSERT [dbo].[localidad] ([idLocalidad], [localidad]) VALUES (4, N'Lomas de Zamora')
SET IDENTITY_INSERT [dbo].[localidad] OFF
GO
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (1, CAST(N'2023-09-22T20:12:34.957' AS DateTime), 123, 1)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (2, CAST(N'2023-09-22T20:12:34.957' AS DateTime), 456, 1)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (3, CAST(N'2023-09-22T20:12:34.957' AS DateTime), 456, 2)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (4, CAST(N'2023-09-26T20:11:00.653' AS DateTime), 48454, 2)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (5, CAST(N'2023-09-26T20:11:00.653' AS DateTime), 48454, 1)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (6, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 456, 3)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (7, CAST(N'2025-01-14T00:00:00.000' AS DateTime), 123, 2)
INSERT [dbo].[orden] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (8, CAST(N'1987-05-07T00:00:00.000' AS DateTime), 48454, 1)
GO
SET IDENTITY_INSERT [dbo].[orden2] ON 

INSERT [dbo].[orden2] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (1, CAST(N'2023-12-12T00:00:00.000' AS DateTime), 12, 131)
INSERT [dbo].[orden2] ([idorden], [fecha], [dni_cliente], [idestado]) VALUES (2, CAST(N'2023-12-13T00:00:00.000' AS DateTime), 5, 5)
SET IDENTITY_INSERT [dbo].[orden2] OFF
GO
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (1, 1, CAST(1.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (1, 2, CAST(12.00 AS Decimal(10, 2)), 12)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (1, 3, CAST(54.00 AS Decimal(10, 2)), 33)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (2, 2, CAST(3.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (2, 3, CAST(221.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (2, 4, CAST(44.00 AS Decimal(10, 2)), 44)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (3, 1, CAST(23.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (3, 3, CAST(33.00 AS Decimal(10, 2)), 33)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (3, 4, CAST(321.00 AS Decimal(10, 2)), 21)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (4, 2, CAST(3.00 AS Decimal(10, 2)), 34)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (4, 3, CAST(3324.00 AS Decimal(10, 2)), 45)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (4, 4, CAST(4.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (5, 1, CAST(1.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (5, 2, CAST(6.00 AS Decimal(10, 2)), 6)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (6, 1, CAST(4.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (6, 4, CAST(45.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[OrdenxItem] ([idorden], [num_item], [precio], [cantidad]) VALUES (7, 1, CAST(1.00 AS Decimal(10, 2)), 1)
GO
/****** Object:  Index [UQ__estado__62EA894B0BE1C0FC]    Script Date: 13/5/2024 18:28:22 ******/
ALTER TABLE [dbo].[estado] ADD UNIQUE NONCLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrdenxItem] ADD  DEFAULT ((0.00)) FOR [precio]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[orden]  WITH CHECK ADD FOREIGN KEY([dni_cliente])
REFERENCES [dbo].[cliente] ([dni])
GO
ALTER TABLE [dbo].[orden]  WITH CHECK ADD FOREIGN KEY([idestado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[OrdenxItem]  WITH CHECK ADD FOREIGN KEY([idorden])
REFERENCES [dbo].[orden] ([idorden])
GO
ALTER TABLE [dbo].[OrdenxItem]  WITH CHECK ADD FOREIGN KEY([num_item])
REFERENCES [dbo].[item] ([num_item])
GO
ALTER TABLE [dbo].[estado]  WITH CHECK ADD  CONSTRAINT [CHK_desc] CHECK  (([descripcion]='Pagado' OR [descripcion]='Rechazado' OR [descripcion]='Pend. Pago'))
GO
ALTER TABLE [dbo].[estado] CHECK CONSTRAINT [CHK_desc]
GO
ALTER TABLE [dbo].[OrdenxItem]  WITH CHECK ADD CHECK  (([cantidad]>(0) AND [cantidad] IS NOT NULL))
GO
USE [master]
GO
ALTER DATABASE [Orden] SET  READ_WRITE 
GO
