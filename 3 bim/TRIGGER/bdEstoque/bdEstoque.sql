CREATE DATABASE bdEstoques
USE bdEstoques

-- CLIENTE

CREATE TABLE tbCliente (
codCliente INT PRIMARY KEY IDENTITY(1,1) 
,nomeCliente VARCHAR (30) 
,cpfCliente VARCHAR (20) 
,emailCliente VARCHAR (40) 
,sexoCliente VARCHAR (10) 
,dataNascimentoCliente VARCHAR (11)
)

INSERT INTO tbCliente(nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente)
VALUES('Armando José Santana', '12345678900', 'amandojsantana@outlook.com', 'Masculino', '21/02/1961')
,('Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com.br', 'Feminino', '13/09/1978')
,('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'Masculino', '08/09/1981')
,('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'Feminino', '07/07/1962')
,('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'Feminino', '09/04/1977')
,('Paulo Henrique Silva', '87390123111', 'phsilva80@hotmail.com', 'Masculino', '02/02/1987')

SELECT * FROM tbCliente

-- FABRICANTE

CREATE TABLE tbFabricante(
codFabricante INT PRIMARY KEY IDENTITY(1,1)
,nomeFabricante VARCHAR (30)
)

INSERT INTO tbFabricante(nomeFabricante)
VALUES('Unilever')
,('P&G')
,('Bunge')

SELECT * FROM tbFabricante

-- FORNECEDOR

CREATE TABLE tbFornecedor(
codFornecedor INT PRIMARY KEY IDENTITY(1,1)
,nomeFornecedor VARCHAR (30)
,contatoFornecedor VARCHAR (30)
)

INSERT INTO tbFornecedor(nomeFornecedor, contatoFornecedor)
VALUES('Atacadão', 'Carlos Santos')
,('Assai', 'Maria Stella')
,('Roldão', 'Paulo César')

SELECT * FROM tbFornecedor

-- VENDA

CREATE TABLE tbVenda(
codVenda INT PRIMARY KEY IDENTITY(1,1)
,dataVenda VARCHAR (11)
,valorTotalVenda FLOAT
,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

INSERT INTO tbVenda(dataVenda, valorTotalVenda, codCliente)
VALUES('01/02/2014', '4500', '1')
,('03/02/2014', '3400', '1')
,('10/02/2014', '2100', '2')
,('15/02/2014', '2700', '3')
,('17/03/2014', '560', '3')
,('09/04/2014', '1200', '4')
,('07/05/2014', '3500', '5')
,('07/05/2014', '3400', '1')
,('05/05/2014', '4000', '2')

SELECT * FROM tbVenda

-- PRODUTO

CREATE TABLE tbProduto(
codProduto INT PRIMARY KEY IDENTITY(1,1)
,descricaoProduto VARCHAR (30)
,valorProduto FLOAT
,quantidadeProduto INT
,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
)

INSERT INTO tbProduto(descricaoProduto, valorProduto, quantidadeProduto, codFabricante, codFornecedor)
VALUES('Amanciante Downy', 5.76, 1500, 2, 1)
,('Amanciante Confort', 5.45, 2300, 1, 1)
,('Sabão em pó OMO', 5.99, 1280, 1, 2)
,('Margarina Qually', 4.76, 2500, 3, 1)
,('Salsisha Hot Dog Sadia', 6.78, 2900, 3, 2)
,('Mortadela Perdigão', 2.50, 1200, 3, 3)
,('Hamburguer Sadia', 9.89, 1600, 3, 1)
,('Fralda Pampers', 36.00, 340, 2, 3)
,('xampu Seda', 5.89, 800, 1, 2)
,('Condicionador Seda', 6.50, 700, 1, 3)

SELECT * FROM tbProduto

-- ITENS VENDAS

CREATE TABLE tbItensVenda(
codItensVenda INT PRIMARY KEY IDENTITY(1,1)
,quantidadeItensVenda INT
,subTotalItensVenda FLOAT
,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
)

INSERT INTO tbItensVenda(quantidadeItensVenda, subTotalItensVenda, codVenda, codProduto)
VALUES(200, 1500, 1, 1)
,(300, 3000, 1, 2)
,(120, 1400, 2, 4)
,(200, 1000, 2, 2)
,(130, 1000, 2, 3)
,(200, 2100, 3, 5)
,(120, 1000, 4, 4)
,(450, 700, 4, 5)
,(200, 560, 5, 5)
,(200, 600, 6, 7)
,(300, 600, 6, 6)
,(300, 2500, 8, 1)
,(200, 1000, 8, 2)
,(250, 1700, 9, 6)
,(200, 1700, 9, 5)
,(1000, 4000, 7, 4)

SELECT * FROM tbItensVenda


-- SAIDA PRODUTO

CREATE TABLE tbSaidaProduto (
	codSaidaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataSaidaProduto smalldatetime
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeSaidaProduto INT
)

-- ENTRADA PRODUTO

CREATE TABLE tbEntradaProduto (
	codEntradaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataEntradaProduto smalldatetime
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeEntradaProduto INT
)


