CREATE FUNCTION fcMostraCargaHoraria (@horas int)
returns varchar(20) AS
BEGIN 
	DECLARE @retorno VARCHAR(20)
	DECLARE @cargaHoraria int
	set @cargaHoraria = @horas
	
	if @cargaHoraria>1000
		begin
	set @retorno='curso extenso'
	end

	if @cargaHoraria<1000
		begin
	set @retorno='curso curto'
	end
	RETURN @retorno
END
SELECT cargaHoraria, Status=dbo.fcMostraCargaHoraria(cargaHoraria) from tbCurso1
