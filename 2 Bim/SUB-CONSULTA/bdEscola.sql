﻿USE bdEscola

--1 - Criar uma consulta que retorne o nome e o preço dos cursos que custem abaixo do valor médio.​

SELECT nomeCurso, valorCurso  FROM tbCurso1
	WHERE valorCurso > (SELECT AVG(valorCurso) FROM tbCurso1)

--2 - Criar uma consulta que retorne o nome e o rg do aluno mais novo.​

SELECT nomeAluno, rgAluno FROM tbAluno1
	WHERE dataNasc = (select MIN(dataNasc) from tbAluno1)

--3 - Criar uma consulta que retorne o nome do aluno mais velho.​

SELECT nomeAluno FROM tbAluno1
	WHERE dataNasc = (select MAX(dataNasc) from tbAluno1)

--4 - Criar uma consulta que retorne o nome e o valor do curso mais caro.​

SELECT nomeCurso, valorCurso  FROM tbCurso1
	WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso1)

--5 - Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a última matrícula.​

SELECT nomeAluno,nomeCurso, dataMatricula FROM tbMatricula1
INNER JOIN tbAluno1 ON(tbMatricula1.codAluno = tbAluno1.codAluno)
INNER JOIN tbTurma ON (tbMatricula1.codTurma = tbTurma.codTurma)
INNER JOIN tbCurso1 ON (tbTurma.codCurso = tbCurso1.codCurso)
	WHERE dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula1)

--6 - Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas.​

SELECT nomeAluno, dataMatricula FROM tbMatricula1
INNER JOIN tbAluno1 ON(tbMatricula1.codAluno = tbAluno1.codAluno)
	WHERE dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula1)

--7 - Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de inglês.

SELECT nomeAluno, rgAluno, dataNasc, nomeCurso FROM tbMatricula1
INNER JOIN tbAluno1 ON(tbMatricula1.codAluno = tbAluno1.codAluno)
INNER JOIN tbTurma ON (tbMatricula1.codTurma = tbTurma.codTurma)
INNER JOIN tbCurso1 ON (tbTurma.codCurso = tbCurso1.codCurso)
	WHERE nomeCurso LIKE 'Inglês' 