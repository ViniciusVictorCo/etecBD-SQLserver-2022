CREATE FUNCTION fcAlterarData (@Data date)
returns varchar (40) AS
BEGIN
	DECLARE @dataMatricula date
	set @dataMatricula=@Data
	DECLARE @apresenta VARCHAR(40)
	SET @apresenta = (SELECT CONVERT (varchar(40), @dataMatricula, 103)) 

return @apresenta
END
SELECT Status=dbo.fcAlterarData(dataMatricula) FROM tbMatricula1
