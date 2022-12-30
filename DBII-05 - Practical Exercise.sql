-- ADSPL.15 - Banco de Dados II
-- Docente: Eudes da Silva Barboza
-- Discente: Thiago da Mota Vilela
-- E-mail: tmv@discente.ifpe.edu.br - Data: 25 de maio de 2022

-- Atividade 04 – Exercício Prático (Lista SQL)

-- ESTUDO DE CASO: EMPRESA DE CONTROLE DE TRANSPORTADORA DE FRETES

-- Criar as tabelas abaixo:
-- FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento)
-- CIDADE_T (cod_cidade, nome_cidade, uf, taxa)
-- CLIENTE_T (cod_cliente, nome_cliente, endereço, telefone, email, renda)
-- FRETE_T (cod_frete, data, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete)

CREATE TABLE FUNCIONARIO_T
(
    cod_funcionario NUMBER(5) PRIMARY KEY NOT NULL,
    nome_funcionario VARCHAR2(100) NOT NULL,
    salario NUMBER(10,2) NOT NULL,
    departamento VARCHAR2(60) NOT NULL
);

CREATE TABLE CIDADE_T
(
    cod_cidade NUMBER(5) PRIMARY KEY NOT NULL,
    nome_cidade VARCHAR2(80) NOT NULL,
    uf VARCHAR2(2) NOT NULL,
    taxa NUMBER(10,2) NOT NULL
);

CREATE TABLE CLIENTE_T
(
    cod_cliente NUMBER(5) PRIMARY KEY NOT NULL,
    nome_cliente VARCHAR2(100) NOT NULL,
    endereco VARCHAR2(150) NOT NULL,
    telefone VARCHAR2(15) NOT NULL,
    email VARCHAR2(120) NOT NULL,
    renda NUMBER(10,2) NOT NULL
);

CREATE TABLE FRETE_T
(
    cod_frete NUMBER(5) PRIMARY KEY NOT NULL,
    data_f DATE NOT NULL,
    descricao VARCHAR2(100) NOT NULL,
    cod_cliente NUMBER(5) NOT NULL,
    cod_cidade NUMBER(5) NOT NULL,
    cod_funcionario NUMBER(5) NOT NULL,
    peso NUMBER(10,2) NOT NULL,
    valor_frete NUMBER(10,2) NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE_T (cod_cliente),
	FOREIGN KEY (cod_cidade) REFERENCES CIDADE_T (cod_cidade),
	FOREIGN KEY (cod_funcionario) REFERENCES FUNCIONARIO_T (cod_funcionario)
);

DROP TABLE FUNCIONARIO_T;
DROP TABLE CIDADE_T;
DROP TABLE CLIENTE_T;
DROP TABLE FRETE_T;

SELECT * FROM FUNCIONARIO_T;
SELECT * FROM CIDADE_T;
SELECT * FROM CLIENTE_T;
SELECT * FROM FRETE_T;

INSERT ALL
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (1, 'Carlos Eduardo Renan Figueiredo', 600.99, 'Informática')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (2, 'Cristiane Juliana Ester Oliveira', 700.70, 'Informática')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (3, 'Elisa Clara Joana Rezende', 800.75, 'Informática')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (4, 'Emilly Isabelle Moraes', 900.85, 'Contabilidade')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (5, 'Guilherme Vicente Moura', 1212.90, 'Contabilidade')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (6, 'Heloisa Rita Assis', 1500.90, 'Contabilidade')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (7, 'Washington Noah Sales', 1590.85, 'Informática')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (8, 'Kamilly Sarah Isabel Corte Real', 1840.70, 'Recursos Humanos')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (9, 'Marcela Luciana Corte Real', 2190.99, 'Recursos Humanos')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (10, 'Waldemar Erick Heitor Barros', 1750.14, 'Financeiro')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (11, 'Wesley Henrique Marcelo Brito', 1850.60, 'Financeiro')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (12, 'Renato Vinicius Baptista', 1654.15, 'Financeiro')
    INTO FUNCIONARIO_T (cod_funcionario, nome_funcionario, salario, departamento) VALUES (13, 'Sérgio Nathan Rodrigues', 2145.50, 'Administrativo')
SELECT * FROM dual;

