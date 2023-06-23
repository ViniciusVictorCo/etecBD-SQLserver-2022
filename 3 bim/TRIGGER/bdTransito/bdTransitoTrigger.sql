CREATE TRIGGER tgMulta
ON tbMultas AFTER INSERT
AS BEGIN
	DECLARE @pontuacao INT, @pontuacaoAtual INT	
	DECLARE @idMotorista INT, @cnhMotorista VARCHAR(20), @idVeiculo INT

	SET @pontuacao = (SELECT pontosMulta FROM inserted)
	SET @idVeiculo = (SELECT idVeiculo FROM inserted)

	SET @idMotorista = (SELECT idMotorista FROM tbVeiculo WHERE idVeiculo = @idVeiculo)
	
	update tbMotorista SET pontuacaoMotorista = @pontuacao + pontuacaoMotorista
		WHERE idMotorista = @idMotorista
	
	if(@pontuacaoAtual <= 20)
	PRINT ('sua cnh pode ser suspença')

END