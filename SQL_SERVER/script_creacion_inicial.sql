/*---------------------CREACIÖN DEL ESQUEMA----------------*/

--Indico DB a utilizar
USE GD2C2015
--Si no existe el esquema, entonces, lo creo
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SFX')
BEGIN
	EXEC ('CREATE SCHEMA SFX AUTHORIZATION gd')
END

/*---------------------ELIMINACIÓN DE TABLAS---------------------*/
IF OBJECT_ID('SFX.t_butacas_viaje') IS NOT NULL
DROP TABLE SFX.t_butacas_viaje 
IF OBJECT_ID('SFX.t_detalle_compras') IS NOT NULL
DROP TABLE SFX.t_detalle_compras
IF OBJECT_ID('SFX.t_pasajes') IS NOT NULL
DROP TABLE SFX.t_pasajes
IF OBJECT_ID('SFX.t_paquetes') IS NOT NULL
DROP TABLE SFX.t_paquetes
IF OBJECT_ID('SFX.t_butacas') IS NOT NULL
DROP TABLE SFX.t_butacas
IF OBJECT_ID('SFX.t_compras') IS NOT NULL
DROP TABLE SFX.t_compras
IF OBJECT_ID('SFX.t_formas_pago') IS NOT NULL
DROP TABLE SFX.t_formas_pago
IF OBJECT_ID('SFX.t_tarjetas') IS NOT NULL
DROP TABLE SFX.t_tarjetas
IF OBJECT_ID('SFX.t_tipo_tarjetas') IS NOT NULL
DROP TABLE SFX.t_tipo_tarjetas
IF OBJECT_ID('SFX.t_clientes') IS NOT NULL
DROP TABLE SFX.t_clientes
IF OBJECT_ID('SFX.t_butacas') IS NOT NULL
DROP TABLE SFX.t_butacas 
IF OBJECT_ID('SFX.t_viajes') IS NOT NULL
DROP TABLE SFX.t_viajes
IF OBJECT_ID('SFX.t_aeronaves') IS NOT NULL
DROP TABLE SFX.t_aeronaves
IF OBJECT_ID('SFX.t_rutas') IS NOT NULL
DROP TABLE SFX.t_rutas
IF OBJECT_ID('SFX.t_tipo_butacas') IS NOT NULL
DROP TABLE SFX.t_tipo_butacas
IF OBJECT_ID('SFX.t_ciudades_aeropuertos') IS NOT NULL
DROP TABLE SFX.t_ciudades_aeropuertos
IF OBJECT_ID('SFX.t_servicios') IS NOT NULL
DROP TABLE SFX.t_servicios
IF OBJECT_ID('SFX.t_modelos') IS NOT NULL
DROP TABLE SFX.t_modelos
IF OBJECT_ID('SFX.t_fabricantes') IS NOT NULL
DROP TABLE SFX.t_fabricantes
IF OBJECT_ID('SFX.t_func_rol') IS NOT NULL
DROP TABLE SFX.t_func_rol
IF OBJECT_ID('SFX.t_rol_usuario') IS NOT NULL
DROP TABLE SFX.t_rol_usuario
IF OBJECT_ID('SFX.t_roles') IS NOT NULL
DROP TABLE SFX.t_roles
IF OBJECT_ID('SFX.t_login_intentos') IS NOT NULL
DROP TABLE SFX.t_login_intentos
IF OBJECT_ID('SFX.t_usuarios') IS NOT NULL
DROP TABLE SFX.t_usuarios
IF OBJECT_ID('SFX.t_funcionalidades') IS NOT NULL
DROP TABLE SFX.t_funcionalidades


/*---------------------ELIMINACIÓN DE FUNCTIONS, PROCEDURES, TRIGGERS Y VIEWS---------------------*/

