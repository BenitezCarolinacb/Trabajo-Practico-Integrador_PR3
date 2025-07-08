--- TABLAS HECHAS

-- PACIENTES
CREATE TABLE Pacientes (
DNI_PA CHAR (8) NOT NULL,
ID_Localidad_PA INT NOT NULL,
ID_Provincia_PA INT NOT NULL,
ID_Nacionalidad_PA INT NOT NULL,
Genero_PA VARCHAR(10) NOT NULL, 
Email_PA VARCHAR(100) NOT NULL,
Nombre_PA VARCHAR (50) NOT NULL,
Apellido_PA VARCHAR (50) NOT NULL,
Fecha_Nacimiento_PA DATE NOT NULL,
Direccion_PA VARCHAR(100) NOT NULL,
Telefono_PA VARCHAR(15) NOT NULL,
Estado_PA BIT DEFAULT 1 NOT NULL,
CONSTRAINT PK_Pacientes PRIMARY KEY (DNI_Pa),
CONSTRAINT UK_Email_Pacientes UNIQUE (Email_PA),
CONSTRAINT FK_Pacientes_Localidades FOREIGN KEY (ID_Localidad_PA) REFERENCES Localidades (IDLocalidad_L)
)
GO
--agregar provincia a MEDICOS 

ALTER TABLE Pacientes
ADD ID_Provincia_PA INT NOT NULL;

ALTER TABLE Pacientes
ADD CONSTRAINT FK_Pacientes_Provincias_P
FOREIGN KEY (ID_Provincia_PA) REFERENCES Provincias_P (ID_Provincia_P);


--- MEDICOS
CREATE TABLE Medicos (
    Legajo_MED CHAR(5) NOT NULL,
    DNI_MED CHAR(8) NOT NULL,
    Nombre_MED VARCHAR(30) NOT NULL,
    Apellido_MED VARCHAR(40) NOT NULL,
    Genero_MED VARCHAR(10) NOT NULL,
    IDNacionalidad_MED INT NOT NULL,
    Fecha_Nacimiento_MED DATE NOT NULL,
    Direccion_MED VARCHAR(100) NOT NULL,
    Telefono_MED VARCHAR(15) NOT NULL,
    Id_Especialidad_MED INT NOT NULL,
    IDLocalidad_MED INT NOT NULL,
    UsuarioMedico_MED VARCHAR(30) NOT NULL,
	IDProvincia_MED INT NOT NULL,

    CONSTRAINT PK_Medicos PRIMARY KEY (Legajo_MED),
    CONSTRAINT FK_Medicos_Localidades FOREIGN KEY (IDLocalidad_MED) REFERENCES Localidades(IDLocalidad_L),
    CONSTRAINT FK_Medicos_Usuarios FOREIGN KEY (UsuarioMedico_MED) REFERENCES Usuarios(NombreUsuario_U)ON UPDATE CASCADE,
	CONSTRAINT FK_Medicos_Especialidades FOREIGN KEY (Id_Especialidad_MED) REFERENCES Especialidades(IDEspecialidades_ES),
	CONSTRAINT FK_Medicos_Nacionalidad FOREIGN KEY (IDNacionalidad_MED) REFERENCES Nacionalidad(IDNacionalidad_NA)
)
GO

ALTER TABLE Medicos --agrega el estado en la tabla Medicos
ADD Estado_MED BIT DEFAULT 1 NOT NULL;
GO

--TABLA USUARIOS--
CREATE TABLE Usuarios (
IDUsuario_U INT IDENTITY (1,1) NOT NULL,
NombreUsuario_U VARCHAR(30) NOT NULL, 
Contraseña_U VARCHAR(30) NOT NULL, 
Email_U VARCHAR(70) NOT NULL, 
IdTipoUsuario_U INT NOT NULL, 

CONSTRAINT PK_Usuarios PRIMARY KEY (IDUsuario_U),
CONSTRAINT UK_Email_Usuarios UNIQUE (Email_U),
CONSTRAINT UK_Usuario UNIQUE (NombreUsuario_U),
CONSTRAINT FK_Usuarios_Tipo FOREIGN KEY (IdTipoUsuario_U) REFERENCES Tipo_Usuarios(IDTipoUsuario_T)

)
GO


--TABLA TIPO USUARIOS--
CREATE TABLE Tipo_Usuarios(
IDTipoUsuario_T INT IDENTITY (1,1) NOT NULL, 
Rol_T VARCHAR(40) NOT NULL, 
CONSTRAINT PK_Tipo_Usuarios PRIMARY KEY (IDTipoUsuario_T)
)
GO