INSERT ALL
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (1, 'Abreu e Lima', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (2, 'Arcoverde', 'PE', 1.44)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (3, 'Cabo de Santo Agostinho', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (4, 'Camaragibe', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (5, 'Caruaru', 'PE', 1.44)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (6, 'Igarassu', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (7, 'Olinda', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (8, 'Jaboatão dos Guararapes', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (9, 'Paulista', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (10, 'Recife', 'PE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (11, 'João Pessoa', 'PB', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (12, 'Maceió', 'AL', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (13, 'Aracaju', 'SE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (14, 'Fortaleza', 'CE', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (15, 'Salvador', 'BA', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (16, 'São Luís', 'MA', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (17, 'Teresina', 'PI', 1.36)
    INTO CIDADE_T (cod_cidade, nome_cidade, uf, taxa) VALUES (18, 'Natal', 'RN', 1.36)
SELECT * FROM dual;

INSERT ALL
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (1, 'Mateus e Raimundo Doces & Salgados ME', 'Rua Cantora Clara Nunes, 699 - Timbó', '(81) 2857-7695', 'posvenda@mateuseraimundodocessalgadosme.com.br', 10480.70)
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (2, 'Ian e Jaqueline Limpeza Ltda', 'Travessa São Francisco, 234 - São Geraldo', '(87) 2548-0100', 'treinamento@ianejaquelinelimpezaltda.com.br', 5165.41)
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (3, 'Helena e Leonardo Pães e Doces ME', 'Rua Dezenove, 236 - Ponte dos Carvalhos', '(81) 3656-0022', 'faleconosco@helenaeleonardopaesedocesme.com.br', 6435.45)
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (4, 'Vinicius e Augusto Comercio de Bebidas Ltda', 'Av. Presidente Kennedy, 208 - Candeias", "Jaboatão dos Guararapes', '(81) 2958-8112', 'faleconosco@viniciuseaugustocomerciodebebidasltda.com.br', 19014.65)
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (5, 'Giovana e Milena Marketing Ltda', 'Travessa Manoel de Cristo Lobo, 379 - Maria Farinha", "Paulista", "PE', '(81) 3542-0457', 'compras@giovanaemilenamarketingltda.com.br', 14514.75)
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (6, 'Fábio e Aurora Telecomunicações Ltda', 'Rua Prof. Aurélio de Castro Cavalcanti, 462 - Boa Viagem', '(81) 2610-4295', 'sistema@fabioeauroratelecomunicacoesltda.com.br', 7514.99)
    INTO CLIENTE_T (cod_cliente, nome_cliente, endereco, telefone, email, renda) VALUES (7, 'Cauê e Rodrigo Financeira ME', 'Travessa Arnoldo Magalhães", 690 - Casa Amarela', '(81) 2644-9685', 'financeiro@caueerodrigofinanceirame.com.br', 9412.10)
SELECT * FROM dual;

INSERT ALL
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (1, '26/05/2022', 'PAC', 1, 1, 1, 20, 292.40)
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (2, '15/05/2022', 'PAC Grandes Formatos', 2, 2, 2, 20, 309.60)
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (3, '01/05/2022', 'PAC Pagamento na Entrega', 3, 3, 3, 40, 584.80)
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (4, '20/04/2022', 'Remessa Econômica', 4, 8, 4, 50, 731.00)
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (5, '10/04/2022', 'Sedex', 5, 9, 5, 60, 877.20)
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (6, '10/04/2022', 'Sedex 10', 6, 10, 6, 70, 1023.40)
    INTO FRETE_T (cod_frete, data_f, descricao, cod_cliente, cod_cidade, cod_funcionario, peso, valor_frete) VALUES (7, '10/04/2022', 'Sedex Hoje', 7, 10, 7, 90, 1315.80)
SELECT * FROM dual;

-- Em seguida, efetuar as consultas pedidas:

-- a) Listar todas as cidades.
SELECT nome_cidade AS "Todas as Cidades" FROM CIDADE_T;

-- b) Listar todas as unidades de federação distintas.
SELECT uf AS "Unidades de Federação Distintas" FROM CIDADE_T
    GROUP BY uf;

-- c) Listar nome, salário, e o salário anual dos funcionários.
SELECT nome_funcionario AS "Nome do Funcionário", CONCAT('R$ ' , TO_CHAR(salario, 'FM999G999G999D90')) AS "Salário", CONCAT('R$ ' , TO_CHAR(salario * 12, 'FM999G999G999D90')) AS "Salário Anual dos Funcionários"
    FROM FUNCIONARIO_T;

-- d) Listar funcionários em ordem decrescente de salário, e crescente de nome.
SELECT nome_funcionario AS "Nome do Funcionário", CONCAT('R$ ' , TO_CHAR(salario, 'FM999G999G999D90')) AS "Salário" FROM FUNCIONARIO_T
    ORDER BY salario DESC, nome_funcionario ASC;

-- e) Listar funcionários de informática ou de contabilidade que ganham acima de R$ 1000,00.
SELECT nome_funcionario AS "Nome do Funcionário", departamento AS "Departamento", CONCAT('R$ ' , TO_CHAR(salario, 'FM999G999G999D90')) AS "Salário" FROM FUNCIONARIO_T
    WHERE departamento = 'Informática' AND salario > 1000 OR departamento = 'Contabilidade' AND salario > 1000;

-- f) Listar funcionários e departamento, dos funcionários que ganham entre 800 e 1600 reais, em ordem crescente de salário
SELECT nome_funcionario AS "Nome do Funcionário", departamento AS "Departamento", CONCAT('R$ ' , TO_CHAR(salario, 'FM999G999G999D90')) AS "Salário" FROM FUNCIONARIO_T
    WHERE salario BETWEEN 800 and 1600
        ORDER BY salario ASC;

-- g) Listar todos os funcionários com código 2 ou 3 ou 4 ou 5 ou 6. (Usar operador IN)
SELECT cod_funcionario AS "Código do Funcionário", nome_funcionario AS "Nome do Funcionário" FROM FUNCIONARIO_T
    WHERE cod_funcionario IN (2,3,4,5,6);

-- h) Listar os funcionários que iniciam com a letra W em ordem alfabética
SELECT nome_funcionario AS "Nome do Funcionário" FROM FUNCIONARIO_T
    WHERE nome_funcionariO LIKE 'W%'
        ORDER BY nome_funcionariO ASC;

-- i) Listar o nome de todos os funcionários que possuam qualquer caractere na primeira posição do nome, mas obrigatoriamente o caractere a como o segundo, e qualquer sequência depois.
SELECT nome_funcionario AS "Nome do Funcionário" FROM FUNCIONARIO_T
    WHERE nome_funcionario LIKE '_a%';

-- j) Listar os fretes (códigos) feitos pelos clientes, bem como os clientes (nomes) que o fizeram, e as datas respectivas.
SELECT f.cod_frete AS "Código do Frete", c.nome_cliente AS "Nome do Cliente", f.data_f AS "Data do Frete" FROM FRETE_T f
    INNER JOIN CLIENTE_T c ON (f.cod_cliente = c.cod_cliente);

-- k) Listar os fretes (códigos e descrições) com peso superior a 50 kg, bem como os clientes (nomes) que os fizeram.
SELECT f.cod_frete AS "Código do Frete", f.descricao AS "Descrição", f.peso AS "Peso", c.nome_cliente AS "Nome do Cliente" FROM FRETE_T f
    INNER JOIN CLIENTE_T c ON (f.cod_cliente = c.cod_cliente)
        WHERE f.peso > 50;

