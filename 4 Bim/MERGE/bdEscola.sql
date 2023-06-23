CREATE DATABASE	bdEscola
USE bdEscola

CREATE TABLE tbAlunos2A (
	rmAluno INT PRIMARY KEY
	,NomeAluno VARCHAR (40)
	,Status VARCHAR(15)
)

INSERT INTO tbAluno2A (rmAluno,nomeAluno,Status) 
VALUES (1111,'Luiz Vinicus','APROVADO')
		,(1112,'Vinicius','APROVADO')
		,(1113,'Magno','APROVADO')
		,(1113,'Victor','REPROVADO')
		,(1114,'Felipe','APROVADO')
		,(1115,'Claudio','APROVADO')
		,(1116,'Clebin','APROVADO')
		,(1117,'Aline','APROVADO')
		,(1118,'Geovana','REPROVADO')
		,(1119,'Leticia','APROVADO')
		,(1120,'Roberto','REPROVADO')


SELECT * FROM tbAlunos2A

CREATE TABLE tbAlunos2B (
	rmAluno INT PRIMARY KEY
	,NomeAluno VARCHAR (40)
	,Status VARCHAR(15)
)

INSERT INTO tbAlunos2B(rmAluno,NomeAluno,Status)
VALUES (2111,'Felipe','APROVADO')
		,(2112,'Goes','APROVADO')
		,(2113,'Fabin','APROVADO')
		,(2113,'Pablo','REPROVADO')
		,(2114,'Fernado','APROVADO')
		,(2115,'Cristiano','APROVADO')
		,(1116,'Gabriel','APROVADO')
		,(2117,'Tales','APROVADO')
		,(2118,'Lucas','REPROVADO')
		,(2119,'Leo','APROVADO')
		,(2120,'Roger','REPROVADO')


SELECT * FROM tbAlunos2A

CREATE TABLE tbAlunos3 (
	rmAluno INT PRIMARY KEY
	,NomeAluno VARCHAR (40)
	,Status VARCHAR(15)
)

