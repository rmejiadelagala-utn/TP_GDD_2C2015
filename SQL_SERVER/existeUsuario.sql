USE [GD2C2015]
GO
/****** Object:  UserDefinedFunction [dbo].[ExisteUsuario]    Script Date: 03/11/2015 11:24:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[ExisteUsuario]
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
