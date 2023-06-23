-----------------01 EX

create PROCEDURE spBUSCA_ALUNO
	@codAluno INT
AS
	
IF NOT EXISTS(SELECT codAluno FROM tbAluno1 WHERE codAluno LIKE @codAluno)
BEGIN	
	
	PRINT 'O codigo n?o existe'
END
ELSE
BEGIN 
	 SELECT codAluno, nomeAluno, dataNasc FROM tbAluno1 where codAluno LIKE @codAluno
END
-------
EXEC spBUSCA_ALUNO 1

EXEC spBUSCA_ALUNO 10

-----------------02 EX

create PROCEDURE spINSERE_ALUNO
	@nomeAluno VARCHAR(50), @rgAluno VARCHAR(15), @logradouro VARCHAR(50), @numero int, @cep VARCHAR(10), @bairro VARCHAR(40), @cidade VARCHAR(30), @dataNasc SMALLDATETIME
AS
	IF EXISTS (SELECT rgAluno FROM tbAluno1 WHERE rgAluno LIKE @rgAluno)
	BEGIN
		PRINT ('Aluno existente no banco de dados')
	END
	ELSE
	BEGIN
	INSERT INTO tbAluno1(nomeAluno, rgAluno, logradouro, numero, cep,
		bairro, cidade, dataNasc)

	VALUES (@nomeAluno, @rgAluno, @logradouro, @numero,	@cep, 
		@bairro, @cidade, @dataNasc)

		PRINT ('Aluno ' +(@nomeAluno+ ' foi inserido com sucesso!'))
	END

	select* from tbAluno1

EXEC spINSERE_ALUNO 'Vanessa','82-292-122-0','av','123456789','87654321','campinas','SP','05/12/1980'

EXEC spINSERE_ALUNO 'helen','94-342-980-4','av','123456789','87654321','campinas','SP','05/12/1980'

-----------------03 EX

create PROCEDURE spAUMENTA_PRECO
	@nomeCurso VARCHAR(30), @porc DECIMAL
AS
	IF EXISTS (SELECT nomeCurso FROM tbCurso1 WHERE nomeCurso LIKE @nomeCurso)
	BEGIN
		UPDATE tbCurso1
		SET valorCurso = valorCurso + valorCurso * @porc/100
		WHERE nomeCurso LIKE @nomeCurso

		PRINT ('O valor do curso de ' +@nomeCurso+ ' teve um aumento de ' +CONVERT(VARCHAR(5),@porc)+ '%')
	END
	ELSE
	BEGIN
		PRINT ('Curso n?o existente no banco de dados')
	END

	select* from tbCurso1


EXEC spAUMENTA_PRECO 'alem?o', 20	

EXEC spAUMENTA_PRECO 'ingl?s', 10

-----------------04 EX

create PROCEDURE spEXIBE_TURMA
	@descricaoTurma VARCHAR(30)
AS
	IF EXISTS (SELECT descricaoTurma FROM tbTurma WHERE descricaoTurma LIKE @descricaoTurma)
	BEGIN
		SELECT * FROM tbTurma
		WHERE descricaoTurma = @descricaoTurma
	END
	ELSE
	BEGIN
		PRINT ('Turma n?o existente no banco de dados')
	END

EXEC spEXIBE_TURMA 'Turma 1? andar'

EXEC spEXIBE_TURMA 'Turma 4? andar'

-----------------05 EX

create PROCEDURE spEXIBIR_ALUNOSTURMA
	@descricaoTurma VARCHAR(30)
AS
	IF EXISTS (SELECT descricaoTurma FROM tbTurma WHERE descricaoTurma LIKE @descricaoTurma)
	BEGIN
		SELECT descricaoTurma, nomeAluno FROM tbMatricula1
		INNER JOIN tbTurma ON tbMatricula1.codTurma = tbTurma.codTurma
		INNER JOIN tbAluno1 ON tbAluno1.codAluno = tbMatricula1.codAluno
		WHERE (descricaoTurma) LIKE @descricaoTurma
	END
	ELSE
	BEGIN
		PRINT ('Turma n?o existente no banco de dados')
	END

EXEC spEXIBIR_ALUNOSTURMA 'Turma 1? andar'

EXEC spEXIBIR_ALUNOSTURMA 'Turma 4? andar'

-----------------06 EX

alter PROCEDURE spINSERE_ALUNOCPF
	@nomeAluno VARCHAR(50), @rgAluno VARCHAR(15), @logradouro VARCHAR(50), @numero int, @cep VARCHAR(10), @bairro VARCHAR(40), @cidade VARCHAR(30), @dataNasc SMALLDATETIME, @cpfAluno VARCHAR(14)
AS
	IF NOT EXISTS (SELECT cpfAluno FROM tbAluno1 WHERE cpfAluno LIKE @cpfAluno)
	BEGIN
		INSERT INTO tbAluno1(nomeAluno, rgAluno, cpfAluno, logradouro, numero, cep,
			bairro, cidade, dataNasc)

		VALUES (@nomeAluno, @rgAluno, @cpfAluno, @logradouro, @numero,	@cep, 
			@bairro, @cidade, @dataNasc)

			PRINT ('Aluno ' +(@nomeAluno+ ' foi inserido com sucesso!'))

	END
	ELSE
	BEGIN
		PRINT ('Aluno existente no banco de dados')
	END

EXEC spINSERE_ALUNOCPF 'Arrascaeta', '11-111-111', 'Rua Soarez', 400, '04587-898', 'Cidade Santana', 'RJ',   '10/01/2006',   '123.444.789-90' 

SELECT * FROM tbAluno1

INNER JOIN tbTurma ON tbMatricula1.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso1 ON tbTurma.codCurso = tbCurso1.codCurso
		INNER JOIN tbAluno1 ON tbMatricula1.codAluno = tbAluno1.codAluno
	
-----------------07 EX

create PROCEDURE spRECEBE_ALUNO
	@nomeAluno VARCHAR(50), @nomeCurso VARCHAR (30)
AS
BEGIN
	IF EXISTS (SELECT nomeCurso FROM tbCurso1 WHERE nomeCurso LIKE @nomeCurso)BEGIN
    	IF EXISTS (SELECT nomeAluno FROM tbAluno1 WHERE nomeAluno LIKE @nomeAluno)BEGIN

		DECLARE @codAluno INT
        DECLARE @codTurma INT
        
		SET @codAluno = (SELECT codAluno FROM tbAluno1 WHERE nomeAluno LIKE @nomeAluno);
        
		SET @codTurma= (SELECT codTurma FROM tbTurma 
                        INNER JOIN tbCurso1 ON tbCurso1.codCurso = tbTurma.codCurso 
                        WHERE nomeCurso LIKE @nomeCurso);
        
		INSERT INTO tbMatricula1(dataMatricula, codAluno, codTurma)
		VALUES (GETDATE(), @codAluno, @codTurma)
        END
	END
    ELSE 
    BEGIN
    	PRINT('CADASTRO INVÁLIDO')
		
		PRINT ('Aluno ' +(@nomeAluno+ ' foi matriculado com sucesso!'))
	END
END

EXEC spRECEBE_ALUNO 'Alem?o', 'Vanessa'