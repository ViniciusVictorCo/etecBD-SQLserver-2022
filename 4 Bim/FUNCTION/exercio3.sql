CREATE FUNCTION fcMostarValor (@Valor int)
returns varchar (20) AS
BEGIN
	DECLARE @retorno VARCHAR(20)
	DECLARE @ValorCurso int
	SET @valorCurso = @valor

	IF(@ValorCurso>=400)
		begin
	set @retorno='curso caro'
	end
	ELSE
		begin
	set @retorno='curso barato'
	end
	RETURN @retorno
END
SELECT valorCurso, Status=dbo.fcMostarValor(valorCurso) from tbCurso1
