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
DROP PROCEDURE SFX.BajaCiudad


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
	select Via_Fecha_Salida, Via_Fecha_Llegada_Estimada,
	       Aer_Matricula,Aer_KG_Disponibles, Rut_Cia_ID_Origen,Rut_Cia_ID_Destino, Cia_Descripcion
                                                       from SFX.t_viajes,SfX.t_rutas,SFX.t_aeronaves, SFX.t_ciudades_aeropuertos
                                                      where Via_Rut_ID=Rut_ID
                                                      and Via_Aer_ID=Aer_ID 
													  and Rut_Cia_ID_Origen=Cia_ID
                                                      and Via_Fecha_Salida > CONVERT(datetime,@varfecha,121)  
                                                     and Rut_Cia_ID_Origen = @CiudadOrigId
                                                     and Rut_Cia_ID_Destino =@CiudadDestId;
END;

GO