-- TABLA TURNOS --
CREATE TABLE Turnos (
IDTurno_TUR INT IDENTITY (1,1) NOT NULL, 
LegajoMedico_TUR  CHAR(5) NOT NULL,
Fecha_TUR VARCHAR(50) NOT NULL, 
Hora_TUR TIME(0) NOT NULL,
DNIPaciente_TUR CHAR (8) NOT NULL, 
Observaciones_TUR VARCHAR (200) DEFAULT 'No hay observaciones',
Id_Especialidad_TUR INT NOT NULL,
Estado_TUR VARCHAR(10) DEFAULT 'Pendiente', -- 0: Pendiente, 1: Presente 2: Ausente

CONSTRAINT PK_Turnos PRIMARY KEY (IDTurno_TUR),
CONSTRAINT FK_Turnos_Medicos FOREIGN KEY (LegajoMedico_TUR) REFERENCES Medicos(Legajo_MED),
CONSTRAINT FK_Turnos_Pacientes FOREIGN KEY (DNIPaciente_TUR) REFERENCES Pacientes(DNI_PA),
CONSTRAINT FK_Turnos_Especialidades FOREIGN KEY (Id_Especialidad_TUR) REFERENCES Especialidades(IDEspecialidades_ES)
)
GO


--TABLA NACIONALIDADES--
CREATE TABLE Nacionalidad (
    IDNacionalidad_NA INT IDENTITY(1,1) NOT NULL,
    Cod_Nacionalidad_NA CHAR(5) NOT NULL UNIQUE,
    DescripcionNacionalidad_NA VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Nacionalidad PRIMARY KEY (IDNacionalidad_NA),
    CONSTRAINT UQ_Nacionalidad_Descripcion UNIQUE (DescripcionNacionalidad_NA)
)
GO

--TABLA ESPECIALIDADES--
CREATE TABLE Especialidades (
IDEspecialidades_ES INT IDENTITY (1,1) NOT NULL, 
DescripcionEspecialidad_ES VARCHAR(50) NOT NULL,
CONSTRAINT PK_Especialidades PRIMARY KEY (IDEspecialidades_ES)
)
GO


CREATE TABLE Horarios_Medicos (
    LegajoMedico_H CHAR(5) NOT NULL,
    Dias VARCHAR(50) NOT NULL,
    Horario TIME NOT NULL,
    PRIMARY KEY (LegajoMedico_H, Dias, Horario),
    CONSTRAINT FK_HM_Medicos FOREIGN KEY (LegajoMedico_H) REFERENCES Medicos (Legajo_MED)
    
)
GO



--TABLA PROVINCIAS--
CREATE TABLE Provincias_P (
ID_Provincia_P INT IDENTITY (1,1) NOT NULL,
NombreProvincia_P VARCHAR (50) NOT NULL,
CodProvincia_P CHAR (3) NOT NULL,
CONSTRAINT PK_Provincias_P PRIMARY KEY (ID_Provincia_P),
CONSTRAINT UK_Cod_Provincia UNIQUE (CodProvincia_P)
)
GO

--TABLA LOCALIDADES--
CREATE TABLE Localidades (
    IDLocalidad_L INT IDENTITY (1,1) NOT NULL,
    IDProvincia_L INT NOT NULL,
    Nombre_Localidad_L VARCHAR (50) NOT NULL,
    CONSTRAINT PK_Localidades PRIMARY KEY (IDLocalidad_L),
    CONSTRAINT FK_Localidades_Provincias FOREIGN KEY (IDProvincia_L) REFERENCES Provincias_P(ID_Provincia_P)
)
GO


-- SP BUSCAR LEGAJO POR TURNO - LISTADO DE TURNOS

CREATE OR ALTER PROCEDURE SP_BuscarTurnoPorLegajo
    @LegajoFiltro CHAR(5)
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


-- SP OBTENER USUARIO PARA EL LOGIN 
CREATE PROCEDURE SP_ObtenerUsuarioLogin
    @NombreUsuario NVARCHAR(50),
    @Contraseña NVARCHAR(50)
AS
BEGIN
    SELECT IDUsuario_U, NombreUsuario_U, Contraseña_U, Email_U, IdTipoUsuario_U
    FROM Usuarios
    WHERE NombreUsuario_U = @NombreUsuario AND Contraseña_U = @Contraseña
END


-- SP BUSCAR LEGAJO DE MÉDICOS
CREATE PROCEDURE SP_BuscarMedicoPorLegajo
    @LegajoFiltro CHAR(5)
