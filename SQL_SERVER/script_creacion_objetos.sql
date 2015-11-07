USE [GD2C2015]
GO
IF OBJECT_ID('dbo.ExisteUsuario') IS NOT NULL
DROP FUNCTION dbo.ExisteUsuario

IF OBJECT_ID('SFX.GetCiudades') IS NOT NULL
DROP PROCEDURE SFX.GetCiudades

IF OBJECT_ID('SFX.InsertarCiudad') IS NOT NULL
DROP PROCEDURE SFX.InsertarCiudad

/****** Object:  UserDefinedFunction [dbo].[ExisteUsuario]    Script Date: 07/11/2015 10:39:20 a.m. ******/
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
	SELECT *
	FROM [SFX].[t_ciudades_aeropuertos]

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