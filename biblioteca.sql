
-- 1. Criando o Banco de Dados Biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- 2. Criando Tabela Livros
CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao INT
);

-- 3. Inserindo Livros
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES
('Dom Casmurro', 'Machado de Assis', 1899),
('O Alienista', 'Machado de Assis', 1882),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881),
('Capitães da Areia', 'Jorge Amado', 1937);

-- 4. Consultas na Biblioteca
-- Ver todos
SELECT * FROM livros;

-- Ver apenas título e autor
SELECT titulo, autor FROM livros;

-- Filtrar livros de Machado de Assis
SELECT * FROM livros WHERE autor = 'Machado de Assis';

-- 5. Atualizando Dados
-- (Comentado para você executar se quiser, conforme o exemplo do PDF)
-- UPDATE livros SET ano_publicacao = 1938 WHERE titulo = 'Capitães da Areia';

-- 6. Excluindo Dados
-- (Comentados para não apagar seus dados agora, mas estão prontos)
-- DELETE FROM livros WHERE id = 2; -- Apaga o id 2
-- DELETE FROM livros; -- Apaga tudo

-- 7. Criando Tabela Usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    idade INT
);

-- 8. Inserindo Usuários
INSERT INTO usuarios (nome, email, idade) VALUES
('Maria Silva', 'maria@gmail.com', 30),
('João Pereira', 'joao@gmail.com', 25),
('Ana Costa', 'ana@gmail.com', 22);

SELECT * FROM usuarios;


-- ==========================================================
-- PARTE 3: EXERCÍCIOS DE FIXAÇÃO (PDF 2 - PÁGINA 6)
-- Nota: O PDF pede para criar um banco 'escola' com estrutura diferente da Parte 1.
-- Vou chamar de 'EscolaFixacao' para não conflitar com a 'EscolaDB' da Parte 1.
-- ==========================================================

-- 1. Crie um banco de dados chamado escola (Aqui: EscolaFixacao)
CREATE DATABASE IF NOT EXISTS EscolaFixacao;
USE EscolaFixacao;

-- 2. Crie uma tabela alunos com campos específicos
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
    serie VARCHAR(50)
);

-- 3. Insira 5 alunos com diferentes idades e séries
INSERT INTO alunos (nome, idade, serie) VALUES
('Pedro Alves', 14, '8º Ano'),
('Julia Martins', 13, '7º Ano'),
('Lucas Rocha', 15, '9º Ano'),
('Mariana Lima', 14, '8º Ano'),
('Fernanda Dias', 16, '1º Ano Médio');

-- 4. Exiba todos os alunos cadastrados
SELECT * FROM alunos;

-- 5. Exiba apenas os nomes e idades
SELECT nome, idade FROM alunos;

-- 6. Exiba os alunos da série "8º Ano"
SELECT * FROM alunos WHERE serie = '8º Ano';

-- 7. Atualize a idade de um aluno
UPDATE alunos SET idade = 15 WHERE nome = 'Pedro Alves';

-- 8. Exclua um aluno da tabela
DELETE FROM alunos WHERE nome = 'Julia Martins';

-- DESAFIO EXTRA: Tabela Professores
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    materia VARCHAR(50)
);

INSERT INTO professores (nome, materia) VALUES
('Roberto', 'Matemática'),
('Cláudia', 'Português');

SELECT * FROM professores;