AS
BEGIN
    SELECT *
    FROM  Medicos
    WHERE Legajo_MED LIKE '%' + @LegajoFiltro + '%'
END

-- SP BUSCAR DNI DE MÉDICOS 
CREATE PROCEDURE SP_BuscarMedicosPorDNI
@DNI CHAR(8)
AS
SELECT * FROM Medicos
WHERE DNI_MED LIKE @DNI
GO


--- SP BUSCAR POR DNI PACIENTE - LISTADO DE PACIENTES
CREATE PROCEDURE SP_BuscarTurnosPorUnDNI
@DNIFiltro VARCHAR(8)
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
WHERE DNIPaciente_TUR LIKE @DNIFiltro + '%'

DROP PROCEDURE SP_BuscarTurnosPorUnDNI

-- SP BUSCAR PACIENTE POR NOMBRE - LISTADOS DE PACIENTES
CREATE PROCEDURE SP_BuscarPacientesPorNombre
@NombrePaciente varchar(50)
AS
SELECT * FROM Pacientes
WHERE  Nombre_PA LIKE @NombrePaciente



-- SP PARA BUSCAR PACIENTE POR DNI - LISTADO DE PACIENTES
CREATE PROCEDURE SP_BuscarPacientesPorDNI
 @DNI CHAR(8)
AS
SELECT * FROM Pacientes
WHERE DNI_PA LIKE @DNI
GO

drop procedure SP_BuscarPacientesPorDNI
-- SP BUSCAR TURNO POR DNI 
CREATE PROCEDURE SP_BuscarTurnoPorDNIPaciente
	@DNIFiltro char(8)
AS
	SELECT * FROM Turnos
	WHERE  DNIPaciente_TUR LIKE'%' + @DNIFiltro + '%' 


--SP ACTUALIZAR DATOS DEL PACIENTE
CREATE OR ALTER PROCEDURE spActualizarPaciente
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
        @APELLIDO_PA = @Apellido_PA,
        Genero_PA = @Genero_PA,
        Email_PA = @Email_PA,
        Fecha_Nacimiento_PA = @Fecha_Nacimiento_PA,
        Direccion_PA = @Direccion_PA,
        Telefono_PA = @Telefono_PA,
        Estado_PA = @Estado_PA
    WHERE DNI_PA = @DNI_PA
END
GO


-- SP ACTUALIZAR DATOS DE MÉDICOS
CREATE OR ALTER PROCEDURE spActualizarMedico --Actualiza el procedure
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


-- SP ALTA MEDICO 
CREATE PROCEDURE SP_AgregarMedico
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

-- SP ALTA PACIENTE
CREATE PROCEDURE sp_AgregarPaciente
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

-- SP AGREGAR USUARIO
CREATE PROCEDURE spAgregarUsuario
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

-- SP PARA ACTUALIZAR CONTRASEÑA 
CREATE OR ALTER PROCEDURE SPActualizarContraseña
    @Usuario VARCHAR(50),
    @NuevaClave VARCHAR(80)
AS
BEGIN
    UPDATE Usuarios
    SET Contraseña_U = @NuevaClave
    WHERE NombreUsuario_U = @Usuario;
END
GO


-- SP AGREGAR HORARIO PARA MÉDICOS
CREATE PROCEDURE spAgregarHorarioMedico
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

--- CARGA ESPECIALIDADES 

INSERT INTO Especialidades 
(DescripcionEspecialidad_ES)
VALUES 
('Pediatría'), -- ESP M001
('Cardiología'), -- ESP M002
('Dermatología'),-- ESP M003
('Ginecología'),-- ESP M004
('Neurología'),-- ESP M005
('Traumatología'),-- ESP M006
('Otorrinolaringología'),-- ESP M007
('Oftalmología'),-- ESP M008
('Endocrinología'),-- ESP M009
('Urología'),-- ESP M010
('Oncología'),-- ESP M011
('Psicología'),-- ESP M012
('Psiquiatría'),-- ESP M013
('Neumonología'),-- ESP M014
('Medicina General'), -- ESP M015
('Nefrología'), -- ESP M016
('Anestesiología'), -- ESP M017
('Cirugía General'), -- ESP M018
('Cirugía Cardiovascular'), -- ESP M019
('Cirugía de Tórax'), -- ESP M020
('Cirugía Plástica y Reconstructiva'), -- ESP M021
('Hematología'),  -- ESP M022
('Infectología'),-- ESP M023
('Reumatología') -- ESP M024
GO