/*---------------------CREACIÓN DE LAS TABLAS---------------------*/
--Creación tabla "Clientes"
CREATE TABLE SFX.t_clientes (
	Cli_ID				int identity,
	Cli_Nombre			nvarchar(255) NULL,
	Cli_Apellido		nvarchar(255) NULL,
	Cli_Dni				numeric(18,0) NULL,
	Cli_Dir				nvarchar(255) NULL,
	Cli_Telefono		numeric(18,0) NULL,
	Cli_Mail			nvarchar(255) NULL,
	Cli_Fecha_Nac		datetime NULL,
	Cli_Fecha_Baja		datetime,
	Cli_Usu_Id			int
)
--Creación tabla "Pasajes"
CREATE TABLE SFX.t_pasajes (
	Pas_Codigo			numeric(18,0) NOT NULL,
	Pas_Precio			numeric(18,2) NULL,
	Pas_FechaCompra		datetime NULL,
	Pas_Estado			nvarchar(255),
	Pas_But_ID			int,
	Pas_Cli_ID			int	
)
--Creación tabla "Paquetes"
CREATE TABLE SFX.t_paquetes (
	Paq_Codigo			numeric(18,0) NOT NULL,
	Paq_Precio			numeric(18,2) NULL,
	Paq_KG				numeric(18,0) NULL,
	Paq_FechaCompra		datetime NULL,
	Paq_Via_ID			int,
	Paq_Cli_ID			int
)
--Creación tabla "Rutas"
CREATE TABLE SFX.t_rutas (
	Rut_ID					int identity,
	Rut_Codigo				numeric(18,0) NOT NULL,
	Rut_Precio_BaseKG		numeric(18,2) NULL,
	Rut_Precio_BasePasaje	numeric(18,2) NULL,
	Rut_Fecha_Baja			datetime,
	Rut_Cia_ID_Origen		int,
	Rut_Cia_ID_Destino		int,
	Rut_Ser_ID				int
)
--Creación tabla "Aeronaves"
CREATE TABLE SFX.t_aeronaves (
	Aer_ID						int identity,
	Aer_Matricula				nvarchar(255) NULL,
	Aer_Mod_ID					int,
	Aer_KG_Disponibles			numeric(18,0) NULL,
	Aer_Fecha_Alta				datetime,
	Aer_Fecha_Fuera_Servicio	datetime,
	Aer_Fecha_Reinicio_Servicio	datetime,
	Aer_Fecha_Baja_Definitiva	datetime,
	Aer_Ser_ID					int
)
--Creación tabla "Ciudades Aeropuertos"
CREATE TABLE SFX.t_ciudades_aeropuertos (
	Cia_ID						int identity,
	Cia_Descripcion				nvarchar(255),
	Cia_Fecha_Baja				datetime
)
--Creación tabla "Servicios"
CREATE TABLE SFX.t_servicios (
	Ser_ID						int identity,
	Ser_Descripcion				nvarchar(255),
	Ser_Porcentaje_Adicional	numeric(3,0)
)
--Creación tabla "Viajes"
CREATE TABLE SFX.t_viajes (
	Via_ID						int identity,
	Via_Rut_ID					int,
	Via_Aer_ID					int,
	Via_Fecha_Salida			datetime,
	Via_Fecha_Llegada			datetime,
	Via_Fecha_Llegada_Estimada	datetime,
	Via_Fecha_Llegada_Destino	datetime
)
--Creación tabla "Tipo Butacas"
CREATE TABLE SFX.t_tipo_butacas (
	Tbu_ID						int identity,
	Tbu_Descripcion				nvarchar(255)
)
--Creación tabla "Butacas"
CREATE TABLE SFX.t_butacas (
	But_ID						int identity,
	But_Numero					numeric(3,0),
	But_Piso					numeric(1,0),
	But_Aer_ID					int,
	But_Tbu_ID					int,
)
--Creación tabla "Butacas Viaje"
CREATE TABLE SFX.t_butacas_viaje (
	Buv_ID						int identity,
	Buv_Via_ID					int,
	Buv_But_ID					int,
	Buv_Cli_ID					int,
	Buv_Fecha_Baja				datetime
)
--Creación tabla "Fabricantes"
CREATE TABLE SFX.t_fabricantes (
	Fab_ID					int identity,
	Fab_Nombre				nvarchar(255)
)
--Creación tabla "Modelos"
CREATE TABLE SFX.t_modelos (
	Mod_ID					int identity,
	Mod_Nombre				nvarchar(255),
	Mod_Fab_ID				int
)
--Creación tabla "Formas de Pago"
CREATE TABLE SFX.t_formas_pago (
	Fpa_ID					int identity,
	Fpa_Nombre				nvarchar(255),
)
--Creación tabla "Tipos de Tarjeta"
CREATE TABLE SFX.t_tipo_tarjetas (
	Tta_ID					int identity,
	Tta_Nombre				nvarchar(255),
	Tta_Cuotas				int
)
--Creación tabla "Tarjetas"
CREATE TABLE SFX.t_tarjetas (
	Tar_ID					int identity,
	Tar_Numero				nvarchar(16),
--	Tar_Fecha_Emision		datetime,
	Tar_Fecha_Vencimiento	datetime,
	Tar_Codigo_Seg			nvarchar(3),
	Tar_Tta_ID				int,
	Tar_Cli_Id				int
)
--Creación tabla "Compras"
CREATE TABLE SFX.t_compras (
	Com_ID					int identity,
	Com_Cli_ID				int,
	Com_Via_ID				int,
	Com_Fpa_ID				int,
	Com_Tar_ID				int,
	Com_Importe				numeric(18,2)
)
--Creación tabla "Detalle de Compras"
CREATE TABLE SFX.t_detalle_compras (
	Dec_ID					int identity,
	Dec_Com_ID				int,
	Dec_Pas_Codigo			numeric(18,0),
	Dec_Paq_Codigo			numeric(18,0)
)
--Creación tabla "Funcionalidades"
CREATE TABLE SFX.t_funcionalidades (
	Fun_Id				int identity,
	Fun_Nombre			varchar(255)
)
--Creación tabla "Roles"
CREATE TABLE SFX.t_roles (
	Rol_Id				int NOT NULL identity,
	Rol_Nombre			varchar(255) NOT NULL,
	Rol_Estado			varchar(255) NOT NULL
)
--Creación tabla "Usuarios"
CREATE TABLE SFX.t_usuarios (
	Usu_Id				int NOT NULL identity,
	Usu_Username		varchar(8) NOT NULL,
	Usu_Password		char(64) NOT NULL,
	Usu_Fecha_Creacion	datetime NOT NULL,
	Usu_Fecha_Modif		datetime,
	Usu_Preg_Secreta	varchar(255) NOT NULL,
	Usu_Resp_Secreta	varchar(255) NOT NULL,
	Usu_Fecha_Baja		datetime NULL
)
--Creación tabla "Roles por Usuario"
CREATE TABLE SFX.t_login_intentos (
	Log_id				int identity,
	Log_Usu_Id			int,
	Log_Horario			datetime,
	Log_Nro_Intento		int
)
--Creación tabla "Roles por Usuario"
CREATE TABLE SFX.t_rol_usuario (
	Rxu_Id				int identity,
	Rxu_Usu_Id			int,
	Rxu_Rol_Id			int
)
--Creación tabla "Funciones por Rol"
CREATE TABLE SFX.t_func_rol(
	Fxr_Id				int identity,
	Fxr_Fun_Id			int,
	Fxr_Rol_Id			int
)

