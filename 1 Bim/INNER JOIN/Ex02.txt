CREATE DATABASE bdEx02
USE bdEx02

--cursos
CREATE TABLE tbCurso (
	codCurso int PRIMARY KEY IDENTITY(1,1)
	,nomeCurso varchar(50)NOT NULL
	,cargaHoraria int NOT NULL
	,valorCurso MONEY
);

INSERT INTO tbCurso
VALUES	('Inglês',2000,356),
		('Alemão',3000,478),
		('Espanhol',4000,500)

SELECT * FROM tbCurso
---------------------

--aluno
CREATE TABLE tbAluno (	
	codAluno int PRIMARY KEY IDENTITY (1,1)
	,nomeAluno varchar(60) NOT NULL
	,rgAluno varchar(26) NOT NULL
	,dtNascAluno smalldatetime
	,naturalidadeAluno varchar(2)
);

INSERT INTO tbAluno
VALUES	('Paulo Santos', '82.292.122-0', '2000-10-03', 'SP'),
		('Maria da Gloria', '45.233.123.0', '1999-03-10', 'SP'),
		('Perla Nogueira Silva', '23.533.211.9', '1998-04-04', 'SP'),
		('Gilson Barros Santos', '34.221.111.x', '2000-10-03', 'PE'),
		('Mariana Barbosa Santos', '54.222.122.9', '2001-10-10', 'RJ'),
		('Alessandro Pereira', '24.402.454.9', '2003-10-11', 'ES'),
		('Aline Melo', '88.365.012.3', '2001-10-08', 'RJ')

SELECT * FROM tbAluno
---------------------

--turma
CREATE TABLE tbTurma (
	codTurma int PRIMARY KEY IDENTITY(1,1)
	,nomeTurma varchar(26) NOT NULL
	,horarioTurma varchar(30)
	,codCurso int FOREIGN KEY REFERENCES tbCurso(codCurso)
);

INSERT INTO tbTurma
VALUES	('1|A', '12:00:00', 1),
		('1|C', '18:00:00', 3),
		('1|B', '18:00:00', 1),
		('1|AA', '19:00:00', 2)

SELECT * FROM tbTurma
---------------------

--matricula
CREATE TABLE tbMatricula (
	codMatricula int PRIMARY KEY IDENTITY(1,1)
	,dtMatricula SMALLDATETIME
	,codAluno int FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma int FOREIGN KEY REFERENCES tbTurma(codTurma)
);

INSERT INTO tbMatricula
VALUES	('2015-10-03', 1, 1),
		('2014-05-04', 2, 1),
		('2014-05-04', 2, 4),
		('2012-05-03', 3, 2),
		('2016-03-03', 1, 3),
		('2015-05-07', 4, 2),
		('2015-07-05', 4, 3)

SELECT * FROM tbMatricula
---------------------

--EX01 Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno, nomeCurso FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso

--EX02 Apresentar a quantidade de alunos matriculados por nome do curso;
SELECT nomeAluno, nomeCurso FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
WHERE (nomeCurso) LIKE 'Inglês'

SELECT nomeAluno, nomeCurso FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
WHERE (nomeCurso) LIKE 'Alemão'

SELECT nomeAluno, nomeCurso FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
WHERE (nomeCurso) LIKE 'Espanhol'

--EX03 Apresentar a quantidade de alunos matriculados por nome da turma;
SELECT nomeAluno, nomeTurma FROM tbAluno
INNER JOIN	tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
WHERE (nomeTurma) LIKE '1|A'

SELECT nomeAluno, nomeTurma FROM tbAluno
INNER JOIN	tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
WHERE (nomeTurma) LIKE '1|C'

SELECT nomeAluno, nomeTurma FROM tbAluno
INNER JOIN	tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
WHERE (nomeTurma) LIKE '1|AA'

SELECT nomeAluno, nomeTurma FROM tbAluno
INNER JOIN	tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
WHERE (nomeTurma) LIKE '1|B'

--EX04 Apresentar a quantidadede alunos que fizeram matricula em maio de 2016;
SELECT COUNT(tbMatricula.codAluno) FROM tbMatricula
WHERE MONTH(dtMatricula) = 05 AND YEAR(dtMatricula) = 2016

--EX05 Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas em que estão matriculados
SELECT nomeAluno, dtNascAluno from tbAluno
WHERE MONTH(tbAluno.dtNascAluno) = 3

--EX06 Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT codAluno, dtMatricula from tbMatricula
WHERE MONTH(tbMatricula.dtMatricula) = 5

--EX07 Apresentar a quantidade de alunos nascidos por estado
SELECT nomeAluno, naturalidadeAluno FROM tbAluno
WHERE (naturalidadeAluno) LIKE 'SP'

SELECT nomeAluno, naturalidadeAluno FROM tbAluno
WHERE (naturalidadeAluno) LIKE 'RJ'

SELECT nomeAluno, naturalidadeAluno FROM tbAluno
WHERE (naturalidadeAluno) LIKE 'PE'

SELECT nomeAluno, naturalidadeAluno FROM tbAluno
WHERE (naturalidadeAluno) LIKE 'ES'

--EX08 Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT nomeAluno, CONVERT(VARCHAR(12), dtMatricula, 103) 'Data' from tbAluno
INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno

--EX09 Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT nomeCurso, nomeAluno FROM tbCurso
INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
WHERE (nomeAluno) LIKE 'A%'

--EX10 Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT dtMatricula FROM tbMatricula
WHERE YEAR(dtMatricula) = 2016
