CREATE FUNCTION fcvendasVendedor(@codCliente INT, @mes INT)
	RETURNS VARCHAR(90) AS
BEGIN
	DECLARE @retorno MONEY
	DECLARE @Vendas MONEY 
	SET @Vendas = (SELECT SUM(valorTotalVenda) FROM tbVenda WHERE codCliente=@codCliente AND MONTH(dataVenda) = @mes)
	
	SET @retorno = @Vendas

	RETURN @retorno
END

SELECT minhafuncao=dbo.fcvendasVendedor(1,2)
