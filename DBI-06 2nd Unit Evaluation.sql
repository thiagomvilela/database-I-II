# ADSPL.8 - Banco de Dados I
# Docente: Danilo Farias Soares da Silva
# Discente: Thiago da Mota Vilela
# E-mail: tmv@discente.ifpe.edu.br - Data: 18 de janeiro de 2022

# Prova - 2ª Unidade

# Minimundo da Prova: As questões da prova serão referentes ao minimundo de uma lanchonete suas tabelas serão aos poucos inseridas no andamento das questões. 

# O minimundo é uma situação onde temos que desenvolver um banco de dados para uma lanchonete, controlar seus pedidos, estoque, fornecedores, vendas e controle dos seus funcionários. 
# A lanchonete é suprida por produtos que são fornecidas por fornecedores cadastrados no sistema;
# Cada produto é guardado no estoque tem um único fornecedor que abastece a lanchonete com aquele produto, à informação que liga o fornecedor ao produto está na tabela estoque;
# O Endereço pode ser para o funcionário assim como também para os fornecedores;
# Cada funcionário tem um único cargo;
# Funcionários realizam vendas, onde cada venda tem um pedido e uma data associada, e nesse pedindo tem uma lista de produtos e quantidades relacionados;
# Uma venda é realizada por um único funcionário, mas o funcionário como já comentado pode realizar mais de uma venda;
# A lanchonete tem todo o controle dos dados dos funcionários, tento relatórios que ajudam o RH da lanchonete.

# Descrição das tabelas da Lanchonete, lembrando o atributo que estiver apenas em negrito é uma chave estrangeira que relaciona a tabela com outra.

# 1ª) Sobre os comando de DDL do SQL, escreva como seria os comandos SQL para a criação das Tabelas do Mini-Mundo da Lanchonete da questão anterior. 
# Basta criar as tabelas de: Cargo, Endereço, Logradouro, Funcionário, Fornecedor e Estoque. (* 2 pontos)

CREATE DATABASE Lanchonete;

USE Lanchonete;

CREATE TABLE cargo(
	cod_cargo INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_cargo VARCHAR(25) NOT NULL
);

CREATE TABLE logradouro(
	cod_logradouro INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo_logradouro VARCHAR(10) NOT NULL,
	abrev_logradouro VARCHAR(6)
);

CREATE TABLE endereco(
	cod_endereco INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cod_logradouro INT (11) NOT NULL,
	nome_logradouro VARCHAR(40) NOT NULL,
	numero VARCHAR(6),
	bairro VARCHAR(20),
	cidade VARCHAR(30),
	estado VARCHAR(20),
	cep VARCHAR(9) NOT NULL,
	complemento VARCHAR(40),
	FOREIGN KEY (cod_logradouro) REFERENCES logradouro (cod_logradouro)
);

CREATE TABLE funcionario(
	cod_funcionario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_funcionario VARCHAR (50) NOT NULL,
	cod_endereco INT(11) NOT NULL,
	celular VARCHAR(15),
	fone_fixo VARCHAR(15),
	data_nasc DATE NOT NULL,
	sexo CHAR(1) NOT NULL,
	data_adm DATE NOT NULL,
	cod_cargo INT(11) NOT NULL,
	banco_horas INT(11),
	valor_salario DECIMAL(8,2) NOT NULL,
	FOREIGN KEY (cod_endereco) REFERENCES endereco (cod_endereco),
	FOREIGN KEY (cod_cargo) REFERENCES cargo (cod_cargo)
);

CREATE TABLE fornecedor(
	cod_fornecedor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_fornecedor VARCHAR(50) NOT NULL,
	cod_endereco INT(11) NOT NULL,
	cnpj VARCHAR(18) NOT NULL,
	inscricao_estadual VARCHAR(15),
	inscricao_municipal VARCHAR(15),
	email VARCHAR(70),
	contato_fornecedor VARCHAR(20),
	tipo_de_frete VARCHAR(4),
	icms VARCHAR(8),
	data_cadastro DATE NOT NULL,
	FOREIGN KEY(cod_endereco) REFERENCES endereco (cod_endereco)
);

