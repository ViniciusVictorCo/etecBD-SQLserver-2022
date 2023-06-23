CREATE FUNCTION fcMostarData
(@data date)
Returns varchar (40) AS
BEGIN
	DECLARE @diaSemana varchar (40)
	DECLARE @dia int
	set @dia = DATEPART(dw,@data)

	if @dia=1
		begin
	set @diaSemana='Domingo'
	end
	if @dia=2
		begin
	set @diaSemana='Segunda-Feira'
	end
	if @dia=3
		begin
	set @diaSemana='Terça-Feira'
	end
	if @dia=4
		begin
	set @diaSemana='Quarta-Feira'
	end
	if @dia=5
		begin
	set @diaSemana='Quinta-Feira'
	end
	if @dia=6
		begin
	set @diaSemana='Sexta-Feira'
	end
	if @dia=7
		begin
	set @diaSemana='Sabado'
	end
	RETURN @diaSemana
END
SELECT dataMatricula, Status=dbo.fcMostarData(dataMatricula) FROM tbMatricula1