/*---------------------AGREGAMOS PRIMARY KEYS---------------------*/
--Agregamos Primary Key a tabla "Clientes"
ALTER TABLE SFX.t_clientes
ADD CONSTRAINT PK_t_clientes PRIMARY KEY(Cli_ID)
--Agregamos Primary Key a tabla "Pasajes"
ALTER TABLE SFX.t_pasajes
ADD CONSTRAINT PK_t_pasajes PRIMARY KEY(Pas_Codigo)
--Agregamos Primary Key a tabla "Paquetes"
ALTER TABLE SFX.t_paquetes
ADD CONSTRAINT PK_t_paquetes PRIMARY KEY(Paq_Codigo)
--Agregamos Primary Key a tabla "Rutas"
ALTER TABLE SFX.t_rutas
ADD CONSTRAINT PK_t_rutas PRIMARY KEY(Rut_ID)
--Agregamos Primary Key a tabla "Aeronaves"
ALTER TABLE SFX.t_aeronaves
ADD CONSTRAINT PK_t_aeronaves PRIMARY KEY(Aer_ID)
--Agregamos Primary Key a tabla "Ciudades Aeropuertos"
ALTER TABLE SFX.t_ciudades_aeropuertos
ADD CONSTRAINT PK_t_ciudades_aeropuertos PRIMARY KEY(Cia_ID)
--Agregamos Primary Key a tabla "Servicios"
ALTER TABLE SFX.t_servicios
ADD CONSTRAINT PK_t_servicios PRIMARY KEY(Ser_ID)
--Agregamos Primary Key a tabla "Viajes"
ALTER TABLE SFX.t_viajes
ADD CONSTRAINT PK_t_viajes PRIMARY KEY(Via_ID)
--Agregamos Primary Key a tabla "Tipo de Butacas"
ALTER TABLE SFX.t_tipo_butacas
ADD CONSTRAINT PK_t_tipo_butacas PRIMARY KEY(Tbu_ID)
--Agregamos Primary Key a tabla "Butacas"
ALTER TABLE SFX.t_butacas
ADD CONSTRAINT PK_t_butacas PRIMARY KEY(But_ID)
--Agregamos Primary Key a tabla "Butacas Viaje"
ALTER TABLE SFX.t_butacas_viaje
ADD CONSTRAINT PK_t_butacas_viaje PRIMARY KEY(Buv_ID)
--Agregamos Primary Key a tabla "Fabricantes"
ALTER TABLE SFX.t_fabricantes
ADD CONSTRAINT PK_t_fabricantes PRIMARY KEY(Fab_ID)
--Agregamos Primary Key a tabla "Modelos"
ALTER TABLE SFX.t_modelos
ADD CONSTRAINT PK_t_modelos PRIMARY KEY(Mod_ID)
--Agregamos Primary Key a tabla "Formas de Pago"
ALTER TABLE SFX.t_formas_pago
ADD CONSTRAINT PK_t_formas_pago PRIMARY KEY(Fpa_ID)
--Agregamos Primary Key a tabla ""Tipo de Tarjeta"
ALTER TABLE SFX.t_tipo_tarjetas
ADD CONSTRAINT PK_t_tipo_tarjetas PRIMARY KEY(Tta_ID)
--Agregamos Primary Key a tabla ""Tarjetas"
ALTER TABLE SFX.t_tarjetas
ADD CONSTRAINT PK_t_tarjetas PRIMARY KEY(Tar_ID)
--Agregamos Primary Key a tabla ""Compras"
ALTER TABLE SFX.t_compras
ADD CONSTRAINT PK_t_compras PRIMARY KEY(Com_ID)
--Agregamos Primary Key a tabla ""Compras"
ALTER TABLE SFX.t_detalle_compras
ADD CONSTRAINT PK_t_detalle_compras PRIMARY KEY(Dec_ID)
--Agregamos Primary Key a tabla "Funcionalidades"
ALTER TABLE SFX.t_funcionalidades
ADD CONSTRAINT PK_t_funcionalidades PRIMARY KEY(Fun_Id)
--Agregamos Primary Key a tabla "Roles"
ALTER TABLE SFX.t_roles
ADD CONSTRAINT PK_t_roles PRIMARY KEY(Rol_Id)
--Agregamos Primary Key a tabla "Usuarios"
ALTER TABLE SFX.t_usuarios
ADD CONSTRAINT PK_t_usuarios PRIMARY KEY(Usu_Id)
--Agregamos Primary Key a tabla "Login Intentos"
ALTER TABLE SFX.t_login_intentos
ADD CONSTRAINT PK_t_login_intentos PRIMARY KEY(Log_id)
--Agregamos Primary Key a tabla "Roles por Usuario"
ALTER TABLE SFX.t_rol_usuario
ADD CONSTRAINT PK_t_rol_usuario PRIMARY KEY(Rxu_Id)
--Agregamos Primary Key a tabla "Funcionalidades por Rol"
ALTER TABLE SFX.t_func_rol
ADD CONSTRAINT PK_t_func_rol PRIMARY KEY(Fxr_Id)

