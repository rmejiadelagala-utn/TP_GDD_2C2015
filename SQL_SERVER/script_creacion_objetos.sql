USE [GD2C2015]
GO
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
IF OBJECT_ID('SFX.GetViajesDisponibles') IS NOT NULL
DROP PROCEDURE SFX.GetViajesDisponibles
IF OBJECT_ID('SFX.KgDisponibles') IS NOT NULL
DROP FUNCTION SFX.KgDisponibles
IF OBJECT_ID('SFX.BuscarAeronave') IS NOT NULL
DROP PROCEDURE SFX.BuscarAeronave
IF OBJECT_ID('SFX.BajaAeronave') IS NOT NULL
DROP PROCEDURE SFX.BajaAeronave
IF OBJECT_ID('SFX.InsertarAeronave') IS NOT NULL
DROP PROCEDURE SFX.InsertarAeronave
IF OBJECT_ID('SFX.BuscarCiudad') IS NOT NULL
DROP PROCEDURE SFX.BuscarCiudad


/****** Object:  UserDefinedFunction [sfx].[ExisteUsuario]    Script Date: 07/11/2015 10:39:20 a.m. ******/
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

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = COUNT(1) 
	FROM [SFX].[t_usuarios]
	WHERE Usu_Username = @Usuario
	AND   Usu_Password =  HASHBYTES('SHA2_256', @password);

	RETURN @Result

END

/* Creacion SPs*/

GO

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

	PRINT ERROR_MESSAGE();

END CATCH
GO

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

	PRINT ERROR_MESSAGE();

END CATCH
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Dado un viaje calcula los kg que quedan aún disponibles para la venta de paquetes
--				esta funcion es usada dentro del procedure GetViajesDisponibles -> ABM-Compras 
-- =============================================
CREATE FUNCTION SFX.KgDisponibles 
(
	-- Add the parameters for the function here
	 @IdViaje int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE 
		@KG_Usados int,
		@KG_Totales int
	
	-- Add the T-SQL statements to compute the return value here
	SELECT @KG_Usados= ISNULL(SUM(Paq_KG),0) 
	FROM SFX.t_viajes, SFX.t_compras,SFX.t_paquetes
	WHERE Via_ID=@IdViaje
	and Via_ID=Com_Via_ID
	and Paq_Com_id=Com_ID;
	
	SELECT @KG_Totales= Aer_KG_Disponibles from SFX.t_aeronaves,SFX.t_viajes --Kg Totales en Aeronave
			where Via_ID=@IdViaje
			and Via_Aer_ID=Aer_ID;

	-- Return the result of the function
	RETURN (@KG_Totales - @KG_Usados)

END
GO


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

	PRINT ERROR_MESSAGE();

END CATCH
GO

CREATE PROCEDURE [SFX].[GetViajesDisponibles] 
	-- Add the parameters for the stored procedure here
	@CiudadOrigId nvarchar(100),
	@CiudadDestId nvarchar(100),
	@FechaVuelo nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @varfecha datetime;
	SET NOCOUNT ON;
	SET @varfecha = (select CAST(@FechaVuelo as datetime));
    -- Insert statements for procedure here
	select Via_Fecha_Salida as FechaSalida, Via_Fecha_Llegada_Estimada as FechaEstimada,
	       Aer_Matricula as Aeronave,
		   (select SFX.KgDisponibles(Via_ID)) as CantButacas, 
		   --Aer_KG_Disponibles as KG_Disponibles, 
		   orig.Cia_Descripcion as Ciudad_Origen, dest.Cia_Descripcion as Ciudad_Destino
    from SFX.t_viajes,SfX.t_rutas,SFX.t_aeronaves, 
		SFX.t_ciudades_aeropuertos orig, SFX.t_ciudades_aeropuertos dest
    where Via_Rut_ID=Rut_ID
			and Via_Aer_ID=Aer_ID 
			and Rut_Cia_ID_Origen=orig.Cia_ID
			and Rut_Cia_ID_Destino=dest.Cia_ID
            and CONVERT(date,Via_Fecha_Salida,121) = CONVERT(date,@varfecha,121) 
            and Rut_Cia_ID_Origen = @CiudadOrigId
            and Rut_Cia_ID_Destino =@CiudadDestId;

END;

GO

--Para uso en ABM aeronaves en los listado de busquedas.

GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SFX].[BuscarAeronave]  
	-- Add the parameters for the stored procedure here
	@Matricula nvarchar(255), 
	@Fabricante nvarchar(255),
	@Modelo nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@Fabricante ='' OR @Modelo ='') 	 
		BEGIN
		SELECT a.Aer_ID, a.Aer_Matricula, m.Mod_Nombre, f.Fab_Nombre, s.Ser_Descripcion 
		FROM [SFX].[t_aeronaves] a, [SFX].[t_modelos] m, [SFX].[t_fabricantes] f, [SFX].[t_servicios] s
		WHERE a.Aer_Matricula like  '%'+@Matricula+'%'
		AND a.Aer_Mod_ID=m.Mod_ID
		and m.Mod_Fab_ID=f.Fab_ID
		and a.Aer_Ser_ID=s.Ser_ID
		and a.Aer_Fecha_Baja_Definitiva is null
		END
	ELSE
		BEGIN 
		SELECT a.Aer_ID, a.Aer_Matricula, m.Mod_Nombre, f.Fab_Nombre, s.Ser_Descripcion 
		FROM [SFX].[t_aeronaves] a, [SFX].[t_modelos] m, [SFX].[t_fabricantes] f, [SFX].[t_servicios] s
		WHERE a.Aer_Matricula like  '%'+@Matricula+'%'
		AND a.Aer_Mod_ID=m.Mod_ID
		and m.Mod_Fab_ID=f.Fab_ID
		and a.Aer_Ser_ID=s.Ser_ID
		and a.Aer_Fecha_Baja_Definitiva is null
		and f.Fab_ID= @Fabricante
		and m.Mod_ID = @Modelo;
		END

END
GO


CREATE PROCEDURE [SFX].[BajaAeronave] 

	@ID				int
	
AS
BEGIN TRY

	BEGIN TRAN;

	UPDATE [SFX].[t_aeronaves] 
	   SET Aer_Fecha_Baja_Definitiva = getdate()
	 WHERE Aer_ID = @ID;

	COMMIT;

END TRY

BEGIN CATCH
	
	ROLLBACK

	PRINT ERROR_MESSAGE();

END CATCH

GO

CREATE PROCEDURE [SFX].[BuscarCiudad] 
	-- Add the parameters for the stored procedure here
	 @CiudadNombre nvarchar(255)
AS
BEGIN
	
	SELECT * FROM SFX.t_ciudades_aeropuertos where Cia_Descripcion Like '%'+@CiudadNombre+'%';
END
