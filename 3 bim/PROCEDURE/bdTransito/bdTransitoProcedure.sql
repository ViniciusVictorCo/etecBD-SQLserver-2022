------------------------------EX 1
-------INSERE MOTORISTA
create PROCEDURE spINSERE_MOTORISTA
	@nomeMotorista varchar(50), @dataNascMotorista SMALLDATETIME,  @cpfMotorista varchar(20), @cnhMotorista varchar(20), @pontuacaoMotorista varchar(20)
AS
IF EXISTS (SELECT cpfMotorista FROM tbMotorista where cpfMotorista like @cpfMotorista)
BEGIN 
	PRINT ('CPF ja foi cadastrado')
END
ELSE
BEGIN
	INSERT INTO tbMotorista (nomeMotorista, dataNascMotorista, cpfMotorista, cnhMotorista, pontuacaoMotorista)

	VALUES (@nomeMotorista, @dataNascMotorista, @cpfMotorista, @cnhMotorista, @pontuacaoMotorista)

	PRINT ('Motorista '+ @nomeMotorista +' foi cadastrado com sucesso') 
END

EXEC spINSERE_MOTORISTA 'Viniii', '24/08/1997', '002.892.232-70', '18098766743361', '2'
SELECT * FROM tbMotorista

-------INSERE VEICULO

create PROCEDURE spINSERE_VEICULO
	@modeloVeiculo varchar(50), @placaVeiculo varchar(15),  @renavamVeiculo varchar(20),  @anoVeiculo SMALLDATETIME, @idMotorista INT
AS
IF EXISTS (SELECT placaVeiculo FROM tbVeiculo where placaVeiculo like @placaVeiculo)
BEGIN 
	PRINT ('Veiculo ja foi cadastrado')
END
ELSE
BEGIN
	INSERT INTO tbVeiculo (modeloVeiculo, anoVeiculo, renavamVeiculo, placaVeiculo, idMotorista)

	VALUES (@modeloVeiculo, @anoVeiculo, @renavamVeiculo, @placaVeiculo, @idMotorista)

	PRINT ('Veiculo '+ @idMotorista +' foi cadastrado com sucesso') 
END

exec spINSERE_VEICULO 'KIA Van','1264-ABCD','ABUNQASNANSOAJS','24/09/2009', 2
SELECT * FROM tbVeiculo

-------INSERE MULTAS

create PROCEDURE spINSERE_MULTA
	@dataMulta SMALLDATETIME ,  @horaMulta c, @pontosMulta INT, @idVeiculo INT
AS
	INSERT INTO tbMultas 

	VALUES (@dataMulta, @horaMulta, @pontosMulta, @idVeiculo)

EXEC spINSERE_MULTA '05/10/2021', '00:30:17', 6, 3

SELECT * FROM tbMultas

-------------------------EX 2

alter PROCEDURE spAPRESENTA_MULTA
	@placaVeiculo VARCHAR(15)
AS
	
	SELECT placaVeiculo, COUNT(idMulta) FROM tbVeiculo
	INNER JOIN tbMultas ON tbVeiculo.idVeiculo = tbMultas.idVeiculo
	WHERE placaVeiculo like @placaVeiculo
	GROUP BY placaVeiculo

EXEC spAPRESENTA_MULTA '1234-ABCD'

EXEC spAPRESENTA_MULTA '1254-AdCD'

SELECT * FROM tbVeiculo

------------------------------EX 3

create PROCEDURE spAPRESENTA_PONTUAÇAO
	@cpfMotorista varchar(20)
AS
	SELECT cpfMotorista, pontuacaoMotorista  FROM tbMotorista
	WHERE cpfMotorista like @cpfMotorista

EXEC spAPRESENTA_PONTUAÇAO '123.456.789-90'


