-- ADSPL.15 - Banco de Dados II
-- Docente: Eudes da Silva Barboza
-- Discente: Thiago da Mota Vilela
-- E-mail: tmv@discente.ifpe.edu.br - Data: 29 de abril de 2022

-- Atividade 01 - Exercício (Revisão SGBD)

-- 1º) Com base no código abaixo, julgue as afirmativas a seguir:

CREATE TABLE funcionario (
    id NUMBER(3) PRIMARY KEY,
    nome VARCHAR2(60),
    salario NUMBER(7,2),
    sexo CHAR(1),
    cidade VARCHAR2(80),
    idade NUMBER(3)
    );

-- a) {V} O usuário não poderia criar na mesma base de dados outra tabela com o mesmo nome, pois daria erro.
CREATE TABLE funcionario (
    cod NUMBER(3) PRIMARY KEY,
    nome VARCHAR2(60)
    );

-- b) {V} Um funcionário com id 1000 não poderá ser inserido nesta tabela já que violaria o tamanho máximo permitido por este campo.
INSERT INTO funcionario (id)
    VALUES (1000);

-- c) {F} Um funcionário com nome ‘Pietro Paolo Jorge Corrêa Greco Pailleule de Oliveira e Silva’ poderia ser inserido nesta base, sem qualquer problema com o tamanho máximo de caracteres para o campo nome.
INSERT INTO funcionario (nome)
VALUES ('Pietro Paolo Jorge Corrêa Greco Pailleule de Oliveira e Silva');

-- d) {F} Dois funcionários com o mesmo id poderão ser inseridos na tabela funcionário uma vez que não foi declarada chave primária.
INSERT ALL
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (1, 'Paulo Yuri Geraldo Moraes', 300, 'm', 'Recife', 30)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (1, 'Alícia Nina Márcia Moura', 350, 'f', 'Olinda', 25)
SELECT * FROM dual;

-- e) {F} O comando DELETE FROM FUNCIONARIO WHERE sexo = ‘f’ AND salario <> 500 removeria todas as funcionárias do sexo feminino que tivessem salário menor ou igual a 500.
INSERT ALL
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (1, 'Carlos Eduardo Renan Figueiredo', 600, 'm', 'Recife', 30)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (2, 'Luís Carlos Freitas', 525, 'm', 'Jaboatão dos Guararapes', 25)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (3, 'Henrique Luis de Santana', 445, 'm', 'Abreu e Lima', 31)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (4, 'Fernando Giovanni Nelson Moura', 500, 'm', 'Itamaracá', 31)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (5, 'Natália Analu Valentina', 400, 'm', 'Camaragibe', 31)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (6, 'Emilly Isabelle Moraes', 500, 'f', 'Rodelas', 35)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (7, 'Elisa Clara Joana Rezende', 445, 'f', 'Olinda', 28)
  INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (8, 'Heloisa Rita Assis', 600, 'f', 'Igarassu', 40)
SELECT * FROM dual;

DELETE FROM funcionario WHERE sexo = 'f' AND salario <> 500;

SELECT * FROM funcionario;
DROP TABLE funcionario;

-- f) {F} O comando UPDATE funcionario SET salario = 2500 WHERE cidade = ‘Rodelas’ atualiza para 2500 o salário de todos os funcionários.
UPDATE funcionario SET salario = 2500 WHERE cidade = 'Rodelas';

-- g) {V} O comando INSERT INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (8,’Capitão Nascimento’,’100500.5’,’masculino’,’Rio de Janeiro’,45) não poderá ser executado satisfatoriamente.
INSERT INTO funcionario (id, nome, salario, sexo, cidade, idade) VALUES (8,'Capitão Nascimento','100500.5','masculino','Rio de Janeiro',45);

-- h) {V} O comando UPDATE funcionario SET nome = ‘Capitão Roberto Nascimento’ WHERE id = 8 certamente apresentaria erro caso o valor contido no campo nome não estivesse entre aspas.
UPDATE funcionario SET nome = Capitão Roberto Nascimento WHERE id = 8;

-- i) {F} SQL é case-sensitive para seus comandos, e não case-sensitive para valores inseridos.
SELECT * FROM funcionario WHERE nome LIKE '%Luís%' OR nome LIKE '%Luis%';
SELECT * FROM funcionario WHERE nome LIKE '%L%';
SELECT * FROM funcionario WHERE nome LIKE '%l%';

-- j) {F} O comando ALTER TABLE aluno DROP (sexo) faz com a tabela aluno seja deletada da base de dados.

-- 2º) Assinale a alternativa que possui exemplos apenas de comandos DDL:
-- {X} CREATE, ALTER, DROP
-- { } CREATE, ALTER, INSERT
-- { } INSERT, UPDATE, DELETE
-- { } INSERT, UPDATE, CREATE
-- { } N.D.A

-- 3º) Assinale a alternativa que possui exemplos apenas de comandos DML:
-- { } CREATE, ALTER, DROP
-- { } CREATE, ALTER, INSERT
-- {X} INSERT, UPDATE, DELETE
-- { } INSERT, UPDATE, CREATE
-- { } N.D.A

-- 4º) Com base nos dados presentes na tabela SELECAO abaixo, solicita-se fazer o código SQL referente a cada consulta pedida nos itens abaixo:

CREATE TABLE selecao (
    codigo NUMBER(3) PRIMARY KEY,
    nome VARCHAR2(60),
    alcunha VARCHAR2(80),
    endereco_f VARCHAR2(80),
    endereco_e VARCHAR2(60),
    ano_f NUMBER(4),
    tempo_f NUMBER(3),
    continente VARCHAR2(60)
    );

INSERT ALL
  INTO selecao (codigo, nome, alcunha, endereco_f, endereco_e, ano_f, tempo_f, continente) VALUES (1, 'Brasil', 'Canarinho', 'Rua Fabuloso 09', 'www.cbfnews.com', 1914, 96, 'america')
  INTO selecao (codigo, nome, alcunha, endereco_f, endereco_e, ano_f, tempo_f, continente) VALUES (2, 'Argentina', 'Alvi celeste', 'Rua Messi 10', 'www.afa.org.ar', 1901, 109, 'america')
  INTO selecao (codigo, nome, alcunha, endereco_f, endereco_e, ano_f, tempo_f, continente) VALUES (3, 'Alemanha', 'Dio Nationalelf', 'Rua Clisman 10', 'www.dfb.de', 1900, 110, 'europa')
SELECT * FROM dual;

SELECT * FROM selecao;

-- a) Listar nome das seleções que não sejam da europa, ordenado o resultado por nome e de forma decrescente.
SELECT nome AS "Seleções que não são da europa, ordenadas por nome e de forma decrescente" FROM selecao WHERE continente != 'europa'
    ORDER BY nome DESC;

-- b) Listar nome das seleções do continente americano e que tenham o ano de fundação entre 1900 e 1910 anos.
SELECT nome AS "Seleções do continente americano que possuem ano de fundação entre 1900 e 1910" FROM selecao WHERE continente = 'america' and ano_f BETWEEN 1900 AND 1910;

-- c) Listar nome das seleções, cujos endereços eletrônicos sejam terminados com ‘.com’.
SELECT nome AS "Nome das seleções, cujos endereços eletrônicos sejam terminados com '.com'" FROM selecao WHERE endereco_e LIKE '%.com';

-- d) Listar os continentes distintos.
SELECT continente AS "Continentes Distintos" FROM selecao
    GROUP BY continente;

-- e) Listar o total de continentes distintos.
SELECT SUM((COUNT(DISTINCT continente))) AS "Total de Continentes Distintos" FROM selecao
    GROUP BY continente;

-- f) Listar a média de tempo de fundação das seleções agrupadas por continente.
SELECT continente AS "Continente", CONCAT(AVG(tempo_f), ' anos') AS "Média de tempo de fundação" FROM selecao
    GROUP BY continente;

-- g) Listar o maior tempo de fundação das seleções, cujo ano de fundação seja superior a 1900.
SELECT MAX(tempo_f) AS "Maior tempo de fundação das seleções, cujo ano de fundação seja superior a 1900" FROM selecao
    WHERE ano_f > 1900;