CREATE TABLE estoque(
	cod_estoque INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cod_fornecedor INT(11) NOT NULL,
	nome_produto VARCHAR(35) NOT NULL,
	preco_unitario DECIMAL(8,2) NOT NULL,
	numero_nota_fiscal VARCHAR(25) NOT NULL,
	data_compra DATE NOT NULL,
	data_entrada DATE NOT NULL,
	quantidade INT(11) NOT NULL,
	data_fabricacao DATE NOT NULL,
	data_validade DATE NOT NULL,
	FOREIGN KEY(cod_fornecedor) REFERENCES fornecedor(cod_fornecedor)
);

CREATE TABLE telefone(
	cod_fornecedor INT(11) NOT NULL,
	fone VARCHAR(15),
	FOREIGN KEY (cod_fornecedor) REFERENCES fornecedor (cod_fornecedor)
);

CREATE TABLE vendas(
	cod_venda INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cod_funcionario INT(11) NOT NULL,
	data_venda DATE NOT NULL,
	FOREIGN KEY (cod_funcionario) REFERENCES funcionario (cod_funcionario)
);

CREATE TABLE produtos(
	cod_produtos INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	produto VARCHAR(35) NOT NULL,
	preco DECIMAL(8,2) NOT NULL
);

CREATE TABLE pedido(
	cod_venda INT(11) NOT NULL,
	cod_produtos INT(11) NOT NULL,
	quantidade INT(11) NOT NULL,
	FOREIGN KEY (cod_venda) REFERENCES vendas (cod_venda),
	FOREIGN KEY (cod_produtos) REFERENCES produtos (cod_produtos)
);

DESC cargo;
DESC logradouro;
DESC endereco;
DESC funcionario;
DESC fornecedor;
DESC estoque;
DESC telefone;
DESC vendas;
DESC produtos;
DESC pedido;

DROP TABLE cargo;
DROP TABLE logradouro;
DROP TABLE endereco;
DROP TABLE funcionario;
DROP TABLE fornecedor;
DROP TABLE estoque;
DROP TABLE telefone;
DROP TABLE vendas;
DROP TABLE produtos;
DROP TABLE pedido;

SELECT * FROM cargo;
SELECT * FROM logradouro;
SELECT * FROM endereco;
SELECT * FROM funcionario;
SELECT * FROM fornecedor;
SELECT * FROM estoque;
SELECT * FROM telefone;
SELECT * FROM vendas;
SELECT * FROM produtos;
SELECT * FROM pedido;

# 2ª) Sobre os comandos de DML do SQL, escreva como seria os comandos SQL para:
# Insira aqui a resposta da questão descrita acima (Sobre os comando de DML do SQL...): (* 3 pontos)

# a) (0,2) Inserir Três Cargos.
INSERT INTO cargo (nome_cargo)
	VALUES ("Atendente de Lanchonete"),
			 ("Atendente de Balcão"),
			 ("Monitor"),
			 ("Atendente de Loja"),
			 ("Assistente de Gerência"),
			 ("Assistente Júnior"),
			 ("Assistente de Gerente"),
			 ("Gerente"),
			 ("Gerente Operacional"),
			 ("Supervisor"),
			 ("Gerente de Loja"),
			 ("Consultor de Campo"),
			 ("Coordenador Financeiro");

# b) (0,2) Inserir Três Logradouros.
INSERT INTO logradouro (tipo_logradouro, abrev_logradouro)
	VALUES ("Alameda", 'AL'), #1
			 ("Avenida", 'AV'), #2
			 ("Estrada", 'EST'), #3
			 ("Fazenda", 'FAZ'), #4
			 ("Loteamento", 'LOT'), #5
			 ("Lote", 'LT'), #6
			 ("Praça", 'PC'), #7
			 ("Rodovia", 'ROD'), #8
			 ("Rua", 'R'), #9
			 ("Travessa", 'TV'); #10

