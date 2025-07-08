USE [ClinicaBD]
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[spAgregarUsuario]
GO
/****** Object:  StoredProcedure [dbo].[spAgregarHorarioMedico]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[spAgregarHorarioMedico]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPaciente]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[spActualizarPaciente]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMedico]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[spActualizarMedico]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarContraseña]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SPActualizarContraseña]
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerUsuarioLogin]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_ObtenerUsuarioLogin]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTurnosPorUnDNI]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarTurnosPorUnDNI]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTurnoPorLegajo]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarTurnoPorLegajo]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTurnoPorDNIPaciente]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarTurnoPorDNIPaciente]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPacientesPorNombre]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarPacientesPorNombre]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPacientesPorDNI]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarPacientesPorDNI]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarMedicosPorDNI]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarMedicosPorDNI]
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarMedicoPorLegajo]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_BuscarMedicoPorLegajo]
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPaciente]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[sp_AgregarPaciente]
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarMedico]    Script Date: 6/7/2025 18:59:26 ******/
DROP PROCEDURE [dbo].[SP_AgregarMedico]
GO
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Tipo]
GO
ALTER TABLE [dbo].[Turnos] DROP CONSTRAINT [FK_Turnos_Pacientes]
GO
ALTER TABLE [dbo].[Turnos] DROP CONSTRAINT [FK_Turnos_Medicos]
GO
ALTER TABLE [dbo].[Turnos] DROP CONSTRAINT [FK_Turnos_Especialidades]
GO
ALTER TABLE [dbo].[Pacientes] DROP CONSTRAINT [FK_Pacientes_Localidades]
GO
ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [FK_Medicos_Usuarios]
GO
ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [FK_Medicos_Nacionalidad]
GO
ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [FK_Medicos_Localidades]
GO
ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [FK_Medicos_Especialidades]
GO
ALTER TABLE [dbo].[Localidades] DROP CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Horarios_Medicos] DROP CONSTRAINT [FK_HM_Medicos]
GO
ALTER TABLE [dbo].[Turnos] DROP CONSTRAINT [DF__Turnos__Estado_T__40F9A68C]
GO
ALTER TABLE [dbo].[Turnos] DROP CONSTRAINT [DF__Turnos__Observac__40058253]
GO
ALTER TABLE [dbo].[Pacientes] DROP CONSTRAINT [DF__Pacientes__Estad__5AEE82B9]
GO
ALTER TABLE [dbo].[Medicos] DROP CONSTRAINT [DF__Medicos__Estado___3B40CD36]
GO
/****** Object:  Index [UK_Usuario]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [UK_Usuario]
GO
/****** Object:  Index [UK_Email_Usuarios]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [UK_Email_Usuarios]
GO
/****** Object:  Index [UK_Cod_Provincia]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Provincias_P] DROP CONSTRAINT [UK_Cod_Provincia]
GO
/****** Object:  Index [UK_Email_Pacientes]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Pacientes] DROP CONSTRAINT [UK_Email_Pacientes]
GO
/****** Object:  Index [UQ_Nacionalidad_Descripcion]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Nacionalidad] DROP CONSTRAINT [UQ_Nacionalidad_Descripcion]
GO
/****** Object:  Index [UQ__Nacional__55F2378F108D8548]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Nacionalidad] DROP CONSTRAINT [UQ__Nacional__55F2378F108D8548]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Turnos]') AND type in (N'U'))
DROP TABLE [dbo].[Turnos]
GO
/****** Object:  Table [dbo].[Tipo_Usuarios]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[Tipo_Usuarios]
GO
/****** Object:  Table [dbo].[Provincias_P]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincias_P]') AND type in (N'U'))
DROP TABLE [dbo].[Provincias_P]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pacientes]') AND type in (N'U'))
DROP TABLE [dbo].[Pacientes]
GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nacionalidad]') AND type in (N'U'))
DROP TABLE [dbo].[Nacionalidad]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicos]') AND type in (N'U'))
DROP TABLE [dbo].[Medicos]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidades]') AND type in (N'U'))
DROP TABLE [dbo].[Localidades]
GO
/****** Object:  Table [dbo].[Horarios_Medicos]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Horarios_Medicos]') AND type in (N'U'))
DROP TABLE [dbo].[Horarios_Medicos]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 6/7/2025 18:59:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Especialidades]') AND type in (N'U'))
DROP TABLE [dbo].[Especialidades]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[IDEspecialidades_ES] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionEspecialidad_ES] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[IDEspecialidades_ES] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios_Medicos]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios_Medicos](
	[LegajoMedico_H] [char](5) NOT NULL,
	[Dias] [varchar](50) NOT NULL,
	[Horario] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LegajoMedico_H] ASC,
	[Dias] ASC,
	[Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[IDLocalidad_L] [int] IDENTITY(1,1) NOT NULL,
	[IDProvincia_L] [int] NOT NULL,
	[Nombre_Localidad_L] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[IDLocalidad_L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Legajo_MED] [char](5) NOT NULL,
	[DNI_MED] [char](8) NOT NULL,
	[Nombre_MED] [varchar](30) NOT NULL,
	[Apellido_MED] [varchar](40) NOT NULL,
	[Genero_MED] [varchar](10) NOT NULL,
	[IDNacionalidad_MED] [int] NOT NULL,
	[Fecha_Nacimiento_MED] [date] NOT NULL,
	[Direccion_MED] [varchar](100) NOT NULL,
	[Telefono_MED] [varchar](15) NOT NULL,
	[Id_Especialidad_MED] [int] NOT NULL,
	[IDLocalidad_MED] [int] NOT NULL,
	[UsuarioMedico_MED] [varchar](30) NOT NULL,
	[IDProvincia_MED] [int] NOT NULL,
	[Estado_MED] [bit] NOT NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[Legajo_MED] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[IDNacionalidad_NA] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Nacionalidad_NA] [char](5) NOT NULL,
	[DescripcionNacionalidad_NA] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED 
(
	[IDNacionalidad_NA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[DNI_PA] [char](8) NOT NULL,
	[ID_Localidad_PA] [int] NOT NULL,
	[ID_Provincia_PA] [int] NOT NULL,
	[ID_Nacionalidad_PA] [int] NOT NULL,
	[Genero_PA] [varchar](10) NOT NULL,
	[Email_PA] [varchar](100) NOT NULL,
	[Nombre_PA] [varchar](50) NOT NULL,
	[Apellido_PA] [varchar](50) NOT NULL,
	[Fecha_Nacimiento_PA] [date] NOT NULL,
	[Direccion_PA] [varchar](100) NOT NULL,
	[Telefono_PA] [varchar](15) NOT NULL,
	[Estado_PA] [bit] NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[DNI_PA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias_P]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias_P](
	[ID_Provincia_P] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia_P] [varchar](50) NOT NULL,
	[CodProvincia_P] [char](3) NOT NULL,
 CONSTRAINT [PK_Provincias_P] PRIMARY KEY CLUSTERED 
(
	[ID_Provincia_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuarios]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuarios](
	[IDTipoUsuario_T] [int] IDENTITY(1,1) NOT NULL,
	[Rol_T] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Tipo_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IDTipoUsuario_T] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[IDTurno_TUR] [int] IDENTITY(1,1) NOT NULL,
	[LegajoMedico_TUR] [char](5) NOT NULL,
	[Fecha_TUR] [varchar](50) NOT NULL,
	[Hora_TUR] [time](0) NOT NULL,
	[DNIPaciente_TUR] [char](8) NOT NULL,
	[Observaciones_TUR] [varchar](200) NULL,
	[Id_Especialidad_TUR] [int] NOT NULL,
	[Estado_TUR] [varchar](10) NULL,
 CONSTRAINT [PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[IDTurno_TUR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario_U] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario_U] [varchar](30) NOT NULL,
	[Contraseña_U] [varchar](30) NOT NULL,
	[Email_U] [varchar](70) NOT NULL,
	[IdTipoUsuario_U] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IDUsuario_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Especialidades] ON 
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (1, N'Pediatría')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (2, N'Cardiología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (3, N'Dermatología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (4, N'Ginecología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (5, N'Neurología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (6, N'Traumatología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (7, N'Otorrinolaringología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (8, N'Oftalmología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (9, N'Endocrinología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (10, N'Urología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (11, N'Oncología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (12, N'Psicología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (13, N'Psiquiatría')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (14, N'Neumonología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (15, N'Medicina General')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (16, N'Nefrología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (17, N'Anestesiología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (18, N'Cirugía General')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (19, N'Cirugía Cardiovascular')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (20, N'Cirugía de Tórax')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (21, N'Cirugía Plástica y Reconstructiva')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (22, N'Hematología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (23, N'Infectología')
GO
INSERT [dbo].[Especialidades] ([IDEspecialidades_ES], [DescripcionEspecialidad_ES]) VALUES (24, N'Reumatología')
GO
SET IDENTITY_INSERT [dbo].[Especialidades] OFF
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M001 ', N'Lunes', CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M001 ', N'Martes', CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M001 ', N'Miercoles', CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M001 ', N'Miercoles', CAST(N'22:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M002 ', N'Martes', CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M002 ', N'Martes', CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M002 ', N'Martes', CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M007 ', N'Miercoles', CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M007 ', N'Viernes', CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M013 ', N'Martes', CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Horarios_Medicos] ([LegajoMedico_H], [Dias], [Horario]) VALUES (N'M013 ', N'Martes', CAST(N'19:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (1, 1, N'Resistencia')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (2, 2, N'San Miguel de Tucumán')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (3, 3, N'Cafayate')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (4, 4, N'Mendoza')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (5, 5, N'Comodoro Rivadavia')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (6, 6, N'Bariloche')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (7, 7, N'San Salvador de Jujuy')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (8, 8, N'Posadas')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (9, 9, N'La Plata')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (10, 10, N'Santa Rosa')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (11, 11, N'Córdoba')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (12, 12, N'Rosario')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (13, 13, N'Paraná')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (14, 14, N'San Juan')
GO
INSERT [dbo].[Localidades] ([IDLocalidad_L], [IDProvincia_L], [Nombre_Localidad_L]) VALUES (15, 15, N'Villa Mercedes')
GO
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M001 ', N'74751444', N'Gustavo', N'Ortiz', N'Masculino', 1, CAST(N'1998-01-10' AS Date), N'Calle Falsa 100', N'6552238216', 1, 2, N'gustaf', 1, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M002 ', N'74955045', N'Lucia', N'Fernandez', N'Femenino', 1, CAST(N'1990-03-15' AS Date), N'Av. Siempre Viva 123', N'6552238217', 2, 3, N'luciaf', 2, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M003 ', N'74749646', N'Martin', N'Perez', N'Masculino', 3, CAST(N'1985-11-22' AS Date), N'Calle Luna 456', N'6552238218', 3, 4, N'martinp', 3, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M004 ', N'60451447', N'Camila', N'Gomez', N'Femenino', 5, CAST(N'1992-06-10' AS Date), N'Pasaje Sol 789', N'6552238219', 4, 5, N'camilag', 4, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M005 ', N'91381480', N'Julian', N'Ramirez', N'Masculino', 4, CAST(N'1988-05-05' AS Date), N'Boulevard Norte 202', N'6552238220', 5, 6, N'julianr', 5, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M006 ', N'76508900', N'Valentina', N'Sosa', N'Femenino', 6, CAST(N'1995-09-19' AS Date), N'Diagonal Sur 333', N'6552238221', 6, 7, N'valentinas', 6, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M007 ', N'73124588', N'Santiago', N'Morales', N'Masculino', 1, CAST(N'1987-02-18' AS Date), N'Av. Del Libertador 555', N'6552238222', 7, 8, N'santiagom', 7, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M008 ', N'72830024', N'Carla', N'Navarro', N'Femenino', 2, CAST(N'1991-04-22' AS Date), N'Calle de los Sueños 88', N'6552238223', 8, 2, N'carlan', 1, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M009 ', N'70991566', N'Diego', N'Luna', N'Masculino', 8, CAST(N'1984-12-09' AS Date), N'Ruta 3 km 45', N'6552238224', 9, 3, N'diegol', 2, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M010 ', N'70134589', N'Laura', N'Martinez', N'Femenino', 3, CAST(N'1993-08-01' AS Date), N'Camino de los Andes 300', N'6552238225', 10, 8, N'lauram', 7, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M011 ', N'71321477', N'Federico', N'Salas', N'Masculino', 12, CAST(N'1986-10-30' AS Date), N'San Martín 1200', N'6552238226', 11, 3, N'federicos', 2, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M012 ', N'75894126', N'Mariana', N'Delgado', N'Femenino', 13, CAST(N'1990-05-25' AS Date), N'Calle Larga 64', N'6552238227', 12, 5, N'marianad', 4, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M013 ', N'76234887', N'Andrés', N'Suárez', N'Masculino', 10, CAST(N'1982-09-14' AS Date), N'Ruta 205 Km 8', N'6552238228', 13, 6, N'andress', 5, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M014 ', N'75391235', N'Florencia', N'Ibáñez', N'Femenino', 11, CAST(N'1996-06-02' AS Date), N'Calle La Rioja 215', N'6552238229', 14, 8, N'floribanez', 7, 1)
GO
INSERT [dbo].[Medicos] ([Legajo_MED], [DNI_MED], [Nombre_MED], [Apellido_MED], [Genero_MED], [IDNacionalidad_MED], [Fecha_Nacimiento_MED], [Direccion_MED], [Telefono_MED], [Id_Especialidad_MED], [IDLocalidad_MED], [UsuarioMedico_MED], [IDProvincia_MED], [Estado_MED]) VALUES (N'M015 ', N'77943112', N'Sebastián', N'Rey', N'Masculino', 2, CAST(N'1989-01-28' AS Date), N'Calle Corrientes 990', N'6552238230', 15, 6, N'sebastianr', 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Nacionalidad] ON 
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (1, N'URU  ', N'Uruguay')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (2, N'PER  ', N'Perú')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (3, N'CHI  ', N'Chile')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (4, N'VEN  ', N'Venezuela')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (5, N'PAR  ', N'Paraguay')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (6, N'BOL  ', N'Bolivia')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (7, N'ECU  ', N'Ecuador')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (8, N'USA  ', N'Estados Unidos')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (9, N'CAN  ', N'Canadá')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (10, N'ESP  ', N'España')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (11, N'ITA  ', N'Italia')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (12, N'FRA  ', N'Francia')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (13, N'ALE  ', N'Alemania')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (14, N'RUS  ', N'Rusia')
GO
INSERT [dbo].[Nacionalidad] ([IDNacionalidad_NA], [Cod_Nacionalidad_NA], [DescripcionNacionalidad_NA]) VALUES (15, N'CHN  ', N'China')
GO
SET IDENTITY_INSERT [dbo].[Nacionalidad] OFF
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'37645988', 3, 3, 1, N'Femenino', N'carla.gomez@mail.com', N'Carla', N'Gómez', CAST(N'1992-07-30' AS Date), N'Pasaje Los Álamos 50', N'3876003333', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'38124567', 1, 1, 1, N'Femenino', N'ana.perez@mail.com', N'Ana', N'Pérez', CAST(N'1990-01-15' AS Date), N'Calle Falsa 123', N'3876001111', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'38694512', 1, 1, 1, N'Femenino', N'karina.silva@mail.com', N'Karina', N'Silva', CAST(N'1990-06-30' AS Date), N'Av. Primavera 33', N'3876012121', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'38991476', 5, 5, 1, N'Femenino', N'olga.romero@mail.com', N'Olga', N'Romero', CAST(N'1994-05-25' AS Date), N'Calle Estrella 99', N'3876016161', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'39548211', 5, 5, 1, N'Femenino', N'elena.sosa@mail.com', N'Elena', N'Sosa', CAST(N'1995-03-25' AS Date), N'Calle Luna 33', N'3876005555', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'40256899', 2, 2, 1, N'Masculino', N'bruno.martinez@mail.com', N'Bruno', N'Martínez', CAST(N'1985-05-20' AS Date), N'Av. Siempre Viva 742', N'3876002222', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'40715876', 2, 2, 2, N'Masculino', N'luis.garcia@mail.com', N'Luis', N'García', CAST(N'1985-07-07' AS Date), N'Pasaje Río 21', N'3876013131', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'40915833', 7, 7, 1, N'Femenino', N'gabriela.ruiz@mail.com', N'Gabriela', N'Ruiz', CAST(N'1991-04-22' AS Date), N'Calle Sol 456', N'3876007777', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'41256987', 4, 4, 2, N'Masculino', N'diego.fernandez@mail.com', N'Diego', N'Fernández', CAST(N'1988-12-10' AS Date), N'Boulevard Central 45', N'3876004444', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'41983245', 1, 1, 2, N'Masculino', N'javier.ortiz@mail.com', N'Javier', N'Ortiz', CAST(N'1987-02-14' AS Date), N'Calle Bosque 200', N'3876010101', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'42145678', 4, 4, 2, N'Masculino', N'nicolas.castro@mail.com', N'Nicolás', N'Castro', CAST(N'1989-01-11' AS Date), N'Boulevard Mar 22', N'3876015151', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'42339876', 7, 7, 2, N'Masculino', N'hernan.vega@mail.com', N'Hernán', N'Vega', CAST(N'1986-09-17' AS Date), N'Pasaje Norte 88', N'3876008888', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'42879012', 6, 6, 2, N'Masculino', N'federico.lopez@mail.com', N'Federico', N'López', CAST(N'1983-08-12' AS Date), N'Av. Central 100', N'3876006666', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'43001765', 2, 2, 1, N'Femenino', N'marina.torres@mail.com', N'Marina', N'Torres', CAST(N'1992-12-28' AS Date), N'Calle Laguna 50', N'3876014141', 1)
GO
INSERT [dbo].[Pacientes] ([DNI_PA], [ID_Localidad_PA], [ID_Provincia_PA], [ID_Nacionalidad_PA], [Genero_PA], [Email_PA], [Nombre_PA], [Apellido_PA], [Fecha_Nacimiento_PA], [Direccion_PA], [Telefono_PA], [Estado_PA]) VALUES (N'43877123', 6, 6, 1, N'Femenino', N'isabel.mendez@mail.com', N'Isabel', N'Méndez', CAST(N'1993-11-05' AS Date), N'Plaza Mayor 77', N'3876009999', 1)
GO
SET IDENTITY_INSERT [dbo].[Provincias_P] ON 
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (1, N'Chaco', N'CHA')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (2, N'Tucumán', N'TUC')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (3, N'Salta', N'SAL')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (4, N'Mendoza', N'MEN')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (5, N'Chubut', N'CHU')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (6, N'Río Negro', N'RNE')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (7, N'Jujuy', N'JUY')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (8, N'Misiones', N'MIS')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (9, N'Buenos Aires', N'BUE')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (10, N'La Pampa', N'PAM')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (11, N'Córdoba', N'COR')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (12, N'Santa Fe', N'SFE')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (13, N'Entre Ríos', N'ERI')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (14, N'San Juan', N'SJU')
GO
INSERT [dbo].[Provincias_P] ([ID_Provincia_P], [NombreProvincia_P], [CodProvincia_P]) VALUES (15, N'San Luis', N'SLU')
GO
SET IDENTITY_INSERT [dbo].[Provincias_P] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuarios] ON 
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (2, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (3, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (4, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (5, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (6, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (7, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (8, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (9, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (10, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (11, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (12, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (13, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (14, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (15, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (16, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (17, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (18, N'Medico')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (19, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T], [Rol_T]) VALUES (20, N'Medico')
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Turnos] ON 
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (5, N'M001 ', N'LUNES', CAST(N'08:00:00' AS Time), N'38124567', N'Consulta general', 1, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (6, N'M002 ', N'LUNES', CAST(N'09:00:00' AS Time), N'40256899', N'Chequeo anual', 2, N'Presente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (7, N'M003 ', N'LUNES', CAST(N'10:00:00' AS Time), N'37645988', N'No hay observaciones', 3, N'Ausente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (8, N'M004 ', N'MARTES', CAST(N'08:00:00' AS Time), N'41256987', N'Consulta ginecológica', 4, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (9, N'M005 ', N'MARTES', CAST(N'09:00:00' AS Time), N'39548211', N'Evaluación neurológica', 5, N'Presente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (10, N'M006 ', N'MARTES', CAST(N'10:00:00' AS Time), N'42879012', N'No hay observaciones', 6, N'Ausente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (11, N'M007 ', N'MIÉRCOLES', CAST(N'08:00:00' AS Time), N'40915833', N'Dolor de oído', 7, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (12, N'M008 ', N'MIÉRCOLES', CAST(N'09:00:00' AS Time), N'42339876', N'Control visual', 8, N'Presente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (13, N'M009 ', N'MIÉRCOLES', CAST(N'10:00:00' AS Time), N'43877123', N'No hay observaciones', 9, N'Ausente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (14, N'M010 ', N'JUEVES', CAST(N'08:00:00' AS Time), N'41983245', N'Consulta urológica', 10, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (15, N'M011 ', N'JUEVES', CAST(N'09:00:00' AS Time), N'38694512', N'Evaluación oncológica', 11, N'Presente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (16, N'M012 ', N'JUEVES', CAST(N'10:00:00' AS Time), N'40715876', N'No hay observaciones', 12, N'Ausente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (17, N'M013 ', N'VIERNES', CAST(N'08:00:00' AS Time), N'43001765', N'Evaluación psiquiátrica', 13, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (18, N'M014 ', N'VIERNES', CAST(N'09:00:00' AS Time), N'42145678', N'Control respiratorio', 14, N'Presente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (19, N'M015 ', N'VIERNES', CAST(N'10:00:00' AS Time), N'38991476', N'No hay observaciones', 15, N'Ausente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (20, N'M001 ', N'Lunes', CAST(N'22:00:00' AS Time), N'38694512', N'No hay observaciones', 1, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (21, N'M013 ', N'Martes', CAST(N'17:00:00' AS Time), N'42339876', N'No hay observaciones', 13, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (22, N'M002 ', N'Martes', CAST(N'11:00:00' AS Time), N'37645988', N'Chequeo Anual', 2, N'Pendiente')
GO
INSERT [dbo].[Turnos] ([IDTurno_TUR], [LegajoMedico_TUR], [Fecha_TUR], [Hora_TUR], [DNIPaciente_TUR], [Observaciones_TUR], [Id_Especialidad_TUR], [Estado_TUR]) VALUES (23, N'M002 ', N'Martes', CAST(N'15:00:00' AS Time), N'42339876', N'No hay observaciones', 2, N'Pendiente')
GO
SET IDENTITY_INSERT [dbo].[Turnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (1, N'admin', N'admin1234', N'admin@mail.com', 1)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (2, N'luciaf', N'medico1234', N'lucia.fernandez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (3, N'gustaf', N'gustaf123', N'gustaf@gmail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (4, N'martinp', N'Martin3!', N'martin.perez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (5, N'camilag', N'Camila29!', N'camila.gomez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (6, N'julianr', N'Julian10!', N'julian.ramirez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (7, N'valentinas', N'Valen81!', N'valentina.sosa@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (8, N'santiagom', N'Santi87!', N'santiago.morales@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (9, N'carlan', N'Carla91!', N'carla.navarro@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (10, N'diegol', N'Diego84!', N'diego.luna@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (11, N'lauram', N'Laura93!', N'laura.martinez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (12, N'federicos', N'Fede86!', N'federico.salas@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (13, N'marianad', N'Mari90!', N'mariana.delgado@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (14, N'andress', N'Andres82!', N'andres.suarez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (15, N'floribanez', N'Flor96!', N'florencia.ibanez@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (16, N'sebastianr', N'Seba89!', N'sebastian.rey@mail.com', 2)
GO
INSERT [dbo].[Usuarios] ([IDUsuario_U], [NombreUsuario_U], [Contraseña_U], [Email_U], [IdTipoUsuario_U]) VALUES (25, N'Lautafuego', N'Lautafuego', N'Lauta', 2)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Nacional__55F2378F108D8548]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Nacionalidad] ADD UNIQUE NONCLUSTERED 
(
	[Cod_Nacionalidad_NA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Nacionalidad_Descripcion]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Nacionalidad] ADD  CONSTRAINT [UQ_Nacionalidad_Descripcion] UNIQUE NONCLUSTERED 
(
	[DescripcionNacionalidad_NA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Email_Pacientes]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Pacientes] ADD  CONSTRAINT [UK_Email_Pacientes] UNIQUE NONCLUSTERED 
(
	[Email_PA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Cod_Provincia]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Provincias_P] ADD  CONSTRAINT [UK_Cod_Provincia] UNIQUE NONCLUSTERED 
(
	[CodProvincia_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Email_Usuarios]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UK_Email_Usuarios] UNIQUE NONCLUSTERED 
(
	[Email_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Usuario]    Script Date: 6/7/2025 18:59:26 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UK_Usuario] UNIQUE NONCLUSTERED 
(
	[NombreUsuario_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((1)) FOR [Estado_MED]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((1)) FOR [Estado_PA]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ('No hay observaciones') FOR [Observaciones_TUR]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ('Pendiente') FOR [Estado_TUR]
GO
ALTER TABLE [dbo].[Horarios_Medicos]  WITH CHECK ADD  CONSTRAINT [FK_HM_Medicos] FOREIGN KEY([LegajoMedico_H])
REFERENCES [dbo].[Medicos] ([Legajo_MED])
GO
ALTER TABLE [dbo].[Horarios_Medicos] CHECK CONSTRAINT [FK_HM_Medicos]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([IDProvincia_L])
REFERENCES [dbo].[Provincias_P] ([ID_Provincia_P])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Especialidades] FOREIGN KEY([Id_Especialidad_MED])
REFERENCES [dbo].[Especialidades] ([IDEspecialidades_ES])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Especialidades]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Localidades] FOREIGN KEY([IDLocalidad_MED])
REFERENCES [dbo].[Localidades] ([IDLocalidad_L])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Localidades]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Nacionalidad] FOREIGN KEY([IDNacionalidad_MED])
REFERENCES [dbo].[Nacionalidad] ([IDNacionalidad_NA])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Nacionalidad]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Usuarios] FOREIGN KEY([UsuarioMedico_MED])
REFERENCES [dbo].[Usuarios] ([NombreUsuario_U])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Usuarios]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Localidades] FOREIGN KEY([ID_Localidad_PA])
REFERENCES [dbo].[Localidades] ([IDLocalidad_L])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Localidades]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Especialidades] FOREIGN KEY([Id_Especialidad_TUR])
REFERENCES [dbo].[Especialidades] ([IDEspecialidades_ES])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Especialidades]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Medicos] FOREIGN KEY([LegajoMedico_TUR])
REFERENCES [dbo].[Medicos] ([Legajo_MED])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Medicos]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Pacientes] FOREIGN KEY([DNIPaciente_TUR])
REFERENCES [dbo].[Pacientes] ([DNI_PA])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Pacientes]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo] FOREIGN KEY([IdTipoUsuario_U])
REFERENCES [dbo].[Tipo_Usuarios] ([IDTipoUsuario_T])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo]
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarMedico]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SP ALTA MEDICO 
CREATE PROCEDURE [dbo].[SP_AgregarMedico]
    @Legajo_MED CHAR(5),
    @DNI_MED INT,
    @Nombre_MED VARCHAR(30),
    @Apellido_MED VARCHAR(40),
    @Genero_MED VARCHAR(10),
    @IDNacionalidad_MED INT,
    @Fecha_Nacimiento_MED DATE,
    @Direccion_MED VARCHAR(100),
    @Telefono_MED VARCHAR(15),
    @ID_Especialidad_MED INT,
    @IDLocalidad_MED INT,
    @IDProvincia_MED INT,
    @Estado_MED BIT,
	@UsuarioMedico_MED VARCHAR (30)
AS
BEGIN
    INSERT INTO Medicos (
        Legajo_MED, DNI_MED, Nombre_MED, Apellido_MED, Genero_MED,
        IDNacionalidad_MED, Fecha_Nacimiento_MED, Direccion_MED, Telefono_MED,
        Id_Especialidad_MED, IDLocalidad_MED, IDProvincia_MED, Estado_MED, UsuarioMedico_MED
    )
    VALUES (
        @Legajo_MED, @DNI_MED, @Nombre_MED, @Apellido_MED, @Genero_MED,
        @IDNacionalidad_MED, @Fecha_Nacimiento_MED, @Direccion_MED, @Telefono_MED,
        @ID_Especialidad_MED, @IDLocalidad_MED, @IDProvincia_MED, @Estado_MED, @UsuarioMedico_MED
    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPaciente]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP ALTA PACIENTE
CREATE PROCEDURE [dbo].[sp_AgregarPaciente]
    @DNI_PA CHAR(8),
    @ID_Localidad_PA INT,
    @ID_Provincia_PA INT,
    @ID_Nacionalidad_PA INT,
    @Genero_PA VARCHAR(10),
    @Email_PA VARCHAR(100),
    @Nombre_PA VARCHAR(50),
    @Apellido_PA VARCHAR(50),
    @Fecha_Nacimiento_PA DATE,
    @Direccion_PA VARCHAR(100),
    @Telefono_PA VARCHAR(15),
    @Estado_PA BIT
AS
BEGIN
    INSERT INTO Pacientes (
        DNI_PA,
        ID_Localidad_PA,
        ID_Provincia_PA,
        ID_Nacionalidad_PA,
        Genero_PA,
        Email_PA,
        Nombre_PA,
        Apellido_PA,
        Fecha_Nacimiento_PA,
        Direccion_PA,
        Telefono_PA,
        Estado_PA
    )
    VALUES (
        @DNI_PA,
        @ID_Localidad_PA,
        @ID_Provincia_PA,
        @ID_Nacionalidad_PA,
        @Genero_PA,
        @Email_PA,
        @Nombre_PA,
        @Apellido_PA,
        @Fecha_Nacimiento_PA,
        @Direccion_PA,
        @Telefono_PA,
        @Estado_PA
    )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarMedicoPorLegajo]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP BUSCAR LEGAJO DE MÉDICOS
CREATE PROCEDURE [dbo].[SP_BuscarMedicoPorLegajo]
    @LegajoFiltro VARCHAR(5)
AS
BEGIN
    SELECT *
    FROM  Medicos
    WHERE Legajo_MED LIKE '%' + @LegajoFiltro + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarMedicosPorDNI]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP BUSCAR DNI DE MÉDICOS 
CREATE PROCEDURE [dbo].[SP_BuscarMedicosPorDNI]
@DNI VARCHAR(8)
AS
SELECT * FROM Medicos
WHERE DNI_MED LIKE '%' + @DNI + '%'
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPacientesPorDNI]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SP PARA BUSCAR PACIENTE POR DNI - LISTADO DE PACIENTES
CREATE PROCEDURE [dbo].[SP_BuscarPacientesPorDNI]
 @DNI VARCHAR(8)
AS
SELECT * FROM Pacientes
WHERE DNI_PA LIKE '%' + @DNI + '%'
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarPacientesPorNombre]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP BUSCAR PACIENTE POR NOMBRE - LISTADOS DE PACIENTES
CREATE PROCEDURE [dbo].[SP_BuscarPacientesPorNombre]
@NombrePaciente varchar(50)
AS
SELECT * FROM Pacientes
WHERE  Nombre_PA LIKE '%' + @NombrePaciente + '%'
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTurnoPorDNIPaciente]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP BUSCAR TURNO POR DNI 
CREATE PROCEDURE [dbo].[SP_BuscarTurnoPorDNIPaciente]
	@DNIFiltro varchar(8)
AS
	SELECT * FROM Turnos
	WHERE  DNIPaciente_TUR LIKE'%' + @DNIFiltro + '%' 
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTurnoPorLegajo]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- TABLAS HECHAS
-- SP BUSCAR LEGAJO POR TURNO - LISTADO DE TURNOS
CREATE   PROCEDURE [dbo].[SP_BuscarTurnoPorLegajo]
    @LegajoFiltro VARCHAR(5)
AS
BEGIN
    SELECT 
        IDTurno_TUR,
        LegajoMedico_TUR,
        Fecha_TUR,
        Hora_TUR,
        DNIPaciente_TUR,
        Observaciones_TUR,
        Estado_TUR
    FROM Turnos
    WHERE LegajoMedico_TUR LIKE '%' + @LegajoFiltro + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTurnosPorUnDNI]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- SP BUSCAR POR DNI PACIENTE - LISTADO DE PACIENTES
CREATE PROCEDURE [dbo].[SP_BuscarTurnosPorUnDNI]
@DNIFiltro VARCHAR(8),
@LegajoMed varchar(5)
AS
SELECT 
    IDTurno_TUR,
    LegajoMedico_TUR,
    Fecha_TUR,
    Hora_TUR,
    DNIPaciente_TUR,
    Observaciones_TUR,
    Id_Especialidad_TUR,
    Estado_TUR
FROM Turnos
WHERE DNIPaciente_TUR LIKE '%' + @DNIFiltro + '%' AND LegajoMedico_TUR = @LegajoMed

GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerUsuarioLogin]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP OBTENER USUARIO PARA EL LOGIN 
CREATE PROCEDURE [dbo].[SP_ObtenerUsuarioLogin]
    @NombreUsuario NVARCHAR(50),
    @Contraseña NVARCHAR(50)
AS
BEGIN
    SELECT IDUsuario_U, NombreUsuario_U, Contraseña_U, Email_U, IdTipoUsuario_U
    FROM Usuarios
    WHERE NombreUsuario_U = @NombreUsuario AND Contraseña_U = @Contraseña
END
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarContraseña]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP PARA ACTUALIZAR CONTRASEÑA 
CREATE   PROCEDURE [dbo].[SPActualizarContraseña]
    @Usuario VARCHAR(50),
    @NuevaClave VARCHAR(80)
AS
BEGIN
    UPDATE Usuarios
    SET Contraseña_U = @NuevaClave
    WHERE NombreUsuario_U = @Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMedico]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SP ACTUALIZAR DATOS DE MÉDICOS
CREATE   PROCEDURE [dbo].[spActualizarMedico] --Actualiza el procedure
(
@LEGAJO_MED CHAR(5),
@DNI_MED CHAR(8),
@NOMBRE_MED VARCHAR(30),
@APELLIDO_MED VARCHAR(40),
@GENERO_MED VARCHAR(10),
@FECHA_NACIMIENTO_MED DATE,
@DIRECCION_MED VARCHAR(100),
@TELEFONO_MED VARCHAR(15)
)
AS
BEGIN
UPDATE Medicos SET	
	Nombre_MED = @NOMBRE_MED,
	Apellido_MED = @APELLIDO_MED,
	Genero_MED = @GENERO_MED,
	Fecha_Nacimiento_MED = @FECHA_NACIMIENTO_MED,
	Direccion_MED = @DIRECCION_MED,
	Telefono_MED = @TELEFONO_MED
WHERE Legajo_MED = @LEGAJO_MED
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPaciente]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SP ACTUALIZAR DATOS DEL PACIENTE
CREATE   PROCEDURE [dbo].[spActualizarPaciente]
(
    @DNI_PA CHAR(8),
    @NOMBRE_PA VARCHAR(50),
    @APELLIDO_PA VARCHAR(50),
    @Genero_PA VARCHAR(10),
    @Email_PA VARCHAR(100),
    @Fecha_Nacimiento_PA DATE,
    @Direccion_PA VARCHAR(100),
    @Telefono_PA VARCHAR(15),
    @Estado_PA BIT
)
AS
BEGIN
    UPDATE Pacientes SET 
        Nombre_PA = @NOMBRE_PA,
        Apellido_PA = @Apellido_PA,
        Genero_PA = @Genero_PA,
        Email_PA = @Email_PA,
        Fecha_Nacimiento_PA = @Fecha_Nacimiento_PA,
        Direccion_PA = @Direccion_PA,
        Telefono_PA = @Telefono_PA,
        Estado_PA = @Estado_PA
    WHERE DNI_PA = @DNI_PA
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarHorarioMedico]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SP AGREGAR HORARIO PARA MÉDICOS
CREATE PROCEDURE [dbo].[spAgregarHorarioMedico]
    @Legajo CHAR(5),
    @Dia VARCHAR(50),
    @Hora TIME
AS
BEGIN
    INSERT INTO Horarios_Medicos (
        LegajoMedico_H,
        Dias,
        Horario
    )
    VALUES (
        @Legajo,
        @Dia,
        @Hora
    )
END

-- CARGA PACIENTES 
INSERT INTO Pacientes 
(DNI_PA, Nombre_PA, Apellido_PA, Genero_PA, Estado_PA, ID_Localidad_PA, ID_Provincia_PA, ID_Nacionalidad_PA, Email_PA, Fecha_Nacimiento_PA, Direccion_PA, Telefono_PA)
VALUES
('38124567', 'Ana', 'Pérez', 'Femenino', 1, 1, 1, 1, 'ana.perez@mail.com', '1990-01-15', 'Calle Falsa 123', '3876001111'),
('40256899', 'Bruno', 'Martínez', 'Masculino', 1, 2, 2, 1, 'bruno.martinez@mail.com', '1985-05-20', 'Av. Siempre Viva 742', '3876002222'),
('37645988', 'Carla', 'Gómez', 'Femenino', 1, 3, 3, 1, 'carla.gomez@mail.com', '1992-07-30', 'Pasaje Los Álamos 50', '3876003333'),
('41256987', 'Diego', 'Fernández', 'Masculino', 1, 4, 4, 2, 'diego.fernandez@mail.com', '1988-12-10', 'Boulevard Central 45', '3876004444'),
('39548211', 'Elena', 'Sosa', 'Femenino', 1, 5, 5, 1, 'elena.sosa@mail.com', '1995-03-25', 'Calle Luna 33', '3876005555'),
('42879012', 'Federico', 'López', 'Masculino', 1, 6, 6, 2, 'federico.lopez@mail.com', '1983-08-12', 'Av. Central 100', '3876006666'),
('40915833', 'Gabriela', 'Ruiz', 'Femenino', 1, 7, 7, 1, 'gabriela.ruiz@mail.com', '1991-04-22', 'Calle Sol 456', '3876007777'),
('42339876', 'Hernán', 'Vega', 'Masculino', 1, 7, 7, 2, 'hernan.vega@mail.com', '1986-09-17', 'Pasaje Norte 88', '3876008888'),
('43877123', 'Isabel', 'Méndez', 'Femenino', 1, 6, 6, 1, 'isabel.mendez@mail.com', '1993-11-05', 'Plaza Mayor 77', '3876009999'),
('41983245', 'Javier', 'Ortiz', 'Masculino', 1, 1, 1, 2, 'javier.ortiz@mail.com', '1987-02-14', 'Calle Bosque 200', '3876010101'),
('38694512', 'Karina', 'Silva', 'Femenino', 1, 1, 1, 1, 'karina.silva@mail.com', '1990-06-30', 'Av. Primavera 33', '3876012121'),
('40715876', 'Luis', 'García', 'Masculino', 1, 2, 2, 2, 'luis.garcia@mail.com', '1985-07-07', 'Pasaje Río 21', '3876013131'),
('43001765', 'Marina', 'Torres', 'Femenino', 1, 2, 2, 1, 'marina.torres@mail.com', '1992-12-28', 'Calle Laguna 50', '3876014141'),
('42145678', 'Nicolás', 'Castro', 'Masculino', 1, 4, 4, 2, 'nicolas.castro@mail.com', '1989-01-11', 'Boulevard Mar 22', '3876015151'),
('38991476', 'Olga', 'Romero', 'Femenino', 1, 5, 5, 1, 'olga.romero@mail.com', '1994-05-25', 'Calle Estrella 99', '3876016161')
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 6/7/2025 18:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP AGREGAR USUARIO
CREATE PROCEDURE [dbo].[spAgregarUsuario]
    @USUARIO VARCHAR(30),
    @CLAVE VARCHAR(30),
    @EMAIL VARCHAR(70),
    @TIPO INT
AS
BEGIN
    INSERT INTO Usuarios (
        NombreUsuario_U,
        Contraseña_U,
        Email_U,
        IdTipoUsuario_U
    )
    VALUES (
        @USUARIO,
        @CLAVE,
        @EMAIL,
        @TIPO
    )
END
GO
