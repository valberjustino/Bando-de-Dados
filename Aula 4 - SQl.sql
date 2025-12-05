CREATE DATABASE EscolaDB;
USE EscolaDB;
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

INSERT INTO Alunos (nome, idade, cidade)
VALUES
('Maria Silva', 20, 'São Paulo'),
('João Santos', 22, 'Rio de Janeiro'),
('Ana Souza', 19, 'Belo Horizonte'),
('Carlos Pereira', 25, 'Curitiba');

INSERT INTO Cursos (nome_curso, carga_horaria)
VALUES
('Banco de Dados', 40),
('Lógica de Programação', 60),
('Desenvolvimento Web', 80);

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula)
VALUES
(1, 1, '2024-02-15'),
(2, 2, '2024-03-10'),
(3, 1, '2024-04-05'),
(4, 3, '2024-05-20');

SELECT * FROM Alunos;

SELECT nome, cidade FROM Alunos;

SELECT nome, idade
FROM Alunos
WHERE idade > 20;

SELECT nome, cidade
FROM Alunos
WHERE cidade = 'São Paulo';

SELECT nome_curso, carga_horaria
FROM Cursos
WHERE carga_horaria < 70;

SELECT Alunos.nome AS Nome_Aluno, Cursos.nome_curso AS Curso
FROM Alunos, Cursos, Matriculas
WHERE Alunos.id = Matriculas.aluno_id
AND Cursos.id = Matriculas.curso_id;

SELECT nome, idade, cidade
FROM Alunos
WHERE idade > 20 AND cidade = 'São Paulo';

SELECT nome_curso
FROM Cursos
WHERE carga_horaria = 40 OR carga_horaria = 80;

SELECT nome_curso
FROM Cursos
WHERE carga_horaria > 50 OR carga_horaria = 80;

SELECT nome, cidade
FROM Alunos
WHERE cidade = 'Curitiba';

SELECT nome, idade
FROM Alunos
WHERE idade < 22;