/*---------------------AGREGAMOS FOREIGN KEYS---------------------*/
--Agregamos Foreign Key a tabla "Pasajes 01"
ALTER TABLE SFX.t_pasajes
ADD CONSTRAINT FK_t_pasajes_01 FOREIGN KEY (Pas_Cli_ID) 
    REFERENCES SFX.t_clientes (Cli_ID) 
--Agregamos Foreign Key a tabla "Pasajes 02"
ALTER TABLE SFX.t_pasajes
ADD CONSTRAINT FK_t_pasajes_02 FOREIGN KEY (Pas_But_ID) 
    REFERENCES SFX.t_butacas (But_ID) 
--Agregamos Foreign Key a tabla "Paquetes 01"
ALTER TABLE SFX.t_paquetes
ADD CONSTRAINT FK_t_paquetes_01 FOREIGN KEY (Paq_Cli_ID) 
    REFERENCES SFX.t_clientes (Cli_ID) 
--Agregamos Foreign Key a tabla "Paquetes 02"
ALTER TABLE SFX.t_paquetes
ADD CONSTRAINT FK_t_paquetes_02 FOREIGN KEY (Paq_Via_ID) 
    REFERENCES SFX.t_viajes (Via_ID) 
--Agregamos Foreign Key a tabla "Rutas 01"
ALTER TABLE SFX.t_rutas
ADD CONSTRAINT FK_t_rutas_01 FOREIGN KEY (Rut_Ser_ID) 
REFERENCES SFX.t_servicios (Ser_ID) 
--Agregamos Foreign Key a tabla "Rutas 02"
ALTER TABLE SFX.t_rutas
ADD CONSTRAINT FK_t_rutas_02 FOREIGN KEY (Rut_Cia_ID_Origen) 
    REFERENCES SFX.t_ciudades_aeropuertos (Cia_ID) 
--Agregamos Foreign Key a tabla "Rutas 03"
ALTER TABLE SFX.t_rutas
ADD CONSTRAINT FK_t_rutas_03 FOREIGN KEY (Rut_Cia_ID_Destino) 
    REFERENCES SFX.t_ciudades_aeropuertos (Cia_ID) 
--Agregamos Foreign Key a tabla "Aeronaves 01"
ALTER TABLE SFX.t_aeronaves
ADD CONSTRAINT FK_t_aeronaves_01 FOREIGN KEY (Aer_Ser_ID) 
    REFERENCES SFX.t_servicios (Ser_ID) 
