CREATE TRIGGER tgDeposito
ON tbDeposito AFTER INSERT
AS BEGIN 
	DECLARE	@valorDeposito MONEY

	SET @valorDeposito = (SELECT valorDeposito FROM inserted)




	UPDATE tbContaCorrente SET saldoConta = @valorDeposito + saldoConta
	WHERE numConta = (
		SELECT numConta FROM inserted
		);

	print('O valor da sua conta foi ajustado')
END
---------------------------------------

ALTER TRIGGER tgSaque 
ON tbSaque AFTER INSERT
AS BEGIN 
	DECLARE	@valorSaque MONEY, @saldoConta MONEY

	SET @valorSaque = (SELECT valorSaque FROM inserted)
	SET @saldoConta = (SELECT saldoConta FROM tbContaCorrente)


	IF(@valorSaque<=@saldoConta)
	BEGIN
	UPDATE tbContaCorrente SET saldoConta = saldoConta - @valorSaque
	WHERE numConta = (
		SELECT numConta FROM inserted
		);
	print('O valor da sua conta foi ajustado')
	END
END