-- TURNOS DE MEDICOS CARGADOS DEL M001 AL M015
INSERT INTO Turnos 
(LegajoMedico_TUR, Fecha_TUR, Hora_TUR, DNIPaciente_TUR, Observaciones_TUR, Id_Especialidad_TUR, Estado_TUR)
VALUES
-- Lunes
('M001', 'LUNES', '08:00:00', '38124567', 'Consulta general', 1, 'Pendiente'),
('M002', 'LUNES', '09:00:00', '40256899', 'Chequeo anual', 2, 'Presente'),
('M003', 'LUNES', '10:00:00', '37645988', 'No hay observaciones', 3, 'Ausente'),

-- Martes
('M004', 'MARTES', '08:00:00', '41256987', 'Consulta ginecológica', 4, 'Pendiente'),
('M005', 'MARTES', '09:00:00', '39548211', 'Evaluación neurológica', 5, 'Presente'),
('M006', 'MARTES', '10:00:00', '42879012', 'No hay observaciones', 6, 'Ausente'),

-- Miércoles
('M007', 'MIÉRCOLES', '08:00:00', '40915833', 'Dolor de oído', 7, 'Pendiente'),
('M008', 'MIÉRCOLES', '09:00:00', '42339876', 'Control visual', 8, 'Presente'),
('M009', 'MIÉRCOLES', '10:00:00', '43877123', 'No hay observaciones', 9, 'Ausente'),

-- Jueves
('M010', 'JUEVES', '08:00:00', '41983245', 'Consulta urológica', 10, 'Pendiente'),
('M011', 'JUEVES', '09:00:00', '38694512', 'Evaluación oncológica', 11, 'Presente'),
('M012', 'JUEVES', '10:00:00', '40715876', 'No hay observaciones', 12, 'Ausente'),

-- Viernes
('M013', 'VIERNES', '08:00:00', '43001765', 'Evaluación psiquiátrica', 13, 'Pendiente'),
('M014', 'VIERNES', '09:00:00', '42145678', 'Control respiratorio', 14, 'Presente'),
('M015', 'VIERNES', '10:00:00', '38991476', 'No hay observaciones', 15, 'Ausente')
GO


-- CARGA NACIONALIDAD
INSERT INTO Nacionalidad (Cod_Nacionalidad_NA, DescripcionNacionalidad_NA)
VALUES 
('URU', 'Uruguay'),
('PER', 'Perú'),
('CHI', 'Chile'),
('VEN', 'Venezuela'),
('PAR', 'Paraguay'),
('BOL', 'Bolivia'),
('ECU', 'Ecuador'),
('USA', 'Estados Unidos'),
('CAN', 'Canadá'),
('ESP', 'España'),
('ITA', 'Italia'),
('FRA', 'Francia'),
('ALE', 'Alemania'),
('RUS', 'Rusia'),
('CHN', 'China')
GO

-- CARGA PROVINCIAS
INSERT INTO Provincias_P (NombreProvincia_P, CodProvincia_P)
VALUES 
('Chaco',        'CHA'),
('Tucumán',      'TUC'),
('Salta',        'SAL'),
('Mendoza',      'MEN'),
('Chubut',       'CHU'),
('Río Negro',    'RNE'),
('Jujuy',        'JUY'),
('Misiones',     'MIS'),
('Buenos Aires', 'BUE'),
('La Pampa',     'PAM'),
('Córdoba',      'COR'),
('Santa Fe',     'SFE'),
('Entre Ríos',   'ERI'),
('San Juan',     'SJU'),
('San Luis',     'SLU');

GO

-- CARGA LOCALIDAD
INSERT INTO Localidades (IDProvincia_L, Nombre_Localidad_L)
VALUES
(1, 'Resistencia'),
(2, 'San Miguel de Tucumán'),
(3, 'Cafayate'),
(4, 'Mendoza'),
(5, 'Comodoro Rivadavia'),
(6, 'Bariloche'),
(7, 'San Salvador de Jujuy'),
(8, 'Posadas'),
(9, 'La Plata'),
(10, 'Santa Rosa'),
(11, 'Córdoba'),
(12, 'Rosario'),
(13, 'Paraná'),
(14, 'San Juan'),
(15, 'Villa Mercedes')
GO

-- CARGA TIPO USUARIOS  (1/ADMIN - 2/MEDICO)
INSERT INTO Tipo_Usuarios
(Rol_T)
VALUES ('Administrador'),
('Medico')
GO


