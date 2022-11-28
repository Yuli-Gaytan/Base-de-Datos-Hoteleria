USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 28/11/2022 04:18:52 a. m. ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hotel] SET QUERY_STORE = OFF
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/11/2022 04:18:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 28/11/2022 04:18:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[Id_Habitacion] [int] NOT NULL,
	[Tipo_Habitacion] [varchar](50) NULL,
	[Desc_Habitacion] [varchar](70) NULL,
	[Precio_Noche] [int] NULL,
 CONSTRAINT [PK__Habitaci__6B8A72E2B4ED1DB2] PRIMARY KEY CLUSTERED 
(
	[Id_Habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paquete]    Script Date: 28/11/2022 04:18:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paquete](
	[id_paquete] [int] NOT NULL,
	[tipo_paquete] [varchar](70) NULL,
	[desc_paquete] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservacion]    Script Date: 28/11/2022 04:18:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservacion](
	[Id_Reservacion] [int] NOT NULL,
	[Id_Cliente] [int] NULL,
	[Fecha_Reserva] [datetime] NULL,
	[Fecha_Ingreso] [datetime] NULL,
	[Fecha_Salida] [datetime] NULL,
	[Id_Habitacion] [int] NULL,
	[id_paquete] [int] NULL,
	[id_ubicacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Reservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicacion]    Script Date: 28/11/2022 04:18:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicacion](
	[id_ubicacion] [int] NOT NULL,
	[pais_hot] [varchar](30) NULL,
	[estado_hot] [varchar](30) NULL,
	[ciudad_hot] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (1, N'Fatima Najera')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (2, N'Vanessa Pedraza')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (3, N'Yulissa Silva')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (4, N'Macario Gutierrez')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (5, N'Joel Alderete')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (6, N'Adrian Escalante')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (7, N'Daniela Rodriguez')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (8, N'Julia Cabrera')
GO
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre_Cliente]) VALUES (9, N'Alejandro Zapata')
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (101, N'Sencilla ', N'Planta baja, cuenta con una cama matrimonial', 650)
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (102, N'Sencilla Doble', N'Planta baja, cunta con dos camas individuales', 650)
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (103, N'Doble General', N'Piso dos, cuenta con cama matrimonial y dos camas individuales', 900)
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (104, N'Doble Matrimonial', N'Piso dos, cuenta con una cama matrimonial', 1000)
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (105, N'Suite', N'Cuenta con cama king size y balcón', 1500)
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (106, N'Suite Presidencial', N'Cuenta con cama king size y vista al mar ', 1800)
GO
INSERT [dbo].[Habitacion] ([Id_Habitacion], [Tipo_Habitacion], [Desc_Habitacion], [Precio_Noche]) VALUES (107, N'Doble Matrimonial', N'Segundo piso', 530)
GO
INSERT [dbo].[paquete] ([id_paquete], [tipo_paquete], [desc_paquete]) VALUES (201, N'Familiar', N'Cuenta con una habitación doble general y un paseo turístico a dos lugares históricos')
GO
INSERT [dbo].[paquete] ([id_paquete], [tipo_paquete], [desc_paquete]) VALUES (202, N'Matrimonial', N'Cuenta con una habitacion doble matrimonial y una cena gratis en el Hotel')
GO
INSERT [dbo].[paquete] ([id_paquete], [tipo_paquete], [desc_paquete]) VALUES (203, N'Amigos', N'cuenta con una habiatacion sencilla doble y entrada a bares del hotel gratis')
GO
INSERT [dbo].[paquete] ([id_paquete], [tipo_paquete], [desc_paquete]) VALUES (204, N'Sencilla', N'cuenta con una habitacion sencilla y comidas gratis en el hotel durante toda la estadia')
GO
INSERT [dbo].[paquete] ([id_paquete], [tipo_paquete], [desc_paquete]) VALUES (205, N'Elegante', N'cuenta con una habitacion suite presidencial, comida gratis y acceso a limosina del hotel ')
GO
INSERT [dbo].[reservacion] ([Id_Reservacion], [Id_Cliente], [Fecha_Reserva], [Fecha_Ingreso], [Fecha_Salida], [Id_Habitacion], [id_paquete], [id_ubicacion]) VALUES (401, 1, CAST(N'2020-01-12T00:00:00.000' AS DateTime), CAST(N'2022-09-11T00:00:00.000' AS DateTime), CAST(N'2022-11-20T00:00:00.000' AS DateTime), 102, 203, 304)
GO
INSERT [dbo].[reservacion] ([Id_Reservacion], [Id_Cliente], [Fecha_Reserva], [Fecha_Ingreso], [Fecha_Salida], [Id_Habitacion], [id_paquete], [id_ubicacion]) VALUES (402, 3, CAST(N'2021-11-11T00:00:00.000' AS DateTime), CAST(N'2022-09-23T00:00:00.000' AS DateTime), CAST(N'2022-09-28T00:00:00.000' AS DateTime), 104, 202, 305)
GO
INSERT [dbo].[reservacion] ([Id_Reservacion], [Id_Cliente], [Fecha_Reserva], [Fecha_Ingreso], [Fecha_Salida], [Id_Habitacion], [id_paquete], [id_ubicacion]) VALUES (403, 5, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), 106, 205, 303)
GO
INSERT [dbo].[reservacion] ([Id_Reservacion], [Id_Cliente], [Fecha_Reserva], [Fecha_Ingreso], [Fecha_Salida], [Id_Habitacion], [id_paquete], [id_ubicacion]) VALUES (404, 2, CAST(N'2019-09-16T00:00:00.000' AS DateTime), CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-23T00:00:00.000' AS DateTime), 101, 204, 301)
GO
INSERT [dbo].[reservacion] ([Id_Reservacion], [Id_Cliente], [Fecha_Reserva], [Fecha_Ingreso], [Fecha_Salida], [Id_Habitacion], [id_paquete], [id_ubicacion]) VALUES (405, 4, CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'2022-09-10T00:00:00.000' AS DateTime), 104, 202, 305)
GO
INSERT [dbo].[ubicacion] ([id_ubicacion], [pais_hot], [estado_hot], [ciudad_hot]) VALUES (301, N'México', N'Coahuila', N'Monclova')
GO
INSERT [dbo].[ubicacion] ([id_ubicacion], [pais_hot], [estado_hot], [ciudad_hot]) VALUES (302, N'México', N'Hidalgo', N'Pachuca')
GO
INSERT [dbo].[ubicacion] ([id_ubicacion], [pais_hot], [estado_hot], [ciudad_hot]) VALUES (303, N'México', N'Nuevo Leon', N'Monterrey')
GO
INSERT [dbo].[ubicacion] ([id_ubicacion], [pais_hot], [estado_hot], [ciudad_hot]) VALUES (304, N'México', N'Nuevo Leon', N'Montemorelos')
GO
INSERT [dbo].[ubicacion] ([id_ubicacion], [pais_hot], [estado_hot], [ciudad_hot]) VALUES (305, N'México', N'Coahuila', N'Saltillo')
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK__reservaci__Id_Ha__4F7CD00D] FOREIGN KEY([Id_Habitacion])
REFERENCES [dbo].[Habitacion] ([Id_Habitacion])
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK__reservaci__Id_Ha__4F7CD00D]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK__reservaci__Id_Ha__60A75C0F] FOREIGN KEY([Id_Habitacion])
REFERENCES [dbo].[Habitacion] ([Id_Habitacion])
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK__reservaci__Id_Ha__60A75C0F]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD FOREIGN KEY([id_paquete])
REFERENCES [dbo].[paquete] ([id_paquete])
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD FOREIGN KEY([id_paquete])
REFERENCES [dbo].[paquete] ([id_paquete])
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD FOREIGN KEY([id_ubicacion])
REFERENCES [dbo].[ubicacion] ([id_ubicacion])
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD FOREIGN KEY([id_ubicacion])
REFERENCES [dbo].[ubicacion] ([id_ubicacion])
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