--Agregamos Foreign Key a tabla "Aeronaves 02"
ALTER TABLE SFX.t_aeronaves
ADD CONSTRAINT FK_t_aeronaves_02 FOREIGN KEY (Aer_Mod_ID) 
    REFERENCES SFX.t_modelos (Mod_ID) 
--Agregamos Foreign Key a tabla "Viajes 01"
ALTER TABLE SFX.t_viajes
ADD CONSTRAINT FK_t_viajes_01 FOREIGN KEY (Via_Rut_ID) 
    REFERENCES SFX.t_rutas (Rut_ID) 
--Agregamos Foreign Key a tabla "Viajes 02"
ALTER TABLE SFX.t_viajes
ADD CONSTRAINT FK_t_viajes_02 FOREIGN KEY (Via_Aer_ID) 
    REFERENCES SFX.t_aeronaves (Aer_ID)
--Agregamos Foreign Key a tabla "Butacas 01"
ALTER TABLE SFX.t_butacas
ADD CONSTRAINT FK_t_butacas_01 FOREIGN KEY (But_Tbu_ID) 
    REFERENCES SFX.t_tipo_butacas (Tbu_ID) 
--Agregamos Foreign Key a tabla "Butacas 02"
ALTER TABLE SFX.t_butacas
ADD CONSTRAINT FK_t_butacas_02 FOREIGN KEY (But_Aer_ID) 
    REFERENCES SFX.t_aeronaves (Aer_ID)
--Agregamos Foreign Key a tabla "Butacas Viaje 01"
ALTER TABLE SFX.t_butacas_viaje
ADD CONSTRAINT FK_t_butacas_viaje_01 FOREIGN KEY (Buv_Via_ID) 
    REFERENCES SFX.t_viajes (Via_ID)
--Agregamos Foreign Key a tabla "Butacas Viaje 02"
ALTER TABLE SFX.t_butacas_viaje
ADD CONSTRAINT FK_t_butacas_viaje_02 FOREIGN KEY (Buv_But_ID) 
    REFERENCES SFX.t_butacas (But_ID)
--Agregamos Foreign Key a tabla "Butacas Viaje 03"
ALTER TABLE SFX.t_butacas_viaje
ADD CONSTRAINT FK_t_butacas_viaje_03 FOREIGN KEY (Buv_Cli_ID) 
    REFERENCES SFX.t_clientes (Cli_ID)	
--Agregamos Foreign Key a tabla "Clientes 01"
ALTER TABLE SFX.t_clientes 
ADD CONSTRAINT FK_t_clientes_01 FOREIGN KEY (Cli_Usu_Id) 
    REFERENCES SFX.t_usuarios (Usu_Id)
--Agregamos Foreign Key a tabla "Modelos 01"
ALTER TABLE SFX.t_modelos 
ADD CONSTRAINT FK_t_modelos_01 FOREIGN KEY (Mod_Fab_ID) 
    REFERENCES SFX.t_fabricantes (Fab_ID)
--Agregamos Foreign Key a tabla "Tarjetas 01"
ALTER TABLE SFX.t_tarjetas 
ADD CONSTRAINT FK_t_tarjetas_01 FOREIGN KEY (Tar_Tta_ID) 
    REFERENCES SFX.t_tipo_tarjetas (Tta_ID)
--Agregamos Foreign Key a tabla "Tarjetas 02"
ALTER TABLE SFX.t_tarjetas 
ADD CONSTRAINT FK_t_tarjetas_02 FOREIGN KEY (Tar_Cli_Id) 
    REFERENCES SFX.t_clientes (Cli_Id)
--Agregamos Foreign Key a tabla "Compras 01"
ALTER TABLE SFX.t_compras 
ADD CONSTRAINT FK_t_compras_01 FOREIGN KEY (Com_Cli_ID) 
    REFERENCES SFX.t_clientes (Cli_Id)
--Agregamos Foreign Key a tabla "Compras 02"
ALTER TABLE SFX.t_compras 
ADD CONSTRAINT FK_t_compras_02 FOREIGN KEY (Com_Via_ID) 
    REFERENCES SFX.t_viajes (Via_ID)
--Agregamos Foreign Key a tabla "Compras 03"
ALTER TABLE SFX.t_compras 
ADD CONSTRAINT FK_t_compras_03 FOREIGN KEY (Com_Fpa_ID) 
    REFERENCES SFX.t_formas_pago (Fpa_ID)
--Agregamos Foreign Key a tabla "Compras 04"
ALTER TABLE SFX.t_compras 
ADD CONSTRAINT FK_t_compras_04 FOREIGN KEY (Com_Tar_ID) 
    REFERENCES SFX.t_tarjetas (Tar_ID)
