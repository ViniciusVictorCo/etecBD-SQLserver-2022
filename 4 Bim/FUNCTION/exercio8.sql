CREATE FUNCTION fcValidaCPF(@codCliente INT)
    RETURNS VARCHAR(15) AS
BEGIN

    DECLARE @cpfCli VARCHAR(15) = (SELECT cpfCliente FROM tbCliente WHERE @codCliente = codCliente),
    @Soma INT,
    @Indice INT,
    @Digito1 INT,
    @Digito2 INT,
    @cpf_temp VARCHAR(11),
    @DigitosIguais CHAR(1),
    @resultado VARCHAR(30)

    SET @resultado = 'N'
    SET @cpf_temp = SUBSTRING(@cpfCli,1,1)
    SET @Indice = 1
    SET @DigitosIguais = 'S'

    WHILE (@indice <= 11) BEGIN 
        IF SUBSTRING(@cpfCli,@Indice,1) <> @cpf_temp 
        SET @DigitosIguais = 'N'
        SET @Indice = @Indice + 1
    END

    IF @DigitosIguais = 'N' BEGIN
        SET @Soma = 0 
        SET @Indice = 1

    WHILE (@INDICE <= 9)BEGIN
        SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@cpfCli,@Indice,1)) * (11 -@INDICE);
        SET @INDICE = @INDICE + 1

    END

    SET @Digito1 = 11 -(@soma % 11)
        IF @Digito1 > 9
        SET @Digito1 = 0;

    SET @SOMA = 0
    SET @INDICE = 1
    WHILE (@INDICE <= 10) BEGIN
        SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@cpfCli,@Indice,1)) * (12 -@Indice);
        SET @Indice = @Indice + 1
    END

    SET @Digito2 = 11 -(@Soma % 11)
        IF @Digito2 > 9
        SET @Digito2 = 0;

    IF (@Digito1 = SUBSTRING(@cpfCli,LEN(@cpfCli)-1,1)) AND (@Digito2 = SUBSTRING(@cpfCli,LEN(@cpfCli),1))
        SET @resultado = 'CPF VÁLIDO   | '+@cpfCli
    ELSE
        SET @resultado = 'CPF INVÁLIDO  | '+@cpfCli
    END

    RETURN @resultado
    END

    SELECT CPF=dbo.fcValidaCPF(3)