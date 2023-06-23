CREATE DATABASE bdBanco
USE bdBanco

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (50)
	,cpfCliente VARCHAR (20)
)

INSERT INTO tbCliente (nomeCliente, cpfCliente)
VALUES ('Luiz Vinicius', '123.456.789-10')

SELECT * FROM tbCliente


-----------------------------
CREATE TABLE tbContaCorrente(
	numConta INT PRIMARY KEY IDENTITY (1,1)
	,saldoConta MONEY
	,codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
)

INSERT INTO  tbContaCorrente( saldoConta, codCliente)
VALUES (1000, 1)

SELECT * FROM tbContaCorrente

-----------------------------
CREATE TABLE tbDeposito(
	codDeposito INT PRIMARY KEY IDENTITY (1,1)
	,valorDeposito MONEY
	,numConta INT FOREIGN KEY REFERENCES tbContaCorrente(numConta)
	,dataDeposito date
	,horaDeposito time (0)
)	

INSERT INTO tbDeposito ( valorDeposito, numConta, dataDeposito,horaDeposito)
VALUES (100, 1, '07/09/2022', '00:02:00')

SELECT * FROM tbDeposito


---------------------------
CREATE TABLE tbSaque (
	codSaque INT PRIMARY KEY IDENTITY (1,1)
	,valorSaque MONEY
	,numConta INT FOREIGN KEY REFERENCES tbContaCorrente(numConta)
	,dataSaque smalldatetime
	,horaSaque time (0)
)

INSERT INTO tbSaque(valorSaque, numConta, dataSaque,horaSaque)
VALUES (100, 1, '07/09/2022', '00:02:10')

SELECT * FROM tbSaque
--------------------------------------
INSERT INTO tbDeposito ( valorDeposito, numConta, dataDeposito, horaDeposito)
VALUES (1000, 1, '08/09/2022', '20:28:00')
SELECT * FROM tbContaCorrente
SELECT * FROM tbDeposito
SELECT * FROM tbSaque

INSERT INTO tbSaque(valorSaque, numConta, dataSaque,horaSaque)
VALUES (10000, 1, '08/09/2022', '22:59:10')