--Agregamos Foreign Key a tabla "Detalle de Compras 01"
ALTER TABLE SFX.t_detalle_compras 
ADD CONSTRAINT FK_t_detalle_compras_01 FOREIGN KEY (Dec_Com_ID) 
    REFERENCES SFX.t_compras (Com_ID)
--Agregamos Foreign Key a tabla "Detalle de Compras 02"
ALTER TABLE SFX.t_detalle_compras 
ADD CONSTRAINT FK_t_detalle_compras_02 FOREIGN KEY (Dec_Pas_Codigo) 
    REFERENCES SFX.t_pasajes (Pas_Codigo)
--Agregamos Foreign Key a tabla "Detalle de Compras 03"
ALTER TABLE SFX.t_detalle_compras 
ADD CONSTRAINT FK_t_detalle_compras_03 FOREIGN KEY (Dec_Paq_Codigo) 
    REFERENCES SFX.t_paquetes (Paq_Codigo)
--Agregamos Foreign Key a tabla "Roles por Usuario"
ALTER TABLE SFX.t_rol_usuario
ADD CONSTRAINT FK_rol_usuario_01 FOREIGN KEY (Rxu_Rol_Id) 
    REFERENCES SFX.t_roles (Rol_Id) 
--Agregamos Foreign Key a tabla "Roles por Usuario"
ALTER TABLE SFX.t_rol_usuario
ADD CONSTRAINT FK_rol_usuario_02 FOREIGN KEY (Rxu_Usu_Id) 
    REFERENCES SFX.t_usuarios (Usu_Id) 
--Agregamos Foreign Key a tabla "Login Usuarios"
ALTER TABLE SFX.t_login_intentos
ADD CONSTRAINT FK_login_intentos_01 FOREIGN KEY (Log_Usu_Id) 
    REFERENCES SFX.t_usuarios (Usu_Id) 
--Agregamos Foreign Key a tabla "Funcionalidades por Rol"
ALTER TABLE SFX.t_func_rol
ADD CONSTRAINT FK_func_rol_01 FOREIGN KEY (Fxr_Fun_Id) 
    REFERENCES SFX.t_funcionalidades (Fun_Id) 
--Agregamos Foreign Key a tabla "Funcionalidades por Rol"
ALTER TABLE SFX.t_func_rol
ADD CONSTRAINT FK_func_rol_02 FOREIGN KEY (Fxr_Rol_Id) 
    REFERENCES SFX.t_roles (Rol_Id)

/*---------------------MIGRAMOS TABLA gd_Esquema.Maestra A LAS NUEVAS TABLAS---------------------*/

--Migramos datos de la tabla maestra a tabla "Servicios"--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO [SFX].t_servicios
(Ser_Descripcion, Ser_Porcentaje_Adicional)
SELECT a.Tipo_Servicio, CASE a.tipo_Servicio 
						WHEN 'Primera Clase' THEN 30
						WHEN 'Ejecutivo' THEN 20
						WHEN 'Turista' THEN 10
						ELSE 5
						END				
FROM (SELECT DISTINCT m.Tipo_Servicio
	  FROM [gd_esquema].Maestra m) a

--Migramos datos de la tabla maestra a tabla "Ciudades Aeropuertos"---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO SFX.t_ciudades_aeropuertos (Cia_Descripcion)
			SELECT DISTINCT Ruta_Ciudad_Origen
			  FROM gd_esquema.Maestra
			 WHERE Ruta_Ciudad_Origen IS NOT NULL
			UNION
			SELECT DISTINCT Ruta_Ciudad_Destino
			  FROM gd_esquema.Maestra
			 WHERE Ruta_Ciudad_Origen IS NOT NULL
			 ORDER BY 1

--Migramos datos de la tabla maestra a tabla "t_fabricantes"----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO [SFX].t_fabricantes 
(Fab_Nombre)
SELECT	DISTINCT m.Aeronave_Fabricante
FROM [gd_esquema].Maestra m

--Migramos datos de la tabla maestra a tabla "t_roles"----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO SFX.t_roles (Rol_Nombre,Rol_Estado) VALUES ('Administrador General', 'A')
INSERT INTO SFX.t_roles (Rol_Nombre,Rol_Estado) VALUES ('Cliente', 'A')


--Datos predeterminados de LOGIN/SEGURIDAD----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO SFX.t_usuarios (Usu_Username,Usu_Password,Usu_Fecha_Creacion,Usu_Fecha_Modif,Usu_Preg_Secreta,
							Usu_Resp_Secreta,Usu_Fecha_Baja)
VALUES ('ADMIN', HASHBYTES('SHA2_256', 'w23e'), GETDATE(), NULL, 'pregunta', 'respuesta',NULL)
INSERT INTO SFX.t_usuarios (Usu_Username,Usu_Password,Usu_Fecha_Creacion,Usu_Fecha_Modif,Usu_Preg_Secreta,
							Usu_Resp_Secreta,Usu_Fecha_Baja)
