﻿CREATE DATABASE bdEscola
USE bdEscola 

CREATE TABLE tbAluno1 (
	codAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (50)
	,rgAluno VARCHAR (15)
	,cpfAluno VARCHAR (14)
	,logradouro VARCHAR (50)
	,numero INT 
	,complemento VARCHAR (30)
	,cep VARCHAR(10)
	,bairro VARCHAR (40)
	,cidade VARCHAR (30)
	,dataNasc SMALLDATETIME 
)

INSERT INTO tbAluno1( nomeAluno, rgAluno, cpfaluno, logradouro, numero, cep, bairro, cidade, dataNasc)
VALUES ( 'Nátalia Gomes', '82-292-122-0', '123.456.789-90' ,'Rua Nina', 2395, '66-666-666', 'Guainases', 'SP', '03/10/2003')
	  ,( 'Julia Helena', '60-902-862-1', '123.421.789-90' , 'Rua Soarez', 400, '11-111-111', 'Cidade Santana', 'RJ', '10/01/2006')
	  ,( 'Anna Lívia Melo', '50-692-802-2', '903.456.789-90' , 'Rua Leandro', 5, '22-222-222', 'Cidade Tiradentes', 'MG', '05/12/1980')
	  ,( 'Diogo Resolino', '40-276-342-3', '783.456.789-90', 'Avenida Metalúrgicos', 23, '44-444-444', 'Itaquera', 'SP', '23/04/2000')
	  ,( 'Célia Cunha', '30-892-987-4', '123.456.716-90', 'Rua Renê', 225, '33-333-343', 'Suzano', 'ES', '09/11/1940')

SELECT * FROM tbAluno1


CREATE TABLE tbCurso1 (
	codCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR (30)
	,valorCurso MONEY 
)
INSERT INTO tbCurso1 ( nomeCurso, valorCurso)
VALUES ( 'Inglês', 356)
	  ,( 'Alemão', 245)
	  ,( 'Coreano', 260)

SELECT * FROM tbCurso1


CREATE TABLE tbNivel (
	codNivel INT PRIMARY KEY IDENTITY (1,1)
	,descricaoNivel VARCHAR (45)
)

INSERT INTO tbNivel (descricaoNivel)
VALUES ( 'básico')
	   ,( 'intermediario')
	   ,( 'avançado')

SELECT * FROM tbNivel

CREATE TABLE tbPeriodo (
	codPeriodo INT PRIMARY KEY IDENTITY (1,1)
	,descricaoPeriodo VARCHAR (45)
)

INSERT INTO tbPeriodo (descricaoPeriodo)
VALUES ( '1° semestre')
	   ,( ' 2° semestre')
	   ,( '3° semestre')
	   ,( '4° semestre')

SELECT * FROM tbPeriodo

CREATE TABLE tbTelefoneAluno (
	codTelAluno INT PRIMARY KEY IDENTITY (1,1)
	,numTelAluno INT 
	,codAluno INT FOREIGN KEY REFERENCES tbAluno1(codAluno)
)

INSERT INTO tbTelefoneAluno ( numTelAluno, codAluno )
VALUES ( 2285-2788, 1)
	   ,( 2456-798, 2)
	   ,( 2897-0121, 3)
	   ,( 2134-7865, 4)
	   ,( 2678-1023, 5)

SELECT * FROM tbTelefoneAluno


CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,descricaoTurma VARCHAR (45)
	,codCurso INT FOREIGN KEY REFERENCES tbCurso1(codCurso)
	,codNivel INT FOREIGN KEY REFERENCES tbNivel(codNivel)
	,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(codPeriodo)
	,horario TIME 
	,diaDaSemana VARCHAR (8)
)

INSERT INTO tbTurma ( descricaoTurma, codCurso, codNivel, codPeriodo, horario, diaDaSemana)
VALUES ( 'Turma 1° andar', 1, 1, 1, '14:00', 'Segunda')
	  ,( 'Turma 2° andar', 2, 2, 2, '19:00', 'Segunda')
	  ,( 'Turma 3° andar', 3, 3, 3, '17:00', 'Segunda')

SELECT * FROM tbTurma

CREATE TABLE tbMatricula1 (
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula SMALLDATETIME 
	,codAluno INT FOREIGN KEY REFERENCES tbAluno1(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)

INSERT INTO tbMatricula1( dataMatricula, codAluno, codTurma)
VALUES ( '10/12/2020', 1, 1)
	  ,( '22/12/2021', 1, 2)
	  ,( '20/02/2022', 2, 3)
	  ,( '15/01/2020', 2, 2)
	  ,( '05/10/2020', 3, 1)

SELECT * FROM tbMatricula1
----------------------------------------