-- l) Listar a média, em seguida o maior, o menor e a soma dos salários dos funcionários.
SELECT CONCAT('R$ ' , TO_CHAR(AVG(salario), 'FM999G999G999D90')) AS "Média Salarial", CONCAT('R$ ' , TO_CHAR(MAX(salario), 'FM999G999G999D90')) AS "Maior Salário",
       CONCAT('R$ ' , TO_CHAR(MIN(salario), 'FM999G999G999D90')) AS "Menor Salário", CONCAT('R$ ' , TO_CHAR(SUM(salario), 'FM999G999G999D90')) AS "Soma dos Salários"
            FROM FUNCIONARIO_T;

-- m) Listar o total de funcionários lotados no departamento de informática.
SELECT COUNT(*) AS "Total Funcionários no Departamento de Informática" FROM FUNCIONARIO_T
    WHERE departamento = 'Informática';

-- n) Listar o total de empregados por departamento.
SELECT departamento AS "Departamento", COUNT(departamento) AS "Total de Empregados" FROM FUNCIONARIO_T
    GROUP BY departamento;

-- o) Listar a média salarial agrupada por departamento.
SELECT departamento AS "Departamento", CONCAT('R$ ' , TO_CHAR(AVG(salario), 'FM999G999G999D90')) AS "Média Salarial" FROM FUNCIONARIO_T
    GROUP BY departamento;

-- p) Listar a média salarial agrupada por departamento, dos departamentos cuja média salarial seja superior a 1000 reais.
SELECT departamento AS "Departamento", CONCAT('R$ ' , TO_CHAR(AVG(salario), 'FM999G999G999D90')) AS "Média Salarial superior a R$ 1.000,00" FROM FUNCIONARIO_T
    GROUP BY departamento HAVING AVG(salario) > 1000;

-- q) Listar nome e salário de todos os funcionários que trabalham no mesmo departamento que Waldemar trabalha.
SELECT nome_funcionario AS "Nome do Funcionário", departamento AS "Departamento", CONCAT('R$ ' , TO_CHAR(salario, 'FM999G999G999D90')) AS "Salário" FROM FUNCIONARIO_T
    WHERE departamento = (SELECT departamento FROM FUNCIONARIO_T WHERE nome_funcionario LIKE 'Waldemar%')

-- r) Listar nome e salário de todos os funcionários com maior salário.
SELECT nome_funcionario AS "Nome do Funcionário com Maior Salário", CONCAT('R$ ' , TO_CHAR(salario, 'FM999G999G999D90')) AS "Salário" FROM FUNCIONARIO_T
    WHERE salario = (SELECT MAX(salario) FROM FUNCIONARIO_T);

-- s) Listar apenas os departamentos cuja média salarial é maior que a média salarial do departamento financeiro.
SELECT departamento AS "Departamento com Média Salarial Maior que a Média do Departamento Financeiro" FROM FUNCIONARIO_T
    GROUP BY departamento HAVING AVG(salario) > (SELECT AVG(salario)
        FROM FUNCIONARIO_T WHERE departamento = 'Financeiro');