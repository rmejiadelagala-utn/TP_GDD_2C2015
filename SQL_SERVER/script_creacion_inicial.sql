/*---------------------CREACIÖN DEL ESQUEMA----------------*/

--Indico DB a utilizar
USE GD2C2015
--Si no existe el esquema, entonces, lo creo
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SFX')
BEGIN
	EXEC ('CREATE SCHEMA SFX AUTHORIZATION gd')
END

/*---------------------ELIMINACIÓN DE TABLAS---------------------*/
IF OBJECT_ID('SFX.t_devolucion_pasaje') IS NOT NULL
DROP TABLE SFX.t_devolucion_pasaje 
IF OBJECT_ID('SFX.t_devolucion_paquete') IS NOT NULL
DROP TABLE SFX.t_devolucion_paquete 
IF OBJECT_ID('SFX.t_devoluciones') IS NOT NULL
DROP TABLE SFX.t_devoluciones
IF OBJECT_ID('SFX.t_butacas_viaje') IS NOT NULL
DROP TABLE SFX.t_butacas_viaje 
IF OBJECT_ID('SFX.t_pasajes') IS NOT NULL
DROP TABLE SFX.t_pasajes
IF OBJECT_ID('SFX.t_paquetes') IS NOT NULL
DROP TABLE SFX.t_paquetes
IF OBJECT_ID('SFX.t_butacas') IS NOT NULL
DROP TABLE SFX.t_butacas
IF OBJECT_ID('SFX.t_compras') IS NOT NULL
DROP TABLE SFX.t_compras
IF OBJECT_ID('SFX.t_tarjetas') IS NOT NULL
DROP TABLE SFX.t_tarjetas
IF OBJECT_ID('SFX.t_tipo_tarjetas_cuotas') IS NOT NULL
DROP TABLE SFX.t_tipo_tarjetas_cuotas
IF OBJECT_ID('SFX.t_tipo_tarjetas') IS NOT NULL
DROP TABLE SFX.t_tipo_tarjetas
IF OBJECT_ID('SFX.t_formas_pago') IS NOT NULL
DROP TABLE SFX.t_formas_pago
IF OBJECT_ID('SFX.t_premio_canje') IS NOT NULL
DROP TABLE SFX.t_premio_canje
IF OBJECT_ID('SFX.t_premio') IS NOT NULL
DROP TABLE SFX.t_premio
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
IF OBJECT_ID('SFX.t_milla_detalle') IS NOT NULL
DROP TABLE SFX.t_milla_detalle
IF OBJECT_ID('SFX.ExisteUsuario') IS NOT NULL
DROP FUNCTION SFX.ExisteUsuario
IF OBJECT_ID('SFX.GetCiudades') IS NOT NULL
DROP PROCEDURE SFX.GetCiudades
IF OBJECT_ID('SFX.InsertarCiudad') IS NOT NULL
DROP PROCEDURE SFX.InsertarCiudad
IF OBJECT_ID('SFX.ModificarCiudad') IS NOT NULL
DROP PROCEDURE SFX.ModificarCiudad
IF OBJECT_ID('SFX.BajaCiudad') IS NOT NULL
DROP PROCEDURE SFX.BajaCiudad

--Tablas temporales
IF OBJECT_ID('tempdb..#tpm_repeticiones') IS NOT NULL
DROP TABLE SFX.#tpm_repeticiones
IF OBJECT_ID('tempdb..#tpm_aeronaves') IS NOT NULL
DROP TABLE SFX.#tpm_aeronaves
IF OBJECT_ID('tempdb..#tmp_maestra') IS NOT NULL
DROP TABLE SFX.#tmp_maestra

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
	Cli_Fecha_Baja		datetime
	
)