# c) (0,2) Inserir Dois Endereços.
INSERT INTO endereco (cod_logradouro, nome_logradouro, numero, bairro, cidade, estado, cep, complemento)
	VALUES (9, "Cantora Clara Nunes", '699', "Timbó", "Abreu e Lima", "PE", '53520-430', NULL),
			 (10, "São Francisco", '234', "São Geraldo", "Arcoverde", "", '56515-291', NULL),
			 (9, "Dezenove", '236', "Ponte dos Carvalhos", "Cabo de Santo Agostinho", "PE", '54580-805', NULL),
			 (9, "José Diogo", '285', "Jardim Primavera", "Camaragibe", "PE", '54753-435', NULL),
			 (10, "Agrião", '140', "Fragoso", "Olinda", "PE", '53250-371', NULL),
			 (9, "Mocóca", '204', "Barra de Jangada", "Jaboatão dos Guararapes", "PE", '54490-202', "Apartamento 302"),
			 (2, "Presidente Kennedy", '208', "Candeias", "Jaboatão dos Guararapes", "PE", '54430-971', NULL),
			 (9, "Suriname", '110', "Dois Carneiros", "Jaboatão dos Guararapes", "PE", '54280-242', NULL),
			 (2, "Beira Rio", '822', "Jardim Jordão", "Jaboatão dos Guararapes", "PE", '54315230', NULL),
			 (9, "Primeiro de Maio", '658', "Piedade", "Jaboatão dos Guararapes", "PE", '54420-630', "Apartamento 401"),
			 (10, "Maurício Campos", '131', "Socorro", "Jaboatão dos Guararapes", "PE", '54150-587', NULL),
			 (9, "Manoel de Cristo Lobo", '379', "Maria Farinha", "Paulista", "PE", '53427-460', NULL),
			 (9, "Osvaldo de Quiroz", '762', "Maranguape I", "Paulista", "PE", '53444-380', NULL),
			 (9, "Paineiras", '115', "Pau Amarelo", "Paulista", "PE", '53423-730', NULL),
			 (2, "Central", '223', "Afogados", "Recife", "PE", '50770-740', NULL),
			 (9, "Escritor Abreu e Lima", '244', "Barro", "Recife", "PE", '51346-170', NULL),
			 (9, "Prof. Aurélio de Castro Cavalcanti", '462', "Boa Viagem", "Recife", "PE", '51210-020', "Apartamento 202"),
			 (10, "Arnoldo Magalhães", '690', "Casa Amarela", "Recife", "PE", '52051-283', NULL),
			 (9, "Professor Alfredo de Oliveira", '843', "Caxangá", "Recife", "PE", '50980-620', "Apartamento 1304"),
			 (9, "Pero Vaz de Caminha", '312', "Estância", "Recife", "PE", '50771-790', NULL);

# d) (0,2) Inserir Três Fornecedores.
INSERT INTO fornecedor (nome_fornecedor, cod_endereco, cnpj, inscricao_estadual, inscricao_municipal, email, contato_fornecedor, tipo_de_frete, icms, data_cadastro)
	VALUES ("Mateus e Raimundo Doces & Salgados ME", 1,'69.783.878/0001-47', '9537350-01', '60491258-302', "posvenda@mateuseraimundodocessalgadosme.com.br", '(81) 2857-7695', "CIF", '1,36 %', "2021-09-25"),
			 ("Ian e Jaqueline Limpeza Ltda", 2, '45.220.208/0001-54', '0194280-81', '78781813-133', "treinamento@ianejaquelinelimpezaltda.com.br", '(87) 2548-0100', "CIF", '1,36 %', "2021-10-25"),
			 ("Helena e Leonardo Pães e Doces ME", 3, '42.040.477/0001-40', '9779019-20', '12485684-646', "faleconosco@helenaeleonardopaesedocesme.com.br", '(81) 3656-0022', "FOB", '1.44 %', "2021-10-12"),
			 ("Vinicius e Augusto Comercio de Bebidas Ltda", 4, '11.643.150/0001-30', '4495071-30', '27794804-538', "faleconosco@viniciuseaugustocomerciodebebidasltda.com.br", '(81) 2958-8112', "FOB", '1.44 %', "2021-11-29"),	 
			 ("Giovana e Milena Marketing Ltda", 5, '21.450.734/0001-42', '8692212-21', '44041262-304', "compras@giovanaemilenamarketingltda.com.br", '(81) 3542-0457', "FOB", '1.44 %', "2021-11-30"),
			 ("Fábio e Aurora Telecomunicações Ltda", 6, '70.714.901/0001-20', '8185218-56', '10610158-661', "sistema@fabioeauroratelecomunicacoesltda.com.br", '(81) 2610-4295', "CIF", '1,36 %', "2021-12-01"),
			 ("Cauê e Rodrigo Financeira ME", 7, '01.748.544/0001-07', '2788058-33', '05147036-537', "financeiro@caueerodrigofinanceirame.com.br", '(81) 2644-9685', "CIF", '1,36 %', "2021-12-05");

