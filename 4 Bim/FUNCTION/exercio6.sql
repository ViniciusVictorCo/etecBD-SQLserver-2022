CREATE FUNCTION fcCompras(@codCliente INT)
RETURNS VARCHAR(100) AS
BEGIN
	DECLARE @retorno VARCHAR(100)
	DECLARE @valorTotalCompras MONEY
	SET @valorTotalCompras = (SELECT SUM(valorTotalVenda) FROM tbVenda WHERE codCliente = @codCliente)
	DECLARE @quantidadeCompras INT
	SET @quantidadeCompras = (SELECT COUNT(codVenda) FROM tbVenda WHERE codCliente = @codCliente)

	SET @retorno = (SELECT CONVERT(VARCHAR(30), @codCliente) +'   . Valor total das Compras  '+ CONVERT(VARCHAR(30), @valorTotalCompras) +'   Total de Compras  '+ CONVERT(VARCHAR(30), @quantidadeCompras) FROM tbVenda WHERE codCliente = @codCliente GROUP BY codCliente)
	RETURN @retorno
END

SELECT MinhaFunção=dbo.fc_compras(1) 