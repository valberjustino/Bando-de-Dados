-- 1. Criando o Banco de Dados
CREATE DATABASE EscolaDB;
USE EscolaDB;

-- 2. Criando as Tabelas
CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    cidade VARCHAR(50)
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(50),
    carga_horaria INT
);

CREATE TABLE Matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- 3. Inserindo Dados
INSERT INTO Alunos (nome, idade, cidade) VALUES
('Maria Silva', 20, 'São Paulo'),
('João Santos', 22, 'Rio de Janeiro'),
('Ana Souza', 19, 'Belo Horizonte'),
('Carlos Pereira', 25, 'Curitiba');

INSERT INTO Cursos (nome_curso, carga_horaria) VALUES
('Banco de Dados', 40),
('Lógica de Programação', 60),
('Desenvolvimento Web', 80);

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2024-02-15'),
(2, 2, '2024-03-10'),
(3, 1, '2024-04-05'),
(4, 3, '2024-05-20');

-- Buscar todos os alunos
SELECT * FROM Alunos;

-- Buscar apenas nomes e cidades
SELECT nome, cidade FROM Alunos;

-- Alunos com mais de 20 anos
SELECT nome, idade FROM Alunos WHERE idade > 20;

-- Alunos de uma cidade específica
SELECT nome, cidade FROM Alunos WHERE cidade = 'São Paulo';

-- Cursos com carga horária menor que 70
SELECT nome_curso, carga_horaria FROM Cursos WHERE carga_horaria < 70;

-- 5. Consulta relacionando tabelas (JOIN implícito com WHERE)
SELECT Alunos.nome AS Nome_Aluno, Cursos.nome_curso AS Curso
FROM Alunos, Cursos, Matriculas
WHERE Alunos.id = Matriculas.aluno_id
AND Cursos.id = Matriculas.curso_id;

-- Alunos maiores de 20 anos E de São Paulo
SELECT nome, idade, cidade FROM Alunos
WHERE idade > 20 AND cidade = 'São Paulo';

-- Cursos de 40 OU 80 horas
SELECT nome_curso FROM Cursos
WHERE carga_horaria = 40 OR carga_horaria = 80;

-- 1. Liste todos os alunos com suas respectivas cidades.
SELECT nome, cidade FROM Alunos;

-- 2. Mostre apenas os nomes dos cursos com carga horária maior que 50 horas.
SELECT nome_curso FROM Cursos WHERE carga_horaria > 50;

-- 3. Exiba os alunos que moram em Curitiba.
SELECT * FROM Alunos WHERE cidade = 'Curitiba';

-- 4. Mostre o nome e idade dos alunos com idade menor que 22 anos.
SELECT nome, idade FROM Alunos WHERE idade < 22;

-- 5. Liste o nome do aluno e o nome do curso em que ele está matriculado.
SELECT Alunos.nome, Cursos.nome_curso 
FROM Alunos, Cursos, Matriculas 
WHERE Alunos.id = Matriculas.aluno_id AND Cursos.id = Matriculas.curso_id;

-- 6. Exiba os alunos matriculados no curso "Banco de Dados".
SELECT Alunos.nome 
FROM Alunos, Cursos, Matriculas 
WHERE Alunos.id = Matriculas.aluno_id 
AND Cursos.id = Matriculas.curso_id 
AND Cursos.nome_curso = 'Banco de Dados';

-- 7. Mostre os cursos com carga horária diferente de 60 horas.
SELECT * FROM Cursos WHERE carga_horaria <> 60;

-- 8. Liste o nome e cidade dos alunos de São Paulo ou Rio de Janeiro.
SELECT nome, cidade FROM Alunos WHERE cidade = 'São Paulo' OR cidade = 'Rio de Janeiro';