# f) (0,2) Inserir Dois Funcionários
INSERT INTO funcionario (nome_funcionario, cod_endereco, celular, fone_fixo, data_nasc, sexo, data_adm, cod_cargo, banco_horas, valor_salario)
	VALUES ("Carlos Eduardo Renan Figueiredo", 8, '(81) 99997-0139', '(81) 3541-1695', '1990-01-15', "M", '2021-08-01', 1, '0', '1212'),
			 ("Cristiane Juliana Ester Oliveira", 9, '(81) 99979-8685', '(81) 2608-3736', '1986-03-17', "F", '2021-08-01', 2, '0', '1247'),
			 ("Elisa Clara Joana Rezende", 10, '(81) 98628-3001', '(81) 3840-9538', '1993-03-03', "F", '2021-08-01', 3, '1', '1445'),
			 ("Emilly Isabelle Moraes", 11, '(81) 98641-1893', '(81) 3761-5489', '1989-11-16', "F", '2021-08-01', 4, '2', '1470'),
			 ("Guilherme Vicente Moura", 12, '(81) 99725-4308', '(81) 2808-8329', '1977-07-09', "M", '2021-08-10', 5, '3', '1700'),
			 ("Heloisa Rita Assis", 13, '(81) 98831-4483', '(81) 2513-5716', '1961-04-10', "F", '2021-08-10', 6, '3', '2117'),
			 ("Iago Noah Sales", 14, '(81) 99306-6222', '(81) 3984-8180', '1970-03-05', "M", '2021-08-10', 7, '3', '2345'),
			 ("Kamilly Sarah Isabel Corte Real", 15, '(81) 98785-9511', '(81) 2506-9677', '1965-01-18', "F", '2021-08-10', 8, '4', '3616'),
			 ("Marcela Luciana Corte Real", 16, '(81) 98508-9898', '(81) 3658-7554', '1973-12-21', "F", '2021-08-10', 9, '5', '3879'),
			 ("Nathan Erick Heitor Barros", 17, '(81) 99507-7405', '(81) 3506-2844', '1985-02-15', "M", '2021-08-15', 10, '5', '3920'),
			 ("Pedro Henrique Marcelo Brito", 18, '(81) 98657-4622', '(81) 3647-9012', '1973-06-25', "M", '2021-08-15', 11, '8', '4277'),
			 ("Renato Vinicius Baptista", 19, '(81) 99833-9018', '(81) 2739-4390', '1972-02-01', "M", '2021-08-15', 12, '10', '6257'),
			 ("Sérgio Nathan Rodrigues", 20, '(81) 99239-0857', '(81) 2675-3859', '1974-09-01', "M", '2021-08-15', 13, '10', '6937');

# g) (0,5) Atualizar a tabela Funcionário, incluindo os atributos: (ALTER TABLE)
# 	- departamento varchar (60)
ALTER TABLE funcionario
	ADD COLUMN departamento VARCHAR (60);
	
# 	- status_empregado char(1)
ALTER TABLE funcionario
	ADD COLUMN status_empregado CHAR (1);

# h) (0,5) Atualizar os dados do estoque aumentando em 10% o seu preco_unitario de cada produto do fornecedor 1 (UPDATE);
INSERT INTO estoque (cod_fornecedor, nome_produto, preco_unitario, numero_nota_fiscal, data_compra, data_entrada, quantidade, data_fabricacao, data_validade)
	VALUES (1, "Pastel de Carne", '3.00', "126.943", '2021-09-01', '2021-09-15', "25", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Carne c/ Ovo", '4.00', "126.943", '2021-09-01', '2021-09-15', "20", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Carne c/ Queijo", '4.50', "126.943", '2021-09-01', '2021-09-15', "20", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Calabresa", '3.00', "126.943", '2021-09-01', '2021-09-15', "25", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Frango", '3.00', "126.943", '2021-09-01', '2021-09-15', "25", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Palmito", '4.00', "126.943", '2021-09-01', '2021-09-15', "10", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Parmegiana", '6.50', "126.943", '2021-09-01', '2021-09-15', "15", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Queijo", '3.00', "126.943", '2021-09-01', '2021-09-15', "15", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Queijo c/ Milho", '4.50', "126.943", '2021-09-01', '2021-09-15', "10", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Brigadeiro", '4.00', "126.943", '2021-09-01', '2021-09-15', "15", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Beijinho", '4.00', "126.943", '2021-09-01', '2021-09-15', "15", '2021-09-10', '2021-10-10'),
			 (1, "Pastel de Nutella", '4.50', "126.943", '2021-09-01', '2021-09-15', "15", '2021-09-10', '2021-10-10'),
			 (3, "Coxinha de Frango", '3.00', "234.491", '2021-09-05', '2021-09-20', "25", '2021-09-15', '2021-11-15'),
			 (3, "Coxinha de Charque", '4.00', "234.491", '2021-09-05', '2021-09-20', "20", '2021-09-15', '2021-11-15'),
			 (3, "Coxinha de Camarão", '4.50', "234.491", '2021-09-05', '2021-09-20', "15", '2021-09-15', '2021-11-15'),
			 (3, "Esfirra de Frango", '4.00', "234.491", '2021-09-05', '2021-09-20', "15", '2021-09-15', '2021-11-15'),
			 (3, "Esfirra de Carne", '4.00', "234.491", '2021-09-05', '2021-09-20', "20", '2021-09-15', '2021-11-15'),		 
			 (3, "Esfirra de Calabresa", '4.00', "234.491", '2021-09-05', '2021-09-20', "20", '2021-09-15', '2021-11-15'),
			 (4, "Suco de Abacaxi", '4.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Açaí", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Acerola", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Caju", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Goiabaa", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Graviola", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Laranja", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Limão", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Mamão", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Manga", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Melão", '4.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Melancia", '4.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Morango", '4.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20'),
			 (4, "Suco de Uva", '3.00', "541.136", '2021-09-10', '2021-09-25', "30", '2021-09-20', '2021-12-20');
	 
UPDATE estoque
	SET preco_unitario = preco_unitario * 1.10
	WHERE cod_fornecedor = 1;
	
# i) (0,5) Deletar todos os funcionários que tenham salário entre 2.000 até 3.500 (DELETE);
DELETE FROM funcionario
	WHERE valor_salario BETWEEN 2000 AND 3500;

# j) (0,5) Deletar todos os funcionários do cargo ‘Gerente’, usando subconsultas (DELETE); eu escolho
DELETE FROM funcionario
	WHERE cod_cargo IN (SELECT cod_cargo FROM cargo
	WHERE nome_cargo LIKE "Gerente");

# 3ª) Sobre os comando de DQL do SQL, escreva como seria os comandos SQL para:
# Insira aqui a resposta da questão descrita a cima (Sobre os comando de DQL do SQL...): (*2 pontos)

# a) (0,5) Listar os funcionários e o seu cargo (nome do cargo);
#            i.  (Nome do Funcionário | cargo)
SELECT f.nome_funcionario 'Nome do Funcionário', c.nome_cargo 'Cargo'
	FROM funcionario f, cargo c
		WHERE f.cod_cargo = c.cod_cargo
			ORDER BY f.nome_funcionario ASC;

