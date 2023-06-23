CREATE DATABASE bdEscola
USE bdEscola

--cursos
CREATE TABLE tbCurso (
	codCurso int PRIMARY KEY IDENTITY(1,1)
	,nomeCurso varchar(50)NOT NULL
	,cargaHoraria int NOT NULL
	,valorCurso MONEY
);

INSERT INTO tbCurso
VALUES	('Inglês',2000,356),
		('Alemão',3000,478)

SELECT * FROM tbCurso
---------------------

--aluno
CREATE TABLE tbAluno1 (	
	codAluno int PRIMARY KEY IDENTITY (1,1)
	,nomeAluno varchar(60) NOT NULL
	,rgAluno varchar(26) NOT NULL
	,dtNascAluno smalldatetime
	,naturalidadeAluno varchar(2)
);

INSERT INTO tbAluno1
VALUES	('Paulo Santos', '82.292.122-0', '2000-10-03', 'SP'),
		('Maria da Gloria', '45.233.123.0', '1999-03-10', 'SP'),
		('Perla Nogueira Silva', '23.533.211.9', '1998-04-04', 'SP'),
		('Gilson Barros Santos', '34.221.111.x', '2000-10-03', 'SP'),
		('Mariana Barbosa Santos', '54.222.122.9', '2001-10-10', 'RJ')

SELECT * FROM tbAluno1

update tbAluno1
set nomeAluno = 'Mariana Barbosa Santos'
WHERE codAluno = 5

update tbAluno1
set naturalidadeAluno = 'PE'
WHERE codAluno = 4
---------------------

--turma
CREATE TABLE tbTurma (
	codTurma int PRIMARY KEY IDENTITY(1,1)
	,nomeTurma varchar(26) NOT NULL
	,horarioTurma varchar(30)
	,codCurso int FOREIGN KEY REFERENCES tbCurso(codCurso)
);

select * from tbTurma

INSERT INTO tbTurma
VALUES	('1|A', '12:00:00', 1),
		('1|B', '18:00:00', 1),
		('1|AA', '19:00:00', 2)

SELECT * FROM tbTurma
---------------------

--matricula
CREATE TABLE tbMatricula (
	codMatricula int PRIMARY KEY IDENTITY(1,1)
	,dtMatricula SMALLDATETIME
	,codAluno int FOREIGN KEY REFERENCES tbAluno1(codAluno)
	,codTurma int FOREIGN KEY REFERENCES tbTurma(codTurma)
);

INSERT INTO tbMatricula
VALUES	('2015-03-10', 1, 1),
		('2014-04-05', 2, 1),
		('2012-03-05', 3, 2),
		('2016-03-03', 1, 3),
		('2015-07-07', 4, 2),
		('2015-05-05', 4, 3),
		('2015-06-06', 5, 1),
		('2015-05-05', 5, 3)

SELECT * FROM tbMatricula
---------------------

--EX01
SELECT nomeAluno, rgAluno, dtNascAluno, naturalidadeAluno from tbAluno1
WHERE (naturalidadeAluno) LIKE 'SP'

--EX02
SELECT	nomeAluno, rgAluno from tbAluno1
WHERE nomeAluno LIKE 'p%'

--EX03
SELECT nomeCurso FROM tbCurso
WHERE cargaHoraria LIKE 2000

--EX04
SELECT nomeAluno, rgAluno from tbAluno1
WHERE nomeAluno LIKE '%Silva'

--EX05
SELECT nomeAluno, dtNascAluno from tbAluno1
WHERE MONTH(tbAluno1.dtNascAluno) = 3

--EX06
SELECT codAluno, dtMatricula from tbMatricula
WHERE MONTH(tbMatricula.dtMatricula) = 5

--EX07
SELECT codAluno, codTurma from tbMatricula
WHERE codTurma = 3

--EX08 
SELECT codAluno, codTurma from tbMatricula
WHERE codTurma = 3

--EX09
SELECT * FROM tbAluno1

--EX10
SELECT * FROM tbTurma
