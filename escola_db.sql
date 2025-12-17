CREATE DATABASE Escola;

USE Escola;

set sql_safe_updates = 0;

CREATE TABLE Alunos (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
idade INT,
serie VARCHAR(50)
);

INSERT INTO Alunos (id, nome, idade, serie)
VALUES
(1,'Valber Justino',40,'9° Ano'),
(2,'Maria Silva', 20,'6° Ano'),
(3,'João Santos', 22,'7° Ano'),
(4,'Ana Souza', 19,'8° Ano'),
(5,'Carlos Pereira', 25,'3° Ano');

SELECT * FROM Alunos;

SELECT nome, idade FROM Alunos;

SELECT *
FROM Alunos
WHERE serie = '8° Ano';

UPDATE Alunos
SET idade = '31'
WHERE nome = 'Ana Souza';

DELETE FROM Alunos
WHERE nome = 'Carlos Pereira';
