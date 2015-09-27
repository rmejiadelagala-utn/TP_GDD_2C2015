/*---------------------CREACIÖN DEL ESQUEMA----------------*/

--Buscar los comentarios de consulta cono -->  <DUDAS>

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
--IF OBJECT_ID('SFX.t_detalle_compras') IS NOT NULL --<DUDAS> Despues de consultar con el profesor no seria necesaria esta tabla.
--DROP TABLE SFX.t_detalle_compras
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
IF OBJECT_ID('SFX.t_tarjetas') IS NOT NULL	--<DUDAS> Despues de consultar con el profesor no seria necesaria esta tabla.
DROP TABLE SFX.t_tarjetas
IF OBJECT_ID('SFX.t_tipo_tarjetas') IS NOT NULL	--<DUDAS> Despues de consultar con el profesor no seria necesaria esta tabla.
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
IF OBJECT_ID('SFX.t_aeropuertos') IS NOT NULL 
DROP TABLE SFX.t_aeropuertos
IF OBJECT_ID('SFX.t_ciudades') IS NOT NULL
DROP TABLE SFX.t_ciudades
IF OBJECT_ID('SFX.t_servicios') IS NOT NULL
DROP TABLE SFX.t_servicios
IF OBJECT_ID('SFX.t_modelos') IS NOT NULL	--<DUDAS> Despues de consultar con el profesor no seria necesaria esta tabla.
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
IF OBJECT_ID('SFX.t_premios') IS NOT NULL
DROP TABLE SFX.t_premios
IF OBJECT_ID('SFX.t_canjes') IS NOT NULL
DROP TABLE SFX.t_canjes
IF OBJECT_ID('SFX.t_millas_cliente') IS NOT NULL
DROP TABLE SFX.t_millas_cliente



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
	Cli_Usu_Id			int
	--cli_millas		int					--<DUDAS> Independientemente que existe la tabla con el detalle de las millas 
)                                           --al momento de restar dichos puntos este campo soluciona ese casos de uso
--Creación tabla "Pasajes"
CREATE TABLE SFX.t_pasajes (
	Pas_Codigo			numeric(18,0) NOT NULL,
	Pas_Precio			numeric(18,2) NULL,
	Pas_FechaCompra		datetime NULL,
	Pas_Estado			nvarchar(255),
	Pas_But_ID			int,
	Pas_Cli_ID			int,
	Pas_com_id			int	
)
--Creación tabla "Paquetes"
CREATE TABLE SFX.t_paquetes (
	Paq_Codigo			numeric(18,0) NOT NULL,
	Paq_Precio			numeric(18,2) NULL,
	Paq_KG				numeric(18,0) NULL,
	Paq_FechaCompra		datetime NULL,
	Paq_Via_ID			int, --<DUDAS> El viaje ya lo tiene al estar asociado con la compra.
	Paq_Cli_ID			int,
	Paq_com_id			int
)
--Creación tabla "Rutas"
CREATE TABLE SFX.t_rutas (
	Rut_Codigo				numeric(18,0) NOT NULL,
	Rut_Precio_BaseKG		numeric(18,2) NULL,
	Rut_Precio_BasePasaje	numeric(18,2) NULL,
	Rut_Fecha_Baja			datetime,
	Rut_Ciudad_ID_Origen	int,
	Rut_Ciudad_ID_Destino	int,
	Rut_Ser_ID				int
)
--Creación tabla "Aeronaves"
CREATE TABLE SFX.t_aeronaves (
	Aer_ID						int identity,
	Aer_Matricula				nvarchar(255) NULL,
	Aer_Mod_ID					int,
	Aer_KG_Disponibles			numeric(18,0) NULL,
	Aer_Fecha_Alta				datetime,
	Aer_Fecha_Baja_Definitiva	datetime,
	Aer_Fecha_Fuera_Servicio	datetime,
	Aer_Fecha_Reinicio_Servicio	datetime,
	Aer_Fecha_Baja_Vida_Util	datetime,
	Aer_Nro_Aeronave			numeric(18,0),
	Aer_Ser_ID					int
)
--Creación tabla "Ciudades"
CREATE TABLE SFX.t_ciudades (
	Ciu_ID						int identity,
	Ciu_Descripcion				nvarchar(255),
	Ciu_Fecha_Baja				datetime
)
--Creación tabla "Aeropuertos"
CREATE TABLE SFX.t_aeropuertos (
	Aep_ID						int identity,
	Aep_Descripcion				nvarchar(255),
	Aep_Fecha_Alta				datetime,
	Aep_Fecha_Baja				datetime,
	Aep_Ciu_ID					int
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
	Via_Rut_Codigo				numeric(18,0),
	Via_Aer_ID					int,
	Via_Fecha_Salida			datetime,
	Via_Fecha_Llegada			datetime,
	Via_Fecha_Llegada_Estimada	datetime,
	Via_Aep_ID_Procedencia		int,
	Via_Aep_ID_Arribo			int,
	Via_Fecha_Llegada_Destino	datetime --<DUDAS> Esta fecha no seria la Via_Fecha_Llegada? o en que se diferencia.
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
	Buv_Fecha_Baja				datetime	--<DUDAS> Esta fecha es para marcar cuando el viaje se realizó? Por cada viaje esta butaca apareceria, ver si hace falta bajarla.
)											--Podriamos agrear una fecha de alta para el registro. La cancelacion queda registrada en otra parte del modelo.
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
--Creación tabla "Formas de Pago"			--<DUDAS> De la consulta al profesor, nos indico que el tema de las tarjetas la manejaria el sistama externas de dichas tarjetas.
CREATE TABLE SFX.t_formas_pago (
	Fpa_ID					int identity,
	Fpa_Nombre				nvarchar(255),
)
--Creación tabla "Tipos de Tarjeta"			--<DUDAS> De la consulta al profesor, nos indico que el tema de las tarjetas la manejaria el sistama externas de dichas tarjetas.
CREATE TABLE SFX.t_tipo_tarjetas (
	Tta_ID					int identity,
	Tta_Nombre				nvarchar(255),
	Tta_Cuotas				int
)
--Creación tabla "Tarjetas"					--<DUDAS> De la consulta al profesor, nos indico que el tema de las tarjetas la manejaria el sistama externas de dichas tarjetas.
CREATE TABLE SFX.t_tarjetas (
	Tar_ID					int identity,
	Tar_Numero				nvarchar(16),
	Tar_Fecha_Emision		datetime,
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
	Com_Tar_ID				int,			--<DUDAS> Podria ser un campo numerico para guardar el numero de tarjeta y otro para la cantidad de cuotas. Segun el profesor, para simplificar
	Com_Importe				numeric(18,2)
)
--Creación tabla "Detalle de Compras"
--CREATE TABLE SFX.t_detalle_compras (		--<DUDAS> No es necesaria, el codigo de compra va en la tabla paquetes/pasajes.
--	Com_Importe				numeric(18,2)
--	Dec_ID					int identity,
--	Dec_Com_ID				int,
--	Dec_Pas_Codigo			numeric(18,0),
--	Dec_Paq_Codigo			numeric(18,0)
--)
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
	Usu_Password		varchar(20) NOT NULL,
	Usu_Fecha_Creacion	datetime NOT NULL,
	Usu_Fecha_Modif		datetime NOT NULL,
	Usu_Preg_Secreta	varchar(255) NOT NULL,
	Usu_Resp_Secreta	varchar(255) NOT NULL,
	Usu_Fecha_Baja		datetime NOT NULL
)
--Creación tabla "Roles por Usuario"
CREATE TABLE SFX.t_login_intentos (     --<DUDAS> Esta tabla crea un registro por cada intento? o tiene relacion uno a uno con el usuario?
	Log_id				int identity,  --Si es uno a uno se actualiza el horario y la cantidad de intentos?
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
----------------------------------------------------------------
--Creación tabla "Premios"
CREATE TABLE SFX.t_premios(
	pre_id				int identity,
	pre_descripcion		nvarchar(255),
	pre_valor_puntos	int,
	pre_stock			int,
	pre_fecha_alta		datetime,
	pre_fecha_baja		datetime   --<DUDAS> Puede servir en el momento de consultar los premios que puedo canjear,filtrar por los que tienen stock y/o no estan dados de baja
)
--Creación tabla "Canjes"
CREATE TABLE SFX.t_canjes(
	can_id				int identity,
	can_cli_id			int,
	can_pre_codigo		int,
	can_puntos			int,
	can_fecha_canje		datetime
)
--Creación tabla "Milas clientes"
CREATE TABLE SFX.t_millas_cliente(
	mic_id				int identity,
	mic_cli_id			int,			
	mic_cant_millas		int,
	mic_fecha_alta		datetime,
	mic_fecha_vigencia	datetime  		--<DUDAS> Lo agrego pero se debe analizar.	
)
--Creación tabla "Devoluciones"
--CREATE TABLE SFX.t_devoluciones(
--	dev_id				int identity,
--	dev_com_id			int,			
--	dev_motivo			nvarchar(255)			
--)
										--<DUDAS> La devolucion puede ser para una compra completa o para un pasaje o encomienda
										--Por esto seguramente ademas de esta tabla , deberiamos crear otra tabla que extendiendo la t_devoluciones
										--figure el detalle de esa devolucion, es decir, los item a los que se le aplica la devolucion. Ver



--FALTAN LAS CONSTRAINT DE LAS ULTIMAS TABLAS CREADAS

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
ADD CONSTRAINT PK_t_rutas PRIMARY KEY(Rut_Codigo)
--Agregamos Primary Key a tabla "Aeronaves"
ALTER TABLE SFX.t_aeronaves
ADD CONSTRAINT PK_t_aeronaves PRIMARY KEY(Aer_ID)
--Agregamos Primary Key a tabla "Ciudades"
ALTER TABLE SFX.t_ciudades
ADD CONSTRAINT PK_t_ciudades PRIMARY KEY(Ciu_ID)
--Agregamos Primary Key a tabla "Aeropuertos"
ALTER TABLE SFX.t_aeropuertos
ADD CONSTRAINT PK_t_aeropuertos PRIMARY KEY(Aep_ID)
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
--ALTER TABLE SFX.t_detalle_compras
--ADD CONSTRAINT PK_t_detalle_compras PRIMARY KEY(Dec_ID)
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
ADD CONSTRAINT FK_t_rutas_02 FOREIGN KEY (Rut_Ciudad_ID_Origen) 
    REFERENCES SFX.t_ciudades (Ciu_ID) 
--Agregamos Foreign Key a tabla "Rutas 03"
ALTER TABLE SFX.t_rutas
ADD CONSTRAINT FK_t_rutas_03 FOREIGN KEY (Rut_Ciudad_ID_Destino) 
    REFERENCES SFX.t_ciudades (Ciu_ID) 
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
ADD CONSTRAINT FK_t_viajes_01 FOREIGN KEY (Via_Rut_Codigo) 
    REFERENCES SFX.t_rutas (Rut_Codigo) 
--Agregamos Foreign Key a tabla "Viajes 02"
ALTER TABLE SFX.t_viajes
ADD CONSTRAINT FK_t_viajes_02 FOREIGN KEY (Via_Aer_ID) 
    REFERENCES SFX.t_aeronaves (Aer_ID)
--Agregamos Foreign Key a tabla "Viajes 03"
ALTER TABLE SFX.t_viajes
ADD CONSTRAINT FK_t_viajes_03 FOREIGN KEY (Via_Aep_ID_Procedencia) 
    REFERENCES SFX.t_aeropuertos (Aep_ID) 
--Agregamos Foreign Key a tabla "Viajes 04"
ALTER TABLE SFX.t_viajes
ADD CONSTRAINT FK_t_viajes_04 FOREIGN KEY (Via_Aep_ID_Arribo) 
    REFERENCES SFX.t_aeropuertos (Aep_ID) 
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
--Agregamos Foreign Key a tabla "Aeropuertos 01"
ALTER TABLE SFX.t_aeropuertos 
ADD CONSTRAINT FK_t_aeropuertos_01 FOREIGN KEY (Aep_Ciu_ID) 
    REFERENCES SFX.t_ciudades (Ciu_Id)
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
--ALTER TABLE SFX.t_detalle_compras 
--ADD CONSTRAINT FK_t_detalle_compras_01 FOREIGN KEY (Dec_Com_ID) 
--    REFERENCES SFX.t_compras (Com_ID)
--Agregamos Foreign Key a tabla "Detalle de Compras 02"
--ALTER TABLE SFX.t_detalle_compras 
--ADD CONSTRAINT FK_t_detalle_compras_02 FOREIGN KEY (Dec_Pas_Codigo) 
--    REFERENCES SFX.t_pasajes (Pas_Codigo)
--Agregamos Foreign Key a tabla "Detalle de Compras 03"
--ALTER TABLE SFX.t_detalle_compras 
--ADD CONSTRAINT FK_t_detalle_compras_03 FOREIGN KEY (Dec_Paq_Codigo) 
--    REFERENCES SFX.t_paquetes (Paq_Codigo)
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
/*
/*Insertamos tipos de cuenta y su valor predeterminado en tabla "Tipo Cuenta"*/
INSERT INTO FAT.t_tipo_cuenta (Tic_Cta_Desc, Tic_Cta_Costo) VALUES ('Oro', 1000)
INSERT INTO FAT.t_tipo_cuenta (Tic_Cta_Desc, Tic_Cta_Costo) VALUES ('Plata', 500)
INSERT INTO FAT.t_tipo_cuenta (Tic_Cta_Desc, Tic_Cta_Costo) VALUES ('Bronce', 200)
INSERT INTO FAT.t_tipo_cuenta (Tic_Cta_Desc, Tic_Cta_Costo) VALUES ('Gratuita', 0)
/*Migramos datos de la tabla maestra a tabla "Tipo Documento"*/
INSERT INTO FAT.t_tipo_doc (Tid_Doc_Cod, Tid_Doc_Desc)
SELECT DISTINCT Cli_Tipo_Doc_Cod, Cli_Tipo_Doc_Desc 
  FROM gd_esquema.Maestra
 WHERE Cli_Tipo_Doc_Cod IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Paises"*/ 
INSERT INTO FAT.t_paises (Pai_Codigo, Pai_Desc)
SELECT DISTINCT Cli_Pais_Codigo, Cli_Pais_Desc 
  FROM gd_esquema.Maestra
 WHERE Cli_Pais_Codigo IS NOT NULL
/*Insertamos moneda predeterminada a tabla "Monedas"*/
INSERT INTO FAT.t_monedas (Mon_Desc) VALUES ('Dolar')
/*Migramos datos de la tabla maestra a tabla "Emisores"*/
INSERT INTO FAT.t_emisores (Emi_Descripcion)
SELECT DISTINCT Tarjeta_Emisor_Descripcion 
  FROM gd_esquema.Maestra 
 WHERE Tarjeta_Emisor_Descripcion IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Bancos"*/
INSERT INTO FAT.t_bancos (Ban_Codigo,Ban_Nombre,Ban_Direccion)
SELECT DISTINCT Banco_Cogido, Banco_Nombre, Banco_Direccion 
  FROM gd_esquema.Maestra 
 WHERE Banco_Cogido IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Cheques"*/
INSERT INTO FAT.t_cheques (Che_Numero,Che_Fecha,Che_Importe,Che_Mon_Id,Che_Ban_Id)
SELECT DISTINCT Cheque_Numero, Cheque_Fecha, Cheque_Importe,
	   (SELECT Mon_id FROM FAT.t_monedas WHERE Mon_Desc = 'Dolar'), 
	   (SELECT ban_id FROM FAT.t_bancos WHERE ban_codigo = banco_cogido)  
  FROM gd_esquema.Maestra
 WHERE Cheque_Numero IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Clientes"*/
INSERT INTO FAT.t_clientes (Cli_Tipo_Doc_Nro, Cli_Nombre, Cli_Apellido, Cli_Dom_Calle, Cli_Dom_Nro, Cli_Dom_Piso, 
							Cli_Dom_Depto, Cli_Localidad, Cli_Fecha_Nac, Cli_Mail, Cli_Usu_Id, Cli_Tid_Id, Cli_Pai_Id)
SELECT DISTINCT Cli_Nro_Doc, Cli_Nombre, Cli_Apellido, Cli_Dom_Calle, Cli_Dom_Nro, NULL, 
	   Cli_Dom_Depto, NULL, Cli_Fecha_Nac, Cli_Mail,
	   (SELECT Usu_id FROM FAT.t_usuarios WHERE Usu_Username = 'ADMIN'),
	   (SELECT Tid_id FROM FAT.t_tipo_doc WHERE Tid_Doc_Cod = Cli_Tipo_Doc_Cod),
	   (SELECT Pai_Id FROM FAT.t_paises WHERE Pai_Codigo = Cli_Pais_Codigo)
  FROM gd_esquema.Maestra
 WHERE Cli_Nro_Doc IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Cuentas"*/
INSERT INTO FAT.t_cuentas (Cta_Numero,Cta_Fecha_Creacion,Cta_Estado,Cta_Fecha_Cierre,Cta_Cli_Id,Cta_Pai_Id)
SELECT DISTINCT Cuenta_Numero,Cuenta_Fecha_Creacion,Cuenta_Estado,Cuenta_Fecha_Cierre,
	   (SELECT Cli_Id FROM FAT.t_clientes WHERE Cli_Tipo_Doc_Nro = Cli_Nro_Doc 
											AND	Cli_Tid_Id = (SELECT Tid_Id
																FROM FAT.t_tipo_doc
															   WHERE Tid_Doc_Cod = Cli_Tipo_Doc_Cod)),
	   (SELECT Pai_Id FROM FAT.t_paises WHERE Pai_Codigo = Cuenta_Pais_Codigo)	   
  FROM gd_esquema.Maestra
 WHERE Cuenta_Numero IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Transferencias"*/
INSERT INTO FAT.t_transferencias (Tra_Fecha,Tra_Importe,Tra_Mon_Id,Tra_Costo_Trans,Tra_Id_Cta_Orig,Tra_Id_Cta_Dest)
SELECT DISTINCT Transf_Fecha,Trans_Importe,
	   (SELECT Mon_id FROM FAT.t_monedas WHERE Mon_Desc = 'Dolar'),
	   Trans_Costo_Trans,
	   (SELECT Cta_Id FROM FAT.t_cuentas WHERE Cta_Numero = cuenta_numero),	 
	   (SELECT Cta_Id FROM FAT.t_cuentas WHERE Cta_Numero = cuenta_dest_numero)	 
  FROM gd_esquema.Maestra
 WHERE Transf_Fecha IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Tarjetas"*/
INSERT INTO FAT.t_tarjetas (Tar_Numero,Tar_Fecha_Emision,Tar_Fecha_Vencimiento,Tar_Codigo_Seg,
							Tar_Cli_Id,Tar_Emi_Id)
SELECT DISTINCT Tarjeta_Numero,Tarjeta_Fecha_Emision,Tarjeta_Fecha_Vencimiento,Tarjeta_Codigo_Seg,
	   (SELECT Cli_Id FROM FAT.t_clientes WHERE Cli_Tipo_Doc_Nro = Cli_Nro_Doc 
											AND	Cli_Tid_Id = (SELECT Tid_Id
																FROM FAT.t_tipo_doc
															   WHERE Tid_Doc_Cod = Cli_Tipo_Doc_Cod)),
	   (SELECT Emi_Id FROM FAT.t_emisores WHERE Emi_Descripcion = Tarjeta_Emisor_Descripcion)	
  FROM gd_esquema.Maestra
 WHERE Tarjeta_Numero IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Depositos"*/
INSERT INTO FAT.t_depositos (Dep_Codigo,Dep_Fecha,Dep_Importe,Dep_Mon_Id,Dep_Cta_Id,Dep_Tar_Id)
SELECT DISTINCT Deposito_Codigo,Deposito_Fecha,Deposito_Importe,
	   (SELECT Mon_id FROM FAT.t_monedas WHERE Mon_Desc = 'Dolar'),
	   (SELECT Cta_Id FROM FAT.t_cuentas WHERE Cta_Numero = Cuenta_Dest_Numero),
	   (SELECT Tar_id FROM FAT.t_tarjetas WHERE Tar_Numero = Tarjeta_Numero)
  FROM gd_esquema.Maestra
 WHERE Deposito_Codigo IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Retiros"*/
INSERT INTO FAT.t_retiros (Ret_Codigo,Ret_Fecha,Ret_Importe,Ret_Mon_Id,Ret_Cta_Id,Ret_Che_Id, Ret_Tar_Id)
SELECT DISTINCT Retiro_Codigo,Retiro_Fecha,Retiro_Importe,
	   (SELECT Mon_id FROM FAT.t_monedas WHERE Mon_Desc = 'Dolar'),
	   (SELECT Cta_Id FROM FAT.t_cuentas WHERE Cta_Numero = Cuenta_Numero),
	   (SELECT Che_Id FROM FAT.t_cheques WHERE Che_Numero = Cheque_Numero),
	   (SELECT Tar_id FROM FAT.t_tarjetas WHERE Tar_Numero = Tarjeta_Numero)
  FROM gd_esquema.Maestra
 WHERE Retiro_Codigo IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Facturas"*/  
INSERT INTO FAT.t_facturas (Fac_Numero,Fac_Fecha)
SELECT DISTINCT Factura_Numero,factura_fecha
  FROM gd_esquema.Maestra
 WHERE Factura_Numero IS NOT NULL
/*Migramos datos de la tabla maestra a tabla "Items por Factura"*/
INSERT INTO FAT.t_item_facturas (Ite_Fac_Numero,Ite_Fac_Nro_Item,Ite_Fac_Descr,Ite_Fac_Importe,Ite_Mon_Id,Ite_Fac_Id)
SELECT DISTINCT Factura_Numero,1,Item_Factura_Descr,Item_Factura_Importe,
	   (SELECT Mon_id FROM FAT.t_monedas WHERE Mon_Desc = 'Dolar'),
	   (SELECT Fac_Id FROM FAT.t_facturas WHERE Fac_Numero = Factura_Numero)
  FROM gd_esquema.Maestra
 WHERE Cuenta_Numero IS NOT NULL 
   AND Cuenta_Dest_Numero IS NOT NULL
   AND Factura_Numero IS NOT NULL
*/
/*Insertamos roles predeterminados en tabla "Roles"*/
INSERT INTO SFX.t_roles (Rol_Nombre,Rol_Estado) VALUES ('administrador', 'A')
INSERT INTO SFX.t_roles (Rol_Nombre,Rol_Estado) VALUES ('cliente', 'A')
/*Insertamos usuario predeterminado a tabla "Usuarios"*/ 
INSERT INTO SFX.t_usuarios (Usu_Username,Usu_Password,Usu_Fecha_Creacion,Usu_Fecha_Modif,Usu_Preg_Secreta,
							Usu_Resp_Secreta,Usu_Fecha_Baja)
VALUES ('ADMIN', 'w23e', GETDATE(), GETDATE(), 'Hola', 'Hola', convert(datetime,'31-12-3000', 105))
/*---------------------CREACIÓN DE FUNCTIONS, PROCEDURES, TRIGGERS Y VIEWS---------------------*/
