CREATE DATABASE	bdEscola
USE bdEscola

CREATE TABLE tbAluno2A (
	rmAluno INT PRIMARY KEY
	,NomeAluno VARCHAR (40)
	,Status VARCHAR(15)
)

INSERT INTO tbAluno2A (rmAluno,nomeAluno,Status) 
VALUES (1111,'Luiz Vinicus','APROVADO')
		,(1112,'Vinicius','APROVADO')
		,(1113,'Magno','APROVADO')
		,(1114,'Felipe','APROVADO')
		,(1115,'Claudio','APROVADO')
		,(1116,'Clebin','APROVADO')
		,(1117,'Aline','APROVADO')
		,(1118,'Geovana','REPROVADO')
		,(1119,'Leticia','APROVADO')
		,(1120,'Roberto','REPROVADO')
		,(1121,'Victor','REPROVADO')


SELECT * FROM tbAluno2A

CREATE TABLE tbAluno2B (
	rmAluno INT PRIMARY KEY
	,NomeAluno VARCHAR (40)
	,Status VARCHAR(15)
)

INSERT INTO tbAluno2B(rmAluno,NomeAluno,Status)
VALUES (2111,'Felipe','APROVADO')
		,(2112,'Goes','APROVADO')
		,(2113,'Fabin','APROVADO')
		,(2114,'Fernado','APROVADO')
		,(2115,'Cristiano','APROVADO')
		,(1116,'Gabriel','APROVADO')
		,(2117,'Tales','APROVADO')
		,(2118,'Lucas','REPROVADO')
		,(2119,'Leo','APROVADO')
		,(2120,'Roger','REPROVADO')
		,(2121,'Pablo','REPROVADO')


SELECT * FROM tbAluno2B

CREATE TABLE tbAluno3 (
	rmAluno INT PRIMARY KEY
	,NomeAluno VARCHAR (40)
	,Status VARCHAR(15)
)

SELECT * FROM tbAluno3

-----MERGE-----
MERGE tbAluno3 dest
	using tbAluno2A ori
	on ori.rmAluno = dest.rmAluno
	WHEN NOT MATCHED AND status like 'APROVADO' THEN 
	INSERT values (ori.rmAluno,ori.nomeAluno,ori.status);

MERGE tbAluno3 dest
	using tbAluno2B ori
	on ori.rmAluno = dest.rmAluno
	WHEN NOT MATCHED AND status like 'APROVADO' THEN 
	INSERT values (ori.rmAluno,ori.nomeAluno,ori.status);