# b) (0,5) Listar os produtos que estão com o preço acima da média. Deve ser usado subconsultas;
#            i.  (Nome do Produto | Preço)
INSERT INTO produtos (produto, preco)
	VALUES ("Pastel de Carne", '5.00'),
			 ("Pastel de Carne c/ Ovo",'6.00'),
			 ("Pastel de Carne c/ Queijo", '6.00'),
			 ("Pastel de Calabresa", '5.00'),
			 ("Pastel de Frango", '5.00'),
			 ("Pastel de Palmito", '6.00'),
			 ("Pastel de Parmegiana", '9.50'),
			 ("Pastel de Queijo", '5.00'),
			 ("Pastel de Queijo c/ Milho", '6.50'),
			 ("Pastel de Brigadeiro", '7.00'),
			 ("Pastel de Beijinho", '7.00'),
			 ("Pastel de Nutella", '7.50'),
			 ("Coxinha de Frango", '5.00'),
			 ("Coxinha de Charque", '6.00'),
			 ("Coxinha de Camarão", '7.50'),
			 ("Esfirra de Frango", '6.00'),
			 ("Esfirra de Carne", '6.00'),
			 ("Esfirra de Calabresa", '6.00'),
			 ("Suco de Abacaxi", '6.00'),
			 ("Suco de Açaí", '5.00'),
			 ("Suco de Acerola", '5.00'),
			 ("Suco de Caju", '5.00'),
			 ("Suco de Goiaba", '5.00'),
			 ("Suco de Graviola", '5.00'),
			 ("Suco de Laranja", '5.00'),
			 ("Suco de Limão", '5.00'),
			 ("Suco de Mamão", '5.00'),
			 ("Suco de Manga", '5.00'),
			 ("Suco de Melão", '6.00'),
			 ("Suco de Melancia", '6.00'),
			 ("Suco de Morango", '6.00'),
			 ("Suco de Uva", '6.00');

SELECT ROUND(AVG(preco),2) 'Preço Médio dos Produtos' FROM produtos;

SELECT produto 'Nome do Produto', CONCAT ('R$ ', preco) 'Preço' FROM produtos
	WHERE preco > (SELECT ROUND (AVG(preco),2) FROM produtos)
		ORDER BY preco, produto ASC;
	
# c) (0,5) Listar os sucos disponíveis. Lembrando que todo suco cadastrado em produtos começam com “Suco de ”, por exemplo, “Suco de Laranja”;
#           i.  (Nome do Produto | Preço)
SELECT produto 'Nome do Produto', CONCAT ('R$ ', preco) 'Preço' FROM produtos
	WHERE produto LIKE "Suco de %";

# d) (0,5) Informar quantas vendas foram realizadas por dia.
#           i.  (Data | Quantidade de Vendas)
INSERT INTO vendas (cod_funcionario, data_venda)
	VALUES (1, '2021-10-01'),
	 		 (1, '2021-10-02'),
	 		 (1, '2021-10-03'),
	 		 (1, '2021-10-04'),
			 (1, '2021-10-05'),
			 (2, '2021-10-01'),
	 		 (2, '2021-10-02'),
	 		 (2, '2021-10-03'),
	 		 (2, '2021-10-04'),
			 (2, '2021-10-05'),
			 (4, '2021-10-01'),
	 		 (4, '2021-10-02'),
	 		 (4, '2021-10-03');

INSERT INTO pedido (cod_venda, cod_produtos, quantidade)
	VALUES (1, '1', "3"),
			 (2, '3', "4"),
			 (3, '5', "3"),
			 (4, '6', "2"),
			 (5, '10', "4"),
			 (6, '13', "1"),
			 (7, '15', "5"),
			 (8, '17', "4"),
			 (9, '18', "8"),
			 (10, '20', "7"),
			 (11, '22', "6"),
			 (12, '31', "9"),
			 (13, '32', "10");

SELECT data_venda 'Data', SUM(quantidade) 'Quantidade de Vendas'
	FROM pedido p, vendas v
		WHERE p.cod_venda = v.cod_venda
			GROUP BY data_venda
				ORDER BY data_venda ASC;

# Obs.: 
# - Considere também a imagem da estrutura do banco de dados da questão 4;
# - Cada letra pede um select com apenas os campos no formado dos subitens i de cada letra. 