CREATE DATABASE bdEscolaVIEW
USE bdEscolaVIEW

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (50)
	,rgAluno VARCHAR (15)
	,logradouro VARCHAR (50)
	,numero INT 
	,complemento VARCHAR (30)
	,cep VARCHAR(10)
	,bairro VARCHAR (40)
	,cidade VARCHAR (30)
	,dataNasc SMALLDATETIME 
)

INSERT INTO tbAluno( nomeAluno, rgAluno, logradouro, numero, cep, bairro, cidade, dataNasc)
VALUES ( 'Nátalia Gomes', '82-292-122-0', 'Rua Nina', 2395, '66-666-666', 'Guainases', 'SP', '03/10/2003')
	  ,( 'Julia Helena', '60-902-862-1', 'Rua Soarez', 400, '11-111-111', 'Cidade Santana', 'RJ', '10/01/2006')
	  ,( 'Anna Lívia Melo', '50-692-802-2', 'Rua Leandro', 5, '22-222-222', 'Cidade Tiradentes', 'MG', '05/12/1980')
	  ,( 'Diogo Resolino', '40-276-342-3', 'Avenida Metalúrgicos', 23, '44-444-444', 'Itaquera', 'SP', '23/04/2000')
	  ,( 'Célia Cunha', '30-892-987-4', 'Rua Renê', 225, '33-333-343', 'Suzano', 'ES', '09/11/1940')

SELECT * FROM tbAluno


CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR (30)
	,cargaHoraria INT
	,valorCurso MONEY 
)
INSERT INTO tbCurso ( nomeCurso, cargaHoraria, valorCurso)
VALUES ( 'Inglês',100, 356)
	  ,( 'Alemão',90, 245)
	  ,( 'Coreano',80, 260)

SELECT * FROM tbCurso


CREATE TABLE tbNivel (
	codNivel INT PRIMARY KEY IDENTITY (1,1)
	,descricaoNivel VARCHAR (45)
)

INSERT INTO tbNivel(descricaoNivel)
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
	,numTelAluno VARCHAR (9)
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
)

INSERT INTO tbTelefoneAluno ( numTelAluno, codAluno )
VALUES	( '2285-2788', 1)
		,( '2456-798', 2)
	   ,( '2897-0121', 3)
	   ,( '2134-7865', 4)
	   ,( '2678-1023', 5)

SELECT * FROM tbTelefoneAluno

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula SMALLDATETIME 
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)

INSERT INTO tbMatricula( dataMatricula, codAluno, codTurma)
VALUES ( '10/12/2020', 1, 1)
	  ,( '22/12/2021', 1, 2)
	  ,( '20/02/2022', 2, 3)
	  ,( '15/01/2020', 2, 2)
	  ,( '05/10/2020', 3, 1)

SELECT * FROM tbMatricula

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,descricaoTurma VARCHAR (45)
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,codNivel INT FOREIGN KEY REFERENCES tbNivel(codNivel)
	,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(codPeriodo)
	,horario TIME 
	,diaDaSemana VARCHAR (8)
	,qtdeAluno INT
)

INSERT INTO tbTurma ( descricaoTurma, codCurso, codNivel, codPeriodo, horario, diaDaSemana, qtdeAluno)
VALUES ( 'Turma 1° andar', 1, 1, 1, '14:00', 'Segunda', 40)
	  ,( 'Turma 2° andar', 2, 2, 2, '19:00', 'Segunda', 42)
	  ,( 'Turma 3° andar', 3, 3, 3, '17:00', 'Segunda', 40)

SELECT * FROM tbTurma

--1 Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio.​CREATE VIEW 
CREATE VIEW VWPrecoBaixo01 AS

SELECT codCurso, nomeCurso, cargaHoraria, valorCurso FROM tbCurso
WHERE valorCurso < (SELECT AVG (valorCurso)FROM tbCurso)

--2 Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.​

SELECT nomeCurso, cargaHoraria FROM VWPrecoBaixo01 ORDER BY cargaHoraria DESC

--3 Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.​
CREATE VIEW VWAlunosTurma02 AS

SELECT nomeCurso, qtdeAluno, descricaoTurma FROM tbTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso;

SELECT * FROM VWAlunosTurma02

--4 Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.​

SELECT nomeCurso, qtdeAluno, descricaoTurma FROM VWAlunosTurma
WHERE qtdeAluno = (SELECT MAX (qtdeAluno)FROM tbTurma)

--5 Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.​
CREATE VIEW VWTurmaCurso01 AS

SELECT nomeCurso, COUNT(codTurma) FROM tbTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
GROUP BY nomeCurso

--6 Usando a visão “Turma_Curso exiba o curso com menor número de turmas.​

SELECT nomeCurso FROM VWAlunosTurma01