--Creación tabla "Pasajes"
CREATE TABLE SFX.t_pasajes (
	Pas_Codigo			numeric(18,0) NOT NULL,
	Pas_Precio			numeric(18,2) NULL,
	Pas_FechaCompra		datetime NULL,
	Pas_Estado			nvarchar(255),
	Pas_But_ID			int,
	Pas_Cli_ID			int,
	Pas_Com_id			int	
)
--Creación tabla "Paquetes"
CREATE TABLE SFX.t_paquetes (
	Paq_Codigo			numeric(18,0) NOT NULL,
	Paq_Precio			numeric(18,2) NULL,
	Paq_KG				numeric(18,0) NULL,
	Paq_FechaCompra		datetime NULL,
	--Paq_Via_ID			int,
	Paq_Cli_ID			int,
	Paq_Com_id			int
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
	Via_Invalido				bit		-- 1=Invalido, 0=valido
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
	Tta_Nombre				nvarchar(255)
	--Tta_Cuotas				int
)
--Creación tabla "Tarjetas"
CREATE TABLE SFX.t_tarjetas (
	Tar_ID					int identity,
	Tar_Numero				nvarchar(16),
--	Tar_Fecha_Emision		datetime,
	Tar_Fecha_Vencimiento	datetime,
	Tar_Codigo_Seg			nvarchar(3),
	Tar_Tta_ID				int
)
--Creación tabla "Tipos de Tarjeta Cuotas"
CREATE TABLE SFX.t_tipo_tarjetas_cuotas (
	Ttc_ID					int identity,
	Ttc_Tta_ID				int,
	Ttc_Cant_cuotas			int
)

--Creación tabla "Compras"
CREATE TABLE SFX.t_compras (
	Com_ID					int identity,
	Com_Cli_ID				int,
	Com_Via_ID				int,
	Com_Fpa_ID				int,
	Com_Tar_ID				int
	--Com_Importe				numeric(18,2)
)

--Creación tabla "Devoluciones"
CREATE TABLE SFX.t_devoluciones (
	Dev_ID					int identity,
	Dev_Com_id				int,
	Dev_motivo				NVARCHAR(255),
	Dev_fecha				DATE
)

--Creación tabla "Detalle de las devoluciones"
CREATE TABLE SFX.t_devolucion_pasaje (
	Dps_ID					int identity,
	Dps_Dev_ID				int,
	Dps_pas_ID				numeric(18,0)
)