-- CARGA DE USUARIOS
INSERT INTO Usuarios
(NombreUsuario_U, Contraseña_U ,Email_U ,IdTipoUsuario_U)
-- USUARIO ADMIN
VALUES ('admin','admin1234','admin@mail.com',1),
-- USUARIO M001
('luciaf', 'medico1234', 'lucia.fernandez@mail.com', 2),
-- USUARIO M002
('gustaf', 'gustaf123','gustaf@gmail.com',2),
-- USUARIO M003
('martinp', 'Martin3!', 'martin.perez@mail.com', 2),
-- USUARIO M004
('camilag', 'Camila29!', 'camila.gomez@mail.com', 2),
-- USUARIO M005
('julianr', 'Julian10!', 'julian.ramirez@mail.com', 2),
-- USUARIO M006
('valentinas', 'Valen81!', 'valentina.sosa@mail.com', 2),
-- USUARIO M007
('santiagom', 'Santi87!', 'santiago.morales@mail.com', 2),
-- USUARIO M008
('carlan', 'Carla91!', 'carla.navarro@mail.com', 2),
-- USUARIO M009
('diegol', 'Diego84!', 'diego.luna@mail.com', 2),
-- USUARIO M010
('lauram', 'Laura93!', 'laura.martinez@mail.com', 2),
-- USUARIO M011
('federicos', 'Fede86!', 'federico.salas@mail.com', 2),
-- USUARIO M012
('marianad', 'Mari90!', 'mariana.delgado@mail.com', 2),
-- USUARIO M013
('andress', 'Andres82!', 'andres.suarez@mail.com', 2),
-- USUARIO M014
('floribanez', 'Flor96!', 'florencia.ibanez@mail.com', 2),
-- USUARIO M015
('sebastianr', 'Seba89!', 'sebastian.rey@mail.com', 2)
GO


INSERT INTO Medicos 
(Legajo_MED, DNI_MED, Nombre_MED, Apellido_MED, Genero_MED, IDNacionalidad_MED, Fecha_Nacimiento_MED, Direccion_MED, Telefono_MED, Id_Especialidad_MED, IDLocalidad_MED, IDProvincia_MED, UsuarioMedico_MED)
VALUES 
('M001','74751444','Gustavo','Ortiz','Masculino',1,'1998-01-10','Calle Falsa 100','6552238216',1,2,1,'gustaf'),
('M002','74955045','Lucia','Fernandez','Femenino',1,'1990-03-15','Av. Siempre Viva 123','6552238217',2,3,2,'luciaf'),
('M003','74749646','Martin','Perez','Masculino',3,'1985-11-22','Calle Luna 456','6552238218',3,4,3,'martinp'),
('M004','60451447','Camila','Gomez','Femenino',5,'1992-06-10','Pasaje Sol 789','6552238219',4,5,4,'camilag'),
('M005','91381480','Julian','Ramirez','Masculino',4,'1988-05-05','Boulevard Norte 202','6552238220',5,6,5,'julianr'),
('M006','76508900','Valentina','Sosa','Femenino',6,'1995-09-19','Diagonal Sur 333','6552238221',6,7,6,'valentinas'),
('M007','73124588','Santiago','Morales','Masculino',1,'1987-02-18','Av. Del Libertador 555','6552238222',7,8,7,'santiagom'),
('M008','72830024','Carla','Navarro','Femenino',2,'1991-04-22','Calle de los Sueños 88','6552238223',8,2,1,'carlan'),
('M009','70991566','Diego','Luna','Masculino',8,'1984-12-09','Ruta 3 km 45','6552238224',9,3,2,'diegol'),
('M010','70134589','Laura','Martinez','Femenino',3,'1993-08-01','Camino de los Andes 300','6552238225',10,8,7,'lauram'),
('M011','71321477','Federico','Salas','Masculino',12,'1986-10-30','San Martín 1200','6552238226',11,3,2,'federicos'),
('M012','75894126','Mariana','Delgado','Femenino',13,'1990-05-25','Calle Larga 64','6552238227',12,5,4,'marianad'),
('M013','76234887','Andrés','Suárez','Masculino',10,'1982-09-14','Ruta 205 Km 8','6552238228',13,6,5,'andress'),
('M014','75391235','Florencia','Ibáñez','Femenino',11,'1996-06-02','Calle La Rioja 215','6552238229',14,8,7,'floribanez'),
('M015','77943112','Sebastián','Rey','Masculino',2,'1989-01-28','Calle Corrientes 990','6552238230',15,6,5,'sebastianr');
GO




--- resetear int identity 
-- TURNOS
-- USUARIOS 
-- TIPO USUARIOS
-- ESPECIALIDADES
DBCC CHECKIDENT ('Especialidades', RESEED, 0);