VALUES ('CLIENTE', HASHBYTES('SHA2_256', 'w24e'), GETDATE(), NULL, 'pregunta', 'respuesta',NULL)

INSERT INTO [SFX].[t_funcionalidades] VALUES ('abm_rol')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('login_seguridad')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('registro_usuario')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('abm_ciudad')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('abm_ruta')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('abm_aerolinea')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('generacion_viaje')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('registro_llegada')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('compra')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('devolucion_cancelacion')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('consulta_millas')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('canje_millas')
INSERT INTO [SFX].[t_funcionalidades] VALUES ('listados')

INSERT INTO [SFX].[t_rol_usuario] VALUES (1,1) 
INSERT INTO [SFX].[t_rol_usuario] VALUES (2,2) 

INSERT INTO [SFX].[t_func_rol] VALUES (1,1)
INSERT INTO [SFX].[t_func_rol] VALUES (2,1)
INSERT INTO [SFX].[t_func_rol] VALUES (3,1)
INSERT INTO [SFX].[t_func_rol] VALUES (4,1)
INSERT INTO [SFX].[t_func_rol] VALUES (5,1)
INSERT INTO [SFX].[t_func_rol] VALUES (6,1)
INSERT INTO [SFX].[t_func_rol] VALUES (7,1)
INSERT INTO [SFX].[t_func_rol] VALUES (8,1)
INSERT INTO [SFX].[t_func_rol] VALUES (9,1)
INSERT INTO [SFX].[t_func_rol] VALUES (10,1)
INSERT INTO [SFX].[t_func_rol] VALUES (11,1)
INSERT INTO [SFX].[t_func_rol] VALUES (12,1)
INSERT INTO [SFX].[t_func_rol] VALUES (13,1)


--Migramos datos de la tabla maestra a tabla "t_modelos"--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO [SFX].[t_modelos] 
SELECT DISTINCT a.aeronave_modelo, b.Fab_ID
FROM [gd_esquema].[Maestra] a, [SFX].t_fabricantes b
WHERE a.Aeronave_Fabricante =  b.Fab_Nombre

--Migramos datos de la tabla maestra a tabla ""-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Migramos datos de la tabla maestra a tabla ""-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Migramos datos de la tabla maestra a tabla ""-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Migramos datos de la tabla maestra a tabla ""-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------


--Migramos datos de la tabla maestra a tabla "Clientes"---------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @cli_dni numeric(18,0), @cantidad_clientes int;

--| Cursor principal para obtener la cantidad de repeticiones
DECLARE clientes_cursor CURSOR FOR 
 SELECT Cli_Dni, COUNT(*)
   FROM	(SELECT Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac
		   FROM gd_esquema.Maestra
		  WHERE Cli_Dni IS NOT NULL
		  GROUP BY Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac) m
  GROUP BY Cli_Dni;

OPEN clientes_cursor

FETCH NEXT FROM clientes_cursor INTO @cli_dni, @cantidad_clientes

WHILE @@FETCH_STATUS = 0
BEGIN

	IF @cantidad_clientes = 1 --VALIDOS
	BEGIN
		INSERT INTO SFX.t_clientes (Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac, Cli_Fecha_Baja, Cli_Usu_Id)
			 			 SELECT DISTINCT Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac, NULL, NULL
						   FROM gd_esquema.Maestra
						  WHERE Cli_Dni = @cli_dni;
	END 
	ELSE	-- NO VALIDOS
	BEGIN
		INSERT INTO SFX.t_clientes (Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac, Cli_Fecha_Baja, Cli_Usu_Id)
			 			 SELECT DISTINCT Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac, getdate() /*DADO DE BAJA O INVALIDO*/, NULL
						   FROM gd_esquema.Maestra
						  WHERE Cli_Dni = @cli_dni;
	END

	FETCH NEXT FROM clientes_cursor INTO @cli_dni, @cantidad_clientes
END 
CLOSE clientes_cursor
DEALLOCATE clientes_cursor


--Migramos datos de la tabla maestra a tabla "Rutas"------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
SET NOCOUNT ON;
DECLARE @ruta_codigo numeric, @cantidad int;

--| Cursor principal para obtener la cantidad de repeticiones
DECLARE rutas_cursor CURSOR FAST_FORWARD FOR 
SELECT	b.Ruta_Codigo, 
		COUNT(1) CANTIDAD 
FROM (SELECT DISTINCT a.Ruta_Codigo, 
					  a.Ruta_Ciudad_Origen, 
					  a.Ruta_Ciudad_Destino
	   FROM [gd_esquema].Maestra a) b