--Creación tabla "Detalle de las devoluciones"
CREATE TABLE SFX.t_devolucion_paquete (
	Dpq_ID					int identity,
	Dpq_Dev_ID				int,
	Dpq_paq_id				numeric(18,0)
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

--Creación tabla "Premio"
CREATE TABLE SFX.t_premio(
	Pre_Id				int identity,
	Pre_Descripcion		nvarchar(255),
	Pre_Valor_puntos	int,
	Pre_Stock			int,
	Pre_fecha_baja		date
)

--Creación tabla "Premio canje"
CREATE TABLE SFX.t_premio_canje(
	pca_Id				int identity,
	pca_pre_id			int,
	pca_cli_id			int,
	pca_puntos			int,	
	pca_cantidad		int,
	pca_fecha			date
)

--Creación tabla "Premio canje"
CREATE TABLE SFX.t_milla_detalle(
	mde_Id				int identity,
	mde_cli_id			int,
	mde_milla			numeric(18,0),	
	mde_pas_id			int,
	mde_paq_id			int,
	mde_fecha_alta		date,
	mde_fecha_vig		date		--La vigencia es de 1 año
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
--Agregamos Primary Key a tabla ""Tipo de Tarjeta Cuotas"
ALTER TABLE SFX.t_tipo_tarjetas_cuotas
ADD CONSTRAINT PK_t_tipo_tarjetas_cuotas PRIMARY KEY(Ttc_ID)
--Agregamos Primary Key a tabla ""Tipo de Tarjeta"
ALTER TABLE SFX.t_tipo_tarjetas
ADD CONSTRAINT PK_t_tipo_tarjetas PRIMARY KEY(Tta_ID)
--Agregamos Primary Key a tabla ""Tarjetas"
ALTER TABLE SFX.t_tarjetas
ADD CONSTRAINT PK_t_tarjetas PRIMARY KEY(Tar_ID)
--Agregamos Primary Key a tabla ""Compras"
ALTER TABLE SFX.t_compras
ADD CONSTRAINT PK_t_compras PRIMARY KEY(Com_ID)
--Agregamos Primary Key a tabla "Devoluciones"
ALTER TABLE SFX.t_devoluciones
ADD CONSTRAINT PK_t_devoluciones PRIMARY KEY(Dev_ID)
--Agregamos Primary Key a tabla "Devolucion pasaje"
ALTER TABLE SFX.t_devolucion_pasaje
ADD CONSTRAINT PK_t_devolucion_pasaje PRIMARY KEY(Dps_ID)
--Agregamos Primary Key a tabla "Devolucion paquete"
ALTER TABLE SFX.t_devolucion_paquete
ADD CONSTRAINT PK_t_devolucion_paquete PRIMARY KEY(Dpq_ID)
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

ALTER TABLE SFX.t_premio
ADD CONSTRAINT PK_t_premio PRIMARY KEY(Pre_Id)

ALTER TABLE SFX.t_premio_canje
ADD CONSTRAINT PK_t_premio_canje PRIMARY KEY(Pca_Id)

/*---------------------AGREGAMOS FOREIGN KEYS---------------------*/
--Agregamos Foreign Key a tabla "Pasajes 01"
ALTER TABLE SFX.t_pasajes
ADD CONSTRAINT FK_t_pasajes_01 FOREIGN KEY (Pas_Cli_ID) 
    REFERENCES SFX.t_clientes (Cli_ID) 
--Agregamos Foreign Key a tabla "Pasajes 02"
ALTER TABLE SFX.t_pasajes
ADD CONSTRAINT FK_t_pasajes_02 FOREIGN KEY (Pas_But_ID) 
    REFERENCES SFX.t_butacas (But_ID) 
--Agregamos Foreign Key a tabla "Pasajes 03"
ALTER TABLE SFX.t_pasajes
ADD CONSTRAINT FK_t_pasajes_03 FOREIGN KEY (Pas_Com_id) 
    REFERENCES SFX.t_compras (Com_ID) 
--Agregamos Foreign Key a tabla "Paquetes 01"
ALTER TABLE SFX.t_paquetes
ADD CONSTRAINT FK_t_paquetes_01 FOREIGN KEY (Paq_Cli_ID) 
    REFERENCES SFX.t_clientes (Cli_ID) 
--Agregamos Foreign Key a tabla "Paquetes 02"
ALTER TABLE SFX.t_paquetes
ADD CONSTRAINT FK_t_paquetes_03 FOREIGN KEY (Paq_Com_id) 
    REFERENCES SFX.t_compras (Com_id) 
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
--Agregamos Foreign Key a tabla "Modelos 01"
ALTER TABLE SFX.t_modelos 
ADD CONSTRAINT FK_t_modelos_01 FOREIGN KEY (Mod_Fab_ID) 
    REFERENCES SFX.t_fabricantes (Fab_ID)
--Agregamos Foreign Key a tabla "Tarjetas 01"
ALTER TABLE SFX.t_tarjetas 
ADD CONSTRAINT FK_t_tarjetas_01 FOREIGN KEY (Tar_Tta_ID) 
    REFERENCES SFX.t_tipo_tarjetas (Tta_ID)
--Agregamos Foreign Key a tabla "Tipo Tarjetas Cuotas 01"
ALTER TABLE SFX.t_tipo_tarjetas_cuotas 
ADD CONSTRAINT FK_t_tipo_tarjetas_cuotas_01 FOREIGN KEY (Ttc_Tta_ID) 
    REFERENCES SFX.t_tipo_tarjetas (Tta_Id)
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
ALTER TABLE SFX.t_devoluciones 
ADD CONSTRAINT FK_t_devoluciones_01 FOREIGN KEY (Dev_Com_ID) 
    REFERENCES SFX.t_compras (Com_ID)
ALTER TABLE SFX.t_devolucion_pasaje
ADD CONSTRAINT FK_t_devolucion_pasaje_01 FOREIGN KEY (Dps_Dev_ID) 
    REFERENCES SFX.t_devoluciones (Dev_ID)
ALTER TABLE SFX.t_devolucion_pasaje 
ADD CONSTRAINT FK_t_devolucion_pasaje_02 FOREIGN KEY (Dps_Pas_ID) 
    REFERENCES SFX.t_pasajes (Pas_Codigo)
ALTER TABLE SFX.t_devolucion_paquete 
ADD CONSTRAINT FK_t_t_devolucion_paquete_01 FOREIGN KEY (Dpq_Dev_ID) 
    REFERENCES SFX.t_devoluciones (Dev_ID)
ALTER TABLE SFX.t_devolucion_paquete 
ADD CONSTRAINT FK_t_devolucion_paquete_02 FOREIGN KEY (Dpq_Paq_ID) 
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
ALTER TABLE SFX.t_premio_canje
ADD CONSTRAINT FK_t_premio_canje_01 FOREIGN KEY (pca_pre_id) 
    REFERENCES SFX.t_premio (Pre_Id)
ALTER TABLE SFX.t_premio_canje
ADD CONSTRAINT FK_t_premio_canje_02 FOREIGN KEY (pca_cli_id) 
    REFERENCES SFX.t_clientes (Cli_Id)

--INDICES

CREATE NONCLUSTERED INDEX IDXCLIENTE_DNI ON SFX.t_clientes(cli_dni)


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

--Migramos datos de la tabla maestra a tabla "Forma de Pagos"-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO [SFX].[t_formas_pago] VALUES ('contado')
INSERT INTO [SFX].[t_formas_pago] VALUES ('tarjeta_credito')


--Migramos datos de la tabla maestra a tabla "Clientes"---------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT Cli_Dni, COUNT(*) repeticiones
INTO SFX.#tpm_repeticiones
FROM	(SELECT Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac
		   FROM gd_esquema.Maestra
GROUP BY Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac) m
GROUP BY Cli_Dni;


INSERT INTO SFX.t_clientes (Cli_Nombre, Cli_Apellido, Cli_Dni, Cli_Dir, Cli_Telefono, Cli_Mail, Cli_Fecha_Nac, Cli_Fecha_Baja)
SELECT DISTINCT m1.Cli_Nombre, 
				m1.Cli_Apellido, 
				m1.Cli_Dni, 
				m1.Cli_Dir, 
				m1.Cli_Telefono, 
				m1.Cli_Mail, 
				m1.Cli_Fecha_Nac,
				CASE 
					WHEN r.repeticiones > 1 
						THEN getdate()
					ELSE
						null
				END baja
FROM gd_esquema.Maestra m1,
     SFX.#tpm_repeticiones r
WHERE m1.Cli_Dni = r.Cli_Dni



--Migramos datos de la tabla maestra a tabla "t_tipo_butacas"---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO [SFX].[t_tipo_butacas] 
SELECT DISTINCT Butaca_Tipo
FROM [gd_esquema].[Maestra]
WHERE Butaca_Tipo <> '0'


--Migramos datos de la tabla maestra a tabla "Rutas"------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
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

BEGIN TRANSACTION

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
	FROM [gd_esquema].Maestra m, 
		 SFX.t_servicios s
	WHERE	m.Ruta_Codigo = @ruta_codigo
	AND		s.Ser_Descripcion = m.Tipo_Servicio) tbl
  

    FETCH NEXT FROM rutas_cursor 
    INTO @ruta_codigo, @cantidad
END 
CLOSE rutas_cursor;
DEALLOCATE rutas_cursor

COMMIT TRANSACTION


--Migramos datos de la tabla maestra a tabla "t_aeronaves"------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT Aeronave_Matricula, Aeronave_Modelo,Aeronave_Fabricante,Aeronave_KG_Disponibles, Tipo_Servicio
INTO SFX.#tpm_aeronaves
FROM gd_esquema.Maestra

INSERT INTO SFX.t_aeronaves 
SELECT a.Aeronave_Matricula, c.Mod_ID, a.Aeronave_KG_Disponibles, CONVERT(datetime,'01-01-2000',121), NULL, NULL, NULL, d.Ser_ID 
FROM SFX.#tpm_aeronaves a,
	 SFX.t_fabricantes b,
	 SFX.t_modelos  c,
	 SFX.t_servicios d
WHERE a.Aeronave_Fabricante = b.Fab_Nombre
and   b.Fab_ID = c.Mod_Fab_ID
AND   A.Aeronave_Modelo = c.Mod_Nombre
AND   A.Tipo_Servicio = d.Ser_Descripcion


--Migramos datos de la tabla maestra a tabla "t_butacas"--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE 
@aeronave nvarchar(255), @nroButaca numeric(3,0), @pisoButaca  numeric(1,0), @tipoButaca nvarchar(255),
@aeronave_id int, @tipoButaca_id int ; 

--- Cursor principal de butacas 
DECLARE butaca_cursor CURSOR FOR 
	select distinct Aeronave_Matricula, Butaca_Nro, Butaca_Piso, Butaca_Tipo
	from gd_esquema.Maestra
	where Butaca_Tipo <> '0' 


OPEN butaca_cursor

FETCH NEXT FROM butaca_cursor INTO @aeronave, @nroButaca, @pisoButaca, @tipoButaca

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @aeronave_id   = (SELECT Aer_ID FROM SFX.t_aeronaves WHERE Aer_Matricula=@aeronave)
	SET @tipoButaca_id = (SELECT Tbu_ID FROM SFX.t_tipo_butacas WHERE Tbu_Descripcion=@tipoButaca)

	INSERT INTO SFX.t_butacas
			VALUES (@nroButaca, @pisoButaca, @aeronave_id, @tipoButaca_id)

	FETCH NEXT FROM butaca_cursor INTO @aeronave, @nroButaca, @pisoButaca, @tipoButaca
END

CLOSE butaca_cursor
DEALLOCATE butaca_cursor

--Migramos datos de la tabla maestra a tabla "t_viajes"--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE
--@ruta_codigo numeric, 
@aero_matricula nvarchar(255), 
@tipoServicio nvarchar(255), 
@fechSalida datetime, 
@fechLlegadaEstimada datetime, 
@fechLlegada datetime,
@duplic int, 
@ID_tipoServAeronave int, 
@ID_tipoServRuta int, 
@Id_aeronave int, @Id_ruta int,
@Ruta_Ciudad_Origen nvarchar(255),
@Ruta_Ciudad_Destino nvarchar(255)


DECLARE cursor_viajes CURSOR FOR
SELECT DISTINCT ruta_codigo,Aeronave_Matricula, Tipo_Servicio, FechaSalida, Fecha_LLegada_Estimada, FechaLLegada,
				m.Ruta_Ciudad_Origen, m.Ruta_Ciudad_Destino
FROM gd_esquema.Maestra m

BEGIN TRANSACTION

OPEN cursor_viajes
FETCH NEXT FROM cursor_viajes 
INTO @ruta_codigo, @aero_matricula, @tipoServicio, @fechSalida, @fechLlegadaEstimada, @fechLlegada,@Ruta_Ciudad_Origen,@Ruta_Ciudad_Destino

WHILE @@FETCH_STATUS = 0
BEGIN


	---- cargamos variables para realizar las validaciones en seccion CASE ----
	SET @duplic=(select count(*) from SFX.t_rutas where Rut_Codigo=@ruta_codigo)
	SET @Id_ruta = CASE WHEN @duplic>1 
						THEN  (select Rut_ID from SFX.t_rutas r where r.Rut_Codigo= @ruta_codigo
							   AND r.Rut_Cia_ID_Origen = (select cia_id from sfx.t_ciudades_aeropuertos where Cia_Descripcion = @Ruta_Ciudad_Origen)
							   and r.Rut_Cia_ID_Destino = (select cia_id from sfx.t_ciudades_aeropuertos where Cia_Descripcion =  @Ruta_Ciudad_Destino)
							   and r.Rut_Ser_ID = (select ser_id from sfx.t_servicios where Ser_Descripcion =  @tipoServicio))
							    --si es ruta duplicadas tomamos la primera que levanta.
					    ELSE (select Rut_ID from SFX.t_rutas where Rut_Codigo=@ruta_codigo) -- si no es duplicada hago el select directo.
					END
	SET @ID_tipoServAeronave =(select Aer_Ser_ID from SFX.t_aeronaves where Aer_Matricula=@aero_matricula)
	SET @ID_tipoServRuta     =(select Rut_Ser_ID from SFX.t_rutas where Rut_ID=@Id_ruta)
	SET @Id_aeronave=(select Aer_ID from SFX.t_aeronaves where Aer_Matricula=@aero_matricula)

	
	--- Hacemos el insert ---
	Insert into SFX.t_viajes values (
	@Id_ruta,
	@Id_aeronave,
	@fechSalida,
	@fechLlegada,
	@fechLlegadaEstimada,
	
	----Seccion validaciones, sobre el viaje ---
	CASE
		WHEN @fechSalida < GETDATE() 
			THEN 1  --validacion que fecha de salida sea mayor a la actual
		WHEN @ID_tipoServAeronave<>@ID_tipoServRuta 
			THEN 1 -- validacion de coincidencia de servicio ruta vs nave
		WHEN @fechLlegadaEstimada > DATEADD(DAY,1,@fechSalida) 
			THEN 1  -- la fecha estimada no puede ser de mas de 24 horas
		WHEN EXISTS (select 1 from SFX.t_viajes 
					 where Via_Aer_ID=@Id_aeronave and Via_Fecha_Salida=@fechSalida) 
			THEN 1 --validamos si ya existe avion con la misma fecha de salida.
		ELSE
			0  -- Si superó todas las validaciones, entonces el viaje es valido.
	END
	)


FETCH NEXT FROM cursor_viajes 
INTO @ruta_codigo, @aero_matricula, @tipoServicio, @fechSalida, @fechLlegadaEstimada, @fechLlegada ,@Ruta_Ciudad_Origen,@Ruta_Ciudad_Destino

END

CLOSE cursor_viajes
DEALLOCATE cursor_viajes

COMMIT TRANSACTION

--Migramos datos de la tabla maestra a tabla "t_compras - t_pasajes - t_paquetes - t_butacas_viaje"--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE 

@registro_num INT,           
@Regs INT,
@id int,
@Cli_Dni numeric(18,0),
@Cli_nombre nvarchar(255), 
@Cli_apellido nvarchar(255), 
@CodigoPasaje numeric(18,0), 
@pasaje_fecha datetime, 
@pasaje_precio  numeric(18,2), 
@MatriculaAeronave nvarchar(255),
@id_butaca int, 
@id_cliente int, 
@fecha_baja datetime,
@Ciudad_origen nvarchar(255),
@Ciudad_Destino nvarchar(255),
@tipo_servicio nvarchar(255),
@id_tipo_servicio int,
@id_ciudad_origen int,
@id_ciudad_destino int,
@fecha_salida datetime,
@fecha_llegada datetime,
@fecha_llegada_estimada datetime,
@paquete_codigo numeric(18,0),
@paquete_fecha datetime,
@paquete_KG numeric(18,0),
@paquete_precio numeric(18,0),
@aer_id int,
@rut_id int,
@via_id int,
@id_compra int


BEGIN

SELECT  IDENTITY(INT, 1, 1) as ID,
	   m.Cli_Dni,
	   m.Cli_Nombre,
	   m.cli_apellido,
	   m.Pasaje_Codigo, 
	   m.Pasaje_FechaCompra, 
	   m.Pasaje_Precio,
	   (select But_ID from SFX.t_butacas 
	    where But_Aer_ID= (select Aer_ID from SFX.t_aeronaves where Aer_Matricula = m.Aeronave_Matricula)
	    and But_Numero =  m.Butaca_Nro) AS But_ID,
	   m.Paquete_Codigo, 
	   m.Paquete_FechaCompra, 
	   m.Paquete_KG, 
	   m.Paquete_Precio,
	   (select Aer_ID from SFX.t_aeronaves where Aer_Matricula = m.Aeronave_Matricula) as aer_id,
	   (select Rut_ID from [SFX].[t_rutas] 
							where Rut_Codigo = m.Ruta_Codigo 
							and Rut_Cia_ID_Destino = (select Cia_ID from [SFX].[t_ciudades_aeropuertos] where Cia_Descripcion = m.Ruta_Ciudad_Destino)
							and Rut_Cia_ID_Origen =  (select Cia_ID from [SFX].[t_ciudades_aeropuertos] where Cia_Descripcion = m.Ruta_Ciudad_Origen)
							and Rut_Ser_ID = (select Ser_ID from [SFX].[t_servicios] where Ser_Descripcion = m.Tipo_Servicio)) as  rut_id,

	    (select Via_ID from [SFX].[t_viajes] 
	     where Via_Aer_ID = (select Aer_ID from SFX.t_aeronaves where Aer_Matricula = m.Aeronave_Matricula)
	     and Via_Rut_ID = (select Rut_ID from [SFX].[t_rutas] 
							where Rut_Codigo = m.Ruta_Codigo 
							and Rut_Cia_ID_Destino = (select Cia_ID from [SFX].[t_ciudades_aeropuertos] where Cia_Descripcion = m.Ruta_Ciudad_Destino)
							and Rut_Cia_ID_Origen =  (select Cia_ID from [SFX].[t_ciudades_aeropuertos] where Cia_Descripcion = m.Ruta_Ciudad_Origen)
							and Rut_Ser_ID = (select Ser_ID from [SFX].[t_servicios] where Ser_Descripcion = m.Tipo_Servicio))
		and Via_Fecha_Salida = m.FechaSalida
		and Via_Fecha_Llegada = m.FechaLLegada
		and Via_Fecha_Llegada_Estimada = m.Fecha_LLegada_Estimada) via_id
	INTO #tmp_maestra
	FROM gd_esquema.Maestra m;

CREATE UNIQUE NONCLUSTERED INDEX Idx1 ON #tmp_maestra(id)

SET @registro_num = 1   
SET @Regs = (SELECT COUNT(*) FROM #tmp_maestra)
Print @Regs

BEGIN TRANSACTION

-- Hacemos el Loop
WHILE @registro_num <= @Regs
BEGIN
    
	SELECT @id = t.id,
			@Cli_Dni = t.Cli_Dni,
			@Cli_nombre = t.Cli_Nombre,
			@Cli_apellido = t.Cli_Apellido,
			@CodigoPasaje = t.Pasaje_Codigo, 
			@pasaje_fecha = t.pasaje_FechaCompra,
			@pasaje_precio = t.pasaje_precio,
			@id_butaca = t. but_id,
			@paquete_codigo = t.paquete_codigo,
			@paquete_fecha = t.paquete_FechaCompra,
			@paquete_KG = t.paquete_kg,
			@paquete_precio = t.paquete_precio,
			@aer_id = t.aer_id,
			@rut_id = t.rut_id,
			@via_id = t.via_id
	FROM #tmp_maestra t
	WHERE t.id = @registro_num
 
	--Obtengo el id_cliente
	SELECT @id_cliente = Cli_ID FROM SFX.t_clientes
	WHERE Cli_Dni = @Cli_Dni

	--Queda null para el caso duplicado
	IF @id_cliente IS NULL
		SET @id_cliente = (SELECT Cli_ID FROM SFX.t_clientes  
							WHERE Cli_Dni = @Cli_Dni
							AND Cli_Nombre = @Cli_nombre 
							AND Cli_Apellido=@Cli_apellido)
	

    INSERT INTO [SFX].[t_compras] 
		VALUES (@id_cliente, @via_id, 1, NULL)

		--Guardamos el id_compra generado
		SET @id_compra = @@IDENTITY

		--Si tiene precio de pasaje insert en t_pasaje
		IF @pasaje_precio > 0 
		BEGIN

			INSERT INTO [SFX].[t_pasajes] 
			VALUES (@CodigoPasaje,@pasaje_precio,@pasaje_fecha,NULL,@id_butaca,@id_cliente,@id_compra)


			INSERT INTO SFX.t_butacas_viaje
			VALUES (@via_id, @id_butaca, NULL)
		END
		--Tiene precio de paquete insert en t_paquete
		ELSE

			INSERT INTO [SFX].[t_paquetes]
			VALUES (@paquete_codigo,@paquete_precio,@paquete_KG,@paquete_fecha,@id_cliente,@id_compra)


    SET @registro_num = @registro_num + 1

END
COMMIT TRANSACTION

END


/*---------------------CREACIÓN DE FUNCTIONS, PROCEDURES, TRIGGERS Y VIEWS---------------------*/

/*****************************************************************************************/
--

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [SFX].[ExisteUsuario]
(
	
	@Usuario VARCHAR(255), 
	@password VARCHAR(255)
)
RETURNS int
AS
BEGIN

	DECLARE @Result int

	SELECT @Result = COUNT(1) 
	FROM [SFX].[t_usuarios]
	WHERE Usu_Username = @Usuario
	AND   Usu_Password =  HASHBYTES('SHA2_256', @password);

	RETURN @Result

END

GO

/*****************************************************************************************/
--
CREATE PROCEDURE [SFX].[GetCiudades] 

	
AS
BEGIN
	SELECT C.*
	FROM [SFX].[t_ciudades_aeropuertos] C
	WHERE c.Cia_Fecha_Baja IS NOT NULL
END
GO

CREATE PROCEDURE [SFX].[InsertarCiudad] 

	 @CiudadNombre nvarchar(255)
	
AS
BEGIN TRY

	BEGIN TRAN;

	INSERT INTO [SFX].[t_ciudades_aeropuertos] VALUES (@CiudadNombre,NULL);

	COMMIT;

END TRY

BEGIN CATCH
	
	ROLLBACK

	RAISERROR ('Error al dar de alta la ciudad.',16,1)

END CATCH
GO
/*****************************************************************************************/
--
CREATE PROCEDURE [SFX].[ModificarCiudad] 

	@ID				int,
	@CiudadNombre	nvarchar(255)
	
AS
BEGIN TRY

	BEGIN TRAN;

	UPDATE [SFX].[t_ciudades_aeropuertos] 
	   SET Cia_Descripcion = @CiudadNombre
	 WHERE Cia_ID = @ID;

	COMMIT;

END TRY

BEGIN CATCH
	
	ROLLBACK

	RAISERROR ('Error al modificar la ciudad.',16,1)

END CATCH
GO

/*****************************************************************************************/
--
CREATE PROCEDURE [SFX].[BajaCiudad] 

	@ID				int
	
AS
BEGIN TRY

	BEGIN TRAN;

	UPDATE [SFX].[t_ciudades_aeropuertos] 
	   SET Cia_Fecha_Baja = getdate()
	 WHERE Cia_ID = @ID;

	COMMIT;

END TRY

BEGIN CATCH
	
	ROLLBACK

	RAISERROR ('Error al dar de baja la ciudad.',16,1)

END CATCH
GO
/*****************************************************************************************/
--
/*****************************************************************************************/
--
/*****************************************************************************************/
--
/*****************************************************************************************/
--
/*****************************************************************************************/
--