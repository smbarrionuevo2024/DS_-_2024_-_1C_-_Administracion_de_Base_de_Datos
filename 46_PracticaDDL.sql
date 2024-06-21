CREATE DATABASE [PracticaDDL]
GO
USE [PracticaDDL]
GO
/****** Object:  Schema [restaurante]    Script Date: 15/05/2022 23:59:13 ******/
CREATE SCHEMA [restaurante]
GO
/****** Object:  Table [restaurante].[Categoria]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[Categoria](
	[IdCategoria] [int] NOT NULL,
	[Nombre_categoria] [varchar](50) NULL,
	[descr_categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[Dificultad]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[Dificultad](
	[IdDificultad] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[Empleado]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[Empleado](
	[ID_Empleado] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[Ingrediente]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[Ingrediente](
	[idIngrediente] [int] NOT NULL,
	[Ingrediente] [varchar](50) NULL,
	[stock_ingrediente] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[Plato]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[Plato](
	[idPlato] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Plato] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[id_Dificultad] [int] NULL,
	[idCategoria] [int] NULL,
	[Encargado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Restaurante.Plato] PRIMARY KEY CLUSTERED 
(
	[idPlato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[PlatoReceta]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[PlatoReceta](
	[idPlato] [int] NOT NULL,
	[idReceta] [int] NOT NULL,
	[precio] [decimal](18, 2) NULL,
	[foto] [varchar](50) NULL,
 CONSTRAINT [PK_Restaurante.PlatoReceta] PRIMARY KEY CLUSTERED 
(
	[idPlato] ASC,
	[idReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[Receta]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[Receta](
	[idReceta] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [restaurante].[RecetaIngrediente]    Script Date: 15/05/2022 23:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [restaurante].[RecetaIngrediente](
	[IdReceta] [int] NOT NULL,
	[IdIngrediente] [int] NOT NULL,
	[Cantidad_ingrediente] [decimal](5, 2) NULL,
	[Unidad_medida] [varchar](30) NULL,
 CONSTRAINT [PK_Restaurante.RecetaIngrediente] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC,
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [restaurante].[Categoria] ([IdCategoria], [Nombre_categoria], [descr_categoria]) VALUES (1, N'frito', N'frito')
INSERT [restaurante].[Categoria] ([IdCategoria], [Nombre_categoria], [descr_categoria]) VALUES (2, N'frio', N'frio')
INSERT [restaurante].[Categoria] ([IdCategoria], [Nombre_categoria], [descr_categoria]) VALUES (3, N'horno ', N'hono')
INSERT [restaurante].[Dificultad] ([IdDificultad], [Descripcion]) VALUES (1, N'nivel 1')
INSERT [restaurante].[Dificultad] ([IdDificultad], [Descripcion]) VALUES (2, N'nivel 2')
INSERT [restaurante].[Dificultad] ([IdDificultad], [Descripcion]) VALUES (3, N'nivel 3')
INSERT [restaurante].[Dificultad] ([IdDificultad], [Descripcion]) VALUES (4, N'nivel 4')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (1, N'Jose')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (2, N'manuel')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (3, N'imela')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (4, N'miguel')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (5, N'Polo')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (6, N'fredie')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (7, N'marta')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (8, N'mirna')
INSERT [restaurante].[Empleado] ([ID_Empleado], [Nombre]) VALUES (9, N'macaco')
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (1, N'Sal', CAST(500.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (2, N'Papa', CAST(522.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (3, N'Tomate', CAST(100.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (4, N'azucar', CAST(50.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (5, N'agua', CAST(350.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (6, N'melon', CAST(200.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (7, N'sandía', CAST(100.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (8, N'cebolla', CAST(520.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (9, N'vinagre', CAST(200.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (10, N'harina', CAST(200.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (11, N'EDULCORANTE', CAST(0.00 AS Decimal(5, 2)))
INSERT [restaurante].[Ingrediente] ([idIngrediente], [Ingrediente], [stock_ingrediente]) VALUES (12, N'STEVIA', NULL)
SET IDENTITY_INSERT [restaurante].[Plato] ON 

INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (1, N'carne a la  plancha', N'lopl', 1, 1, N'1')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (2, N'carne frita', N'2', 2, 1, N'2')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (3, N'empanada', N'empanada', 4, 4, N'4')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (4, N'milanga', N'dde', 4, 3, N'3')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (5, N'flan', N'3', 5, 5, N'1')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (6, N'panqueque', N'2', 1, 3, N'3')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (7, N'mondongo', N'ww', 3, 3, N'3')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (8, N'papa frita', N'2232s', 2, 5, N'3')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (9, N'huevo frito', N'23', 2, 1, N'3')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (10, N'CHIPAGUASU', N'4555', 2, 2, N'4')
INSERT [restaurante].[Plato] ([idPlato], [Nombre_Plato], [Descripcion], [id_Dificultad], [idCategoria], [Encargado]) VALUES (11, N'TELGOPOR', N'565', 2, 1, N'1')
SET IDENTITY_INSERT [restaurante].[Plato] OFF
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (1, 1, CAST(1200.00 AS Decimal(18, 2)), NULL)
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (1, 3, CAST(1520.00 AS Decimal(18, 2)), N'foto')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (2, 2, CAST(520.00 AS Decimal(18, 2)), N'Fata ')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (3, 4, CAST(600.00 AS Decimal(18, 2)), N'sdasfasf124234234')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (4, 3, CAST(4854.00 AS Decimal(18, 2)), N'423423')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (5, 7, CAST(258.00 AS Decimal(18, 2)), N'232323232323')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (6, 6, CAST(487.00 AS Decimal(18, 2)), N'3232323')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (7, 2, CAST(4545.00 AS Decimal(18, 2)), NULL)
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (7, 5, CAST(545.00 AS Decimal(18, 2)), N'255')
INSERT [restaurante].[PlatoReceta] ([idPlato], [idReceta], [precio], [foto]) VALUES (8, 5, CAST(4878.00 AS Decimal(18, 2)), N'5454')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (1, N'marinada')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (2, N'fritolanga')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (3, N'horno barro')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (4, N'horno leña')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (5, N'a la suiza')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (6, N'a la crema')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (7, N'dulce')
INSERT [restaurante].[Receta] ([idReceta], [Descripcion]) VALUES (8, N'A la tierra')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (1, 1, CAST(10.00 AS Decimal(5, 2)), N'gr')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (1, 2, CAST(1.00 AS Decimal(5, 2)), N'kg')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (1, 4, CAST(5.00 AS Decimal(5, 2)), N'cuchara')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (2, 1, CAST(2.00 AS Decimal(5, 2)), N'2')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (2, 2, CAST(2.00 AS Decimal(5, 2)), N'gr')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (2, 5, CAST(5.00 AS Decimal(5, 2)), N'5')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (2, 10, CAST(10.00 AS Decimal(5, 2)), N'gr')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (3, 1, CAST(1.00 AS Decimal(5, 2)), N'2')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (3, 3, CAST(3.00 AS Decimal(5, 2)), N'3')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (4, 4, CAST(5.00 AS Decimal(5, 2)), N'6')
INSERT [restaurante].[RecetaIngrediente] ([IdReceta], [IdIngrediente], [Cantidad_ingrediente], [Unidad_medida]) VALUES (5, 5, CAST(3.00 AS Decimal(5, 2)), N'tyo')
