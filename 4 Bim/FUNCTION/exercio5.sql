CREATE FUNCTION fcMostarVenda1 (@codVenda INT)
RETURNS VARCHAR(190) AS
BEGIN

	DECLARE @data DATE
		SET @data = (SELECT dataVenda FROM tbVenda WHERE codVenda = @codVenda)
	DECLARE @dia INT
		SET @dia = DATEPART(dw, @data)
	DECLARE @diaSemana VARCHAR(90)
	DECLARE @retorno VARCHAR(190)

		if @dia = 1
			BEGIN
				SET @diaSemana	= 'Domingo'
			END
		if @dia = 2
			BEGIN
				SET @diaSemana	= 'Segunda-Feira'
			END
		if @dia = 3
			BEGIN
				SET @diaSemana	= 'Terça-Feira'
			END
		if @dia = 4
			BEGIN
				SET @diaSemana	= 'Quarta-Feira'
			END
		if @dia = 5
			BEGIN
				SET @diaSemana	= 'Quinta-Feira'
			END
		if @dia = 6
			BEGIN
				SET @diaSemana	= 'Sexta-Feira'
			END
		if @dia = 7
			BEGIN
				SET @diaSemana	= 'Sabado'
			END
	SET @retorno = (SELECT @diaSemana +' . '+ CONVERT(VARCHAR(10), codVenda) +' . '+ CONVERT(VARCHAR(20), valorTotalVenda) +' . '+ CONVERT(VARCHAR(40), dataVenda) FROM tbVenda WHERE codVenda = @codVenda)
	RETURN @retorno
END

SELECT MinhaFuncao=dbo.fcMostarVenda1(1)