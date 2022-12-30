-- ADSPL.15 - Banco de Dados II
-- Docente: Eudes da Silva Barboza
-- Discente: Thiago da Mota Vilela
-- E-mail: tmv@discente.ifpe.edu.br - Data: 17 de maio de 2022

-- Avaliação - 1ª Unidade

-- Numa biblioteca existe uma base de dados relacional que foi criada usando o seguinte esquema:

-- Tabela referente as questões abaixo: 3, 4, 5 e 6

CREATE TABLE Livro
(
    Cod     NUMBER(5) PRIMARY KEY,
    Titulo  VARCHAR2(100),
    Editora VARCHAR2(100),
    Ano     NUMBER(4),
    Lingua  VARCHAR2(50)
);

CREATE TABLE Autor
(
    Numero NUMBER(5) PRIMARY KEY,
    Nome   VARCHAR2(150),
    Nacionalidade VARCHAR2(100),
    Idade NUMBER(3)
);

CREATE TABLE Leitor
(
    Bi NUMBER(5) NOT NULL PRIMARY KEY,
    Nome VARCHAR2(150) NOT NULL,
    Profissao VARCHAR2(100) NOT NULL,
    estadoCivil VARCHAR2(30) CHECK (estadoCivil IN ('Single', 'Married', 'Widower', 'Divorced'))
);

CREATE TABLE Autoria
(
    codLivro NUMBER(5),
    numeroAutor NUMBER(5),
    PRIMARY KEY (codLivro, numeroAutor),
    FOREIGN KEY (codLivro) REFERENCES Livro (Cod),
	FOREIGN KEY (numeroAutor) REFERENCES Autor (Numero)
);

CREATE TABLE Requisicao
(
    codLivro NUMBER(5),
    biLeitor NUMBER(5),
    dataRequisicao DATE,
    PRIMARY KEY (codLivro, biLeitor ),
    FOREIGN KEY (codLivro) REFERENCES Livro (Cod),
	FOREIGN KEY (biLeitor) REFERENCES Leitor (Bi)
);

DROP TABLE Livro;
DROP TABLE Autor;
DROP TABLE Leitor;
DROP TABLE Autoria;
DROP TABLE Requisicao;

SELECT * FROM Livro;
SELECT * FROM Autor;
SELECT * FROM Leitor;
SELECT * FROM Autoria;
SELECT * FROM Requisicao;

INSERT ALL
    INTO Autor (numero, nome, nacionalidade, idade) VALUES (1, 'Abraham Bennet', 'Estadunidense', 80)
    INTO Autor (numero, nome, nacionalidade, idade) VALUES (2, 'Marjorie Green', 'Canadense', 65)
    INTO Autor (numero, nome, nacionalidade, idade) VALUES (3, 'Albert Ringer', 'Estadunidense', 50)
    INTO Autor (numero, nome, nacionalidade, idade) VALUES (4, 'Anne Ringer', 'Canadense', 40)
    INTO Autor (numero, nome, nacionalidade, idade) VALUES (5, 'Sylvia Panteley', 'Estadunidense', 30)
SELECT * FROM dual;

-- 3º) - Crie uma visão intitulada autores_mais_velhos que permita visualizar o nome e a nacionalidade dos autores,
-- com idade igual ou superior há 65 anos.

CREATE VIEW autores_mais_velhos AS
    SELECT Nome, Nacionalidade FROM Autor
        WHERE Idade >= 65;

SELECT * FROM autores_mais_velhos;

DROP VIEW autores_mais_velhos;

-- 4º) Descreva como deveria ser a criação da tabela Leitor, em relação a integridade, evitando inserção de dados inválidos.

CREATE TABLE Leitor
(
    Bi NUMBER(5) NOT NULL PRIMARY KEY,
    Nome VARCHAR2(150) NOT NULL,
    Profissao VARCHAR2(100) NOT NULL,
    estadoCivil VARCHAR2(30) CHECK (estadoCivil IN ('Single', 'Married', 'Widower', 'Divorced'))
);

-- 5º) Crie uma estrutura de índice bitmap, para a tabela livro.

SELECT * FROM Livro;

INSERT ALL
    INTO Livro (Cod, Titulo, Editora, Ano, Lingua) VALUES (1, 'Secrets of Silicon Valley', 'Albert Whitman & Company', 2005, 'EN-US')
    INTO Livro (Cod, Titulo, Editora, Ano, Lingua) VALUES (2, 'The Busy Executive', 'Bancroft Press', 2010, 'PT-BR')
    INTO Livro (Cod, Titulo, Editora, Ano, Lingua) VALUES (3, 'Emotional Security: A New Algorithm', 'Regal House Publishing', 2021, 'EN-US')
    INTO Livro (Cod, Titulo, Editora, Ano, Lingua) VALUES (4, 'Prolonged Data Deprivation: Four Case Studies', 'Koehler Books', 2015, 'EN-US')
    INTO Livro (Cod, Titulo, Editora, Ano, Lingua) VALUES (5, 'Silicon Valley Gastronomic Treats', 'AK Press', 2009, 'PT-BR')
SELECT * FROM dual;

CREATE BITMAP INDEX livroIndex ON Livro(Titulo);

DROP INDEX livroIndex;

-- 6º) Selecionar o BI dos leitores que requisitaram pelo menos 2 livros e o número total de livros requisitados por cada um dos leitores selecionados.

INSERT ALL
    INTO Leitor (Bi, Nome, Profissao, estadoCivil) VALUES (1, 'Livia Karsen', 'Accountant ', 'Single')
    INTO Leitor (Bi, Nome, Profissao, estadoCivil) VALUES (2, 'Stearns MacFeather', 'Administrator', 'Married')
    INTO Leitor (Bi, Nome, Profissao, estadoCivil) VALUES (3, 'Akiko Yokomoto', 'Dentist', 'Married')
    INTO Leitor (Bi, Nome, Profissao, estadoCivil) VALUES (4, 'Johnson White', 'Designer', 'Widower')
    INTO Leitor (Bi, Nome, Profissao, estadoCivil) VALUES (5, 'Sheryl Hunter', 'Engineer', 'Divorced')
SELECT * FROM dual;

SELECT * FROM Leitor;

INSERT ALL
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (1, 1, '17/05/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (2, 1, '17/05/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (3, 1, '17/05/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (4, 2, '01/03/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (5, 2, '01/03/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (5, 3, '01/02/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (5, 4, '15/01/2022')
    INTO Requisicao (codLivro, biLeitor, dataRequisicao) VALUES (5, 5, '02/01/2022')
SELECT * FROM dual;

SELECT * FROM Requisicao;

SELECT biLeitor AS "Bi do Leitor", COUNT(biLeitor) AS "Número Total de Livros Requisitados" FROM Requisicao
    GROUP BY biLeitor HAVING COUNT(biLeitor) >= 2;