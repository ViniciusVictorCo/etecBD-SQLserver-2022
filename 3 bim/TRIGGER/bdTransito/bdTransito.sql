CREATE DATABASE bdTransito
USE bdTransito 

CREATE TABLE tbMotorista (
	idMotorista INT PRIMARY KEY IDENTITY (1,1)
	,nomeMotorista VARCHAR (50)
	,dataNascMotorista SMALLDATETIME
	,cpfMotorista VARCHAR (20)
	,cnhMotorista VARCHAR (20)
	,pontuacaoMotorista INT
)
    
INSERT INTO tbMotorista ( nomeMotorista, dataNascMotorista, cpfMotorista, cnhMotorista, pontuacaoMotorista)
VALUES 	( 'Claudios Bernado', '05/07/1990', '123.456.789-90', '123456789098', 7)
	   ,( 'Bernado Correa', '24/08/1999', '098.765.432-10', '09098766543321', 3)
	   ,( 'Renato Garcia', '08/10/1980', '190.456.589-90', '2849289318323', 2)

SELECT * FROM tbMotorista

----------------------------------------

CREATE TABLE tbVeiculo (
	idVeiculo INT PRIMARY KEY IDENTITY (1,1)
	,modeloVeiculo VARCHAR (50)
	,placaVeiculo VARCHAR (15)
	,renavamVeiculo VARCHAR (20)
	,anoVeiculo SMALLDATETIME 
	,idMotorista INT FOREIGN KEY REFERENCES tbMotorista (idMotorista)
	)

INSERT INTO tbVeiculo( modeloVeiculo, placaVeiculo, renavamVeiculo, anoVeiculo, idMotorista)
VALUES 	('Canva Van','1234-ABCD','ABUNQASNANSOAJS','24/09/2009', 1),
    	('Ford Mustang','4321-DCBA','AOJKASHJDBABIAPL','08/03/2012', 3),
    	('Chevrolet Camaro','1432-ADCB','DHJSBDFHBDNIAMSINH','28/10/2007', 2)

SELECT * FROM tbVeiculo

----------------------------------------

CREATE TABLE tbMultas (
	idMulta INT PRIMARY KEY IDENTITY (1,1)
	,dataMulta SMALLDATETIME
	,horaMulta VARCHAR (10)
	,pontosMulta INT
	,idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo (idVeiculo)
    
)
INSERT INTO tbMultas ( dataMulta, horaMulta, pontosMulta, idVeiculo)
VALUES ( '23/07/2021', '12:00:07', 13, 1)
	  ,( '15/03/2021', '16:50:48',5, 2)
	  ,( '08/06/2021', '00:30:16', 2, 3)

SELECT * FROM tbMultas
----------------------------------------