GROUP BY b.Ruta_Codigo
ORDER BY b.Ruta_Codigo;


OPEN rutas_cursor

FETCH NEXT FROM rutas_cursor 
INTO @ruta_codigo, @cantidad

WHILE @@FETCH_STATUS = 0
BEGIN

   
	INSERT INTO SFX.t_rutas (Rut_Codigo, Rut_Precio_BaseKG, Rut_Precio_BasePasaje, Rut_Fecha_Baja, Rut_Cia_ID_Origen, Rut_Cia_ID_Destino,Rut_Ser_ID)	
	SELECT tbl.Ruta_Codigo, 
			(SELECT DISTINCT m.Ruta_Precio_BaseKG FROM [gd_esquema].Maestra m
			 WHERE m.Ruta_Codigo = tbl.Ruta_Codigo 
			 AND m.Ruta_Ciudad_Origen = tbl.Ruta_Ciudad_Origen
			 AND m.Ruta_Ciudad_Destino = tbl.Ruta_Ciudad_Destino
			 AND m.Paquete_Codigo <> 0), --PRECIO_BASE_KG
			(SELECT DISTINCT m.Ruta_Precio_BasePasaje FROM [gd_esquema].Maestra m
			 WHERE m.Ruta_Codigo = tbl.Ruta_Codigo 
			 AND m.Ruta_Ciudad_Origen = tbl.Ruta_Ciudad_Origen
			 AND m.Ruta_Ciudad_Destino = tbl.Ruta_Ciudad_Destino
			 AND m.Pasaje_Codigo <> 0), --PRECIO_BASE_PASAJE
			 CASE 
				WHEN @cantidad > 1 THEN GETDATE() --FECHA DE BAJA PARA REGISTRO INVALIDO
				ELSE NULL
			END,
			(SELECT Cia_ID FROM SFX.t_ciudades_aeropuertos WHERE Cia_Descripcion = Ruta_Ciudad_Origen),
			(SELECT Cia_ID FROM SFX.t_ciudades_aeropuertos WHERE Cia_Descripcion = Ruta_Ciudad_Destino),
			tbl.Ser_ID			
			 
	FROM 
	(SELECT DISTINCT m.Ruta_Codigo, 
					m.Ruta_Ciudad_Origen,
					m.Ruta_Ciudad_Destino,
					s.Ser_ID
	FROM [gd_esquema].Maestra m , SFX.t_servicios s
	WHERE	m.Ruta_Codigo = @ruta_codigo
	AND		s.Ser_Descripcion = m.Tipo_Servicio) tbl
  

    FETCH NEXT FROM rutas_cursor 
    INTO @ruta_codigo, @cantidad
END 
CLOSE rutas_cursor;
DEALLOCATE rutas_cursor

--Migramos datos de la tabla maestra a tabla "t_tipo_butacas"---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO [SFX].[t_tipo_butacas] 
SELECT DISTINCT Butaca_Tipo
FROM [gd_esquema].[Maestra]
WHERE Butaca_Tipo <> '0'

--Migramos datos de la tabla maestra a tabla "t_aeronaves"------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE 
@aer_matricula nvarchar(255), @modelo nvarchar(255), @fabricante nvarchar(255), @aer_kg numeric(18,0), @servicio  nvarchar(255),
@modelo_id int, @serv_id int ; 

--- Cursor principal 
DECLARE aeronave_cursor CURSOR FOR 
	select distinct Aeronave_Matricula, Aeronave_Modelo,Aeronave_Fabricante,Aeronave_KG_Disponibles, Tipo_Servicio 
	from gd_esquema.Maestra;

OPEN aeronave_cursor

FETCH NEXT FROM aeronave_cursor INTO @aer_matricula, @modelo, @fabricante, @aer_kg, @servicio

WHILE @@FETCH_STATUS = 0
BEGIN
  
	SET @modelo_id = (select Mod_ID from SFX.t_modelos 
						where Mod_Nombre=@modelo 
						and Mod_Fab_ID = (select Fab_ID from SFX.t_fabricantes where Fab_Nombre=@fabricante)
					 )
	SET @serv_id   = (select Ser_ID from SFX.t_servicios where Ser_Descripcion=@servicio)

	INSERT INTO SFX.t_aeronaves 
			   values ( @aer_matricula, @modelo_id, @aer_kg, '01-01-2000',NULL,NULL,NULL,@serv_id) 

	FETCH NEXT FROM aeronave_cursor INTO @aer_matricula, @modelo, @fabricante, @aer_kg, @servicio
END 
CLOSE aeronave_cursor
DEALLOCATE aeronave_cursor



/*---------------------CREACIÓN DE FUNCTIONS, PROCEDURES, TRIGGERS Y VIEWS---------------------*/

