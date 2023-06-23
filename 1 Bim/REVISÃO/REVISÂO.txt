CREATE DATABASE bdUniversidade
USE bdUniversidade

--campus 
CREATE TABLE tbCampus (
	codCampus int PRIMARY KEY IDENTITY(1,1)
	,nomeCampus VARCHAR(45) NOT NULL
);
---------------------

--cursos
CREATE TABLE tbCurso (
	codCurso int PRIMARY KEY IDENTITY(1,1)
	,nomeCurso varchar(50)NOT NULL
	,cargaHoraria int NOT NULL
);
---------------------

--aluno
CREATE TABLE tbAluno (	
	codAluno int PRIMARY KEY IDENTITY (1,1)
	,nomeAluno varchar(60) NOT NULL
	,cpfAluno char(11) NOT NULL
	,rgAluno varchar(15) NOT NULL
	,dtNascAluno smalldatetime
);
---------------------

--professor
CREATE TABLE tbProfessor (	
	codProf int PRIMARY KEY IDENTITY (1,1)
	,nomeProf varchar(60) NOT NULL
	,cpfProf char(11) NOT NULL
	,rgProf varchar(15) NOT NULL
	,dtNascProf smalldatetime
);
---------------------

--disciplina
CREATE TABLE tbDisciplina1 (
	codDisciplina int PRIMARY KEY IDENTITY(1,1)
	,nomeDisciplina varchar(40)NOT NULL
	,cargaHorariaDisciplina int NOT NULL
);
---------------------

--turma
CREATE TABLE tbTurma (
	codTurma int PRIMARY KEY IDENTITY(1,1)
	,descricaoTurma varchar(30)
	,codCurso int FOREIGN KEY REFERENCES tbCurso(codCurso)
	,codCampus int FOREIGN KEY REFERENCES tbCampus(codCampus)
	,semestre INT
	,numAluno INT
	,dtConclusao SMALLDATETIME
);
---------------------

--matricula
CREATE TABLE tbMatricula (
	codMatricula int PRIMARY KEY IDENTITY(1,1)
	,dtMatricula SMALLDATETIME
	,codAluno int FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma int FOREIGN KEY REFERENCES tbTurma(codTurma)
);
---------------------

--Atribuicao
CREATE TABLE tbAtribuicao (
	codAtribuicao int PRIMARY KEY IDENTITY(1,1)
	,dtAtribuicao SMALLDATETIME
	,codDisciplina int FOREIGN KEY REFERENCES tbDisciplina1(codDisciplina)
	,codTurma int FOREIGN KEY REFERENCES tbTurma(codTurma)
	,codProf int FOREIGN KEY REFERENCES tbProfessor(codProf)
);
---------------------