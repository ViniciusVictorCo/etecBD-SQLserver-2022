CREATE TRIGGER tgSaidaProduto
ON tbItensVenda AFTER INSERT
AS
	DECLARE @codProduto INT, @quantidade int


	SET @quantidade = (SELECT qua FROM inserted)


