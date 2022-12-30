# ADSPL.8 - Banco de Dados I
# Docente: Danilo Farias Soares da Silva
# Discente: Thiago da Mota Vilela
# E-mail: tmv@discente.ifpe.edu.br - Data: 21 de dezembro de 2021

# Lista de Exercício - BD
# Elaborar os Scripts em SQL para:

# 1) Crie um banco de dados chamado CursoX

CREATE DATABASE CursoX;

USE CursoX;

# 2) Nesse banco, crie as tabelas a seguir, de acordo com as informações do Dicionário de Dados (visto na Aula 3).
/*
TABELA alunos
ATRIBUTO    			  TIPO   				DESCRIÇÃO
aluno_cod    		Número inteiro    	    Código do aluno
aluno_nome    		Alfanumérico    	    Nome do aluno
aluno_endereco   	Alfanumérico 		    Endereço do aluno
aluno_cidade   	    Alfanumérico            Cidade do aluno

TABELA disciplina
ATRIBUTO    			  TIPO   				DESCRIÇÃO
dis_cod   			Número inteiro   		Código da disciplina
dis_nome    		Alfanumérico    		Nome da disciplina
dis_carga    		Número inteiro   		Carga horária da disciplina
dis_professor    	Alfanumérico    		Professor da disciplina

TABELA professores
ATRIBUTO    			  TIPO   				DESCRIÇÃO
prof_cod    		Número inteiro    	    Código do professor
prof_nome    		Alfanumérico    		Nome do professor
prof_endereco    	Alfanumérico    		Endereço do professor
prof_cidade     	Alfanumérico    		Cidade do professor
*/

CREATE TABLE alunos(
	aluno_cod INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 				-- Código do aluno
	aluno_nome VARCHAR(50) NOT NULL,								-- Nome do aluno
	aluno_endereco VARCHAR(100) NOT NULL,							-- Endereço do aluno
	aluno_cidade VARCHAR(50) NOT NULL								-- Cidade do aluno
);

CREATE TABLE professores(
	prof_cod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,				-- Código do professor
	prof_nome VARCHAR(50) NOT NULL,									-- Nome do professor
	prof_endereco VARCHAR(100) NOT NULL,							-- Endereço do professor
	prof_cidade VARCHAR(50) NOT NULL								-- Cidade do professor
);

CREATE TABLE disciplina(
	dis_cod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,				-- Código da disciplina
	dis_nome VARCHAR(50) NOT NULL,									-- Nome da disciplina
	dis_carga INT NOT NULL,											-- Carga horária da disciplina
	dis_professor INT,												-- Professor da disciplina	# removido NOT Null para atender 6ª questão.
	FOREIGN KEY(dis_professor) REFERENCES professores(prof_cod)		-- Foreign Key Professor da disciplina
);

DESC alunos;
DESC professores;
DESC disciplina;

# 3) Escreva os comandos SQL necessários para inserir nessas tabelas as seguintes informações:

-- dados de 10 alunos;
-- dados de 5 professores distintos;
-- dados de 5 disciplinas distintas.

INSERT INTO alunos (aluno_nome, aluno_endereco, aluno_cidade)
	VALUES ("Alexandre Hochmann Behar", "Av. Prof. Moraes Rego, 1235", "Recife"),
			 ("Alba de Oliveira Barbosa Lopes", "Av. Gov. Agamenon Magalhães, S/Nº", "Recife"),
			 ("Caio César Medeiros Davi", "Rua Bispo Cardoso Ayres, S/Nº", "Recife"),
			 ("Carlos Alberto Domingues do Nascimento", "Rua do Príncipe, 526", "Recife"),
			 ("Felipe Costa Farias", "Rod. PE-15, S/Nº", "Olinda"),
			 ("Fernando Augusto Semente Lima", "Rua Guilherme Pinto, 114", "Recife"),
			 ("George Alberto Gaudêncio de Melo", "Rua Padre Agobar Valença, S/Nº", "Garanhuns"),
			 ("Ivanildo José de Melo Filho", "Rua Jonathas de Vasconcelos, 316", "Recife"),
			 ("Jessica Sabrina de Oliveira Menezes", "Rua Joaquim Nabuco, 615", "Recife"),
			 ("Luciana de Lavor Nunes", "Rua Dom Manuel de Medeiros, S/Nº", "Recife"),
			 ("Marconi Carvalho de Queiroz", "Rua Fernando Lopes, 752", "Recife"),
			 ("Paava de Barros de Alencar Carvalho", "Rua Fernando Lopes, 752", "Recife"),
			 ("Rosângela Maria de Melo", "Av. Eng. Abdias de Carvalho, 1678", "Recife"),
			 ("Tiago França Barreto", "Av. Conde da Boa Vista, 921", "Recife"),
			 ("Wilbert Santana dos Santos", "Rua Comendador José Didier, 27", "Jaboatão dos Guararapes");
			 
INSERT INTO professores (prof_nome, prof_endereco, prof_cidade)
	VALUES ("Anderson Apolônio Lira Queiroz", "Rua Jaguaribe, S/Nº", "Abreu Lima"),											# 1
			 ("Antônio Correia de Sá Barreto Neto", "Rua Edson Barbosa de Araújo, S/Nº", "Afogados da Ingazeira"),	        # 2
			 ("Bruno Falcão de Souza Cartaxo", "Av. Prefeito Geraldo Pinho Alves, S/Nº", "Paulista"),						# 3
			 ("Camila Silva de Lima", "Fazenda Sapé, S/Nº", "Barreiros"),													# 4
			 ("Danilo Farias Soares da Silva", "Av. Prof. Luís Freire, 500", "Recife"),										# 5
			 ("Elizabeth de Oliveira Camelo", "Av. Sebastião Rodrigues da Costa, S/Nº", "Belo Jardim"),				    	# 6
			 ("Flávio Rosendo da Silva Oliveira", "Rua Sebastião Jovêntino, S/Nº", "Cabo de Santo Agostinho"),		    	# 7
			 ("Jéssica Priscila Rivas dos Santos", "Avenida Avenida Fagundes Varela, 375", "Olinda"),						# 8
			 ("José Alci Silva Lemos Júnior", "Estrada do Alto do Moura, KM 4", "Caruaru"),									# 9
			 ("Mércio Antônio Oliveira de Andrade", "Rodovia PE-007, S/Nº", "Jaboatão dos Guararapes"),				    	# 10
			 ("Patrícia de Souza Maciel", "Rodovia BR-101 Norte, KM 29", "Igarassu"),										# 11
			 ("Rodrigo Cesar Lira da Silva", "Rodovia BR-101 Norte, KM 186", "Palmares"),									# 12
			 ("Rosecleide Ramos Ferreira", "Rodovia BR-232 Norte, KM 214", "Pesqueira");									# 13

INSERT INTO disciplina (dis_nome, dis_carga, dis_professor)
	VALUES ("Empreendedorismo em Negócios de TIC", "70", '13'),				           	# 1º Período
			 ("Iniciação à Informática", "30", '10'),									# 1º Período
			 ("Introdução à Programação", "70", '12'),								    # 1º Período
			 ("Língua Inglesa Aplicada", "70", '6'),									# 1º Período
			 ("Matemática Aplicada", "70", '9'),										# 1º Período
			 ("Ética e Responsabilidade Socioambiental", "30", '4'),				    # 1º Período
 
			 ("Arquitetura de Computadores", "30", '10'),							    # 2º Período
			 ("Banco de Dados I", "70",'5'),											# 2º Período
			 ("Engenharia de Software", "70", '3'),									    # 2º Período
			 ("Linguagem de Programação Orientada a Objetos", "70", '2'),		        # 2º Período
			 ("Estatística Aplicada", "70", '8'),										# 2º Período
			 ("Redes de Computadores", "70", '1'),										# 2º Período
			 
			 ("Algoritmos e Estruturas de Dados", "70", '3'),						    # 3º Período
			 ("Análise e Projeto de Sistemas", "70", '2'),							    # 3º Período
			 ("Banco de Dados II", "70", '5'),											# 3º Período
			 ("Desenvolvimento de Sistemas Web I", "70", '12'),					        # 3º Período
			 ("Inteligência Artificial", "70", '5'),									# 3º Período
			 
			 ("Desenvolvimento de Sistemas Web II", "70", '12'),					    # 4º Período
			 ("Metodologia Científica Aplicada", "70", '7'),						    # 4º Período
			 ("Sistemas Distribuídos", "70", '1'),										# 4º Período
			 ("Sistemas Operacionais", "70", '10'),								    	# 4º Período
			 ("Aprendizagem de Máquina", "70", '5'),									# 4º Período
			 
			 ("Projeto de Desenvolvimento de Sistemas Web", "30", '3'),			        # 5º Período
			 ("Introdução ao Trabalho de Conclusão de Curso", "30", '2'),		        # 5º Período
			 ("Teste de Software", "70", '2'),											# 5º Período
			 ("Mineração de Dados", "70", '12'),										# 5º Período
			 ("Tópicos Especiais em Sistemas Embarcados", "70", '10'),			        # 5º Período
			 ("Tópico Especiais em Inteligência Artificial", "70", '2'),		        # 5º Período
			 
			 ("Gerenciamento de Projetos", "70", '3'),								    # 6º Período
			 ("Programação para Dispositivos Móveis", "70", '12'),				        # 6º Período
			 ("Metodologia da Pesquisa", "50", '7'),									# 6º Período
			 ("Segurança da Informação", "70", '1'),									# 6º Período
			 ("Tópicos Especiais em Engenharia de Software", "70", '3'),		        # 6º Período
			 ("Tópicos Especiais em Ciência dos Dados", "70", '12'), 			        # 6º Período

			 ("Tópicos Especiais em Sistemas Operacionais", "70", NULL),		        # Optativa
			 ("Tópicos Especiais em Eletrônica", "70", NULL),						    # Optativa
			 ("Tópicos Especiais em Banco de Dados", "70", NULL),				    	# Optativa
			 ("Tópicos Especiais em Redes de Computadores", "70", NULL),	        	# Optativa
			 ("Processos Ágeis de Desenvolvimento de Software", "70", NULL),	        # Optativa
			 ("Desenvolvimento de Jogos", "70", NULL),							    	# Optativa
			 ("Ergonomia de Software", "70", NULL);								    	# Optativa
		 
SELECT * from alunos;
SELECT * from professores;
SELECT * from disciplina;

DROP TABLE alunos;
DROP TABLE professores;
DROP TABLE disciplina;

# 4) Atualize a tabela disciplina, aumentando a carga horária de cada disciplina em 10 horas/ aulas.
UPDATE disciplina
	SET dis_carga = dis_carga + 10;
	
# 5) Apague da tabela disciplina todos as disciplinas ministradas por um determinado professor.
DELETE from disciplina
	WHERE dis_professor = '13'; # "Rosecleide Ramos Ferreira"

# 6) Elabora as consultas em SQL para:

-- Exibir código, nome e endereço de todos os professores do nosso colégio.
SELECT prof_cod 'Código', prof_nome 'Nome', prof_endereco 'Endereço' FROM professores;

-- Exibir os 3 primeiros alunos cadastrados.
SELECT aluno_cod 'Código do aluno', aluno_nome 'Nome do aluno' FROM alunos
	WHERE aluno_cod <= 3;

-- Exibir o nome de todas as disciplinas e seus respectivos professores.
SELECT DISTINCT d.dis_nome 'Nome da disciplina', p.prof_nome 'Professor da disciplina'
	FROM disciplina d, professores p
		WHERE d.dis_professor = p.prof_cod
			GROUP BY d.dis_nome
				ORDER BY p.prof_nome, d.dis_nome;
							
-- Mostrar os primeiros 50% de alunos cadastrados.
SELECT aluno_cod 'Código do aluno', aluno_nome 'Nome do aluno' FROM alunos
	WHERE aluno_cod <= (SELECT ROUND(COUNT(aluno_nome) * 0.5, 1) FROM alunos);
	
-- Mostrar o nome das disciplinas que não possuem professor cadastrado.
SELECT dis_cod 'Código da disciplina', dis_nome 'Nome da disciplina', prof_nome 'Nome do professor' FROM disciplina 
	LEFT JOIN professores 
		ON dis_professor = prof_cod
			WHERE dis_professor IS NULL;

-- Exibir as disciplinas com código entre 5 e 15.
SELECT dis_cod 'Código da disciplina', dis_nome 'Nome da disciplina' FROM disciplina
	WHERE dis_cod BETWEEN 5 AND 15;
	
-- Mostrar o nome dos alunos que possuem sobrenome Melo. 		# Substituído 'Silva' por 'Melo"
SELECT aluno_cod 'Código do aluno', aluno_nome 'nome do aluno' FROM alunos
	WHERE aluno_nome LIKE "%Melo%";

-- Exiba as diferentes cidades em que moram os alunos e as respectivas quantidades de alunos em cada uma.
SELECT aluno_cidade 'Cidade do aluno', COUNT(aluno_cidade) 'Quantidade de alunos' FROM alunos
	GROUP BY aluno_cidade
		ORDER BY aluno_cidade;

-- Refaça a consulta do item anterior para os professores, ordenando o resultado em ordem alfabética de acordo com o nome da cidade e renomeando as colunas de resultados.
SELECT prof_cidade 'Cidade do professor', COUNT(prof_cidade) 'Quantidade de professores' FROM professores
	GROUP BY prof_cidade
		ORDER BY prof_cidade;

-- Exiba o nome de todos os professores cujos nomes iniciem com as letras de “A” a “J” em ordem alfabética.
SELECT prof_nome 'Nome do professor'FROM professores
	WHERE prof_nome BETWEEN "A%" AND "K%"
		ORDER BY prof_nome;

-- Exiba o nome de todas as disciplinas ofertadas (sem repetição de nome) em MAIÚSCULO.
SELECT UPPER (dis_nome) 'Nome da disciplina em MAIÚSCULO' FROM disciplina
	GROUP BY dis_nome
		ORDER BY dis_nome;

-- Calcule a carga horária média por professor (dica: Você pode fazer mais de uma consulta para obter esse resultado).
SELECT DISTINCT p.prof_nome 'Professor da disciplina', ROUND (AVG(d.dis_carga), 0) 'Carga_Horária_Média'
	FROM disciplina d, professores p
		WHERE d.dis_professor = p.prof_cod
			GROUP BY d.dis_professor
				ORDER BY Carga_Horária_Média DESC;

-- Exiba a carga horária total de cada professor que possua mais de uma disciplina.
SELECT DISTINCT p.prof_nome 'Professor da disciplina', COUNT(d.dis_professor) 'Quantidade_de_disciplinas', ROUND(SUM(d.dis_carga), 0) 'Carga_Horária_Total'
	FROM disciplina d, professores p
		WHERE d.dis_professor = p.prof_cod
			GROUP BY d.dis_professor
				HAVING COUNT(d.dis_professor) > 1
					ORDER BY Carga_Horária_Total, Quantidade_de_disciplinas, p.prof_nome ASC;
		
-- Exiba a carga horária total para cada professor.
SELECT DISTINCT p.prof_nome 'Professor da disciplina', ROUND (SUM(d.dis_carga), 0) 'Carga_Horária_Total'
	FROM disciplina d, professores p
		WHERE d.dis_professor = p.prof_cod
			GROUP BY dis_professor
				ORDER BY Carga_Horária_Total DESC;
									
-- Exiba a quantidade total de disciplinas oferecidas.
SELECT COUNT(dis_cod) 'Quantidade total de disciplinas oferecidas' FROM disciplina

# Compartilhe o link do arquivo SQL com os scripts.