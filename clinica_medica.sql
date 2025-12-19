
CREATE DATABASE clinica_medica;
USE clinica_medica;

-- Criando a tabela MEDICO
CREATE TABLE MEDICO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(50) NOT NULL CHECK (especialidade IN ('Cardiologia', 'Dermatologia', 'Ortopedia', 'Pediatria'))
);

-- Criando a tabela PACIENTE
CREATE TABLE PACIENTE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20)
);

-- Criando a tabela CONSULTA (Com Foreign Keys)
CREATE TABLE CONSULTA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    medico_id INT,
    paciente_id INT,
    FOREIGN KEY (medico_id) REFERENCES MEDICO(id),
    FOREIGN KEY (paciente_id) REFERENCES PACIENTE(id)
);

-- Criando a tabela EXAME
CREATE TABLE EXAME (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_exame VARCHAR(100) NOT NULL,
    paciente_id INT,
    FOREIGN KEY (paciente_id) REFERENCES PACIENTE(id)
);

-- Inserindo 3 Médicos
INSERT INTO MEDICO (nome, crm, especialidade) VALUES
('Dr. Arnaldo Silva', 'CRM-123', 'Cardiologia'),
('Dra. Beatriz Souza', 'CRM-456', 'Dermatologia'),
('Dr. Carlos Alberto', 'CRM-789', 'Cardiologia');

-- Inserindo 5 Pacientes
INSERT INTO PACIENTE (nome, cpf, data_nascimento, telefone) VALUES
('Marcos Oliveira', '111.111.111-11', '1995-05-10', '(11) 9999-9999'),
('Ana Paula', '222.222.222-22', '2005-08-15', '(11) 8888-8888'),
('Ricardo Santos', '333.333.333-33', '1980-01-20', '(11) 7777-7777'),
('Luciana Lima', '444.444.444-44', '2010-12-30', '(11) 6666-6666'),
('Fernando Vaz', '555.555.555-55', '1990-03-25', '(11) 5555-5555');

-- Inserindo 4 Consultas
INSERT INTO CONSULTA (data_consulta, valor, medico_id, paciente_id) VALUES
('2024-03-01', 250.00, 1, 1),
('2024-03-02', 300.00, 2, 2),
('2024-03-05', 200.00, 1, 4),
('2024-03-10', 350.00, 3, 5);

-- Tarefa 2: Remover o paciente com ID = 3
DELETE FROM PACIENTE WHERE id = 3;

-- Tarefa 1: Alterar telefone do Paciente com ID = 2
UPDATE PACIENTE SET telefone = '(11) 91234-5678' WHERE id = 2;

-- Tarefa 2: Consultas Simples
-- 1. Todos os dados de todos os Pacientes
SELECT * FROM PACIENTE;

-- 2. Nome e Especialidade de todos os Médicos
SELECT nome, especialidade FROM MEDICO;

-- 3. Dados da consulta com ID = 1
SELECT * FROM CONSULTA WHERE id = 1;

-- 4. Pacientes que nasceram depois do ano 2000
SELECT * FROM PACIENTE WHERE data_nascimento > '2000-12-31';

-- 5. Médicos da especialidade "Cardiologia"
SELECT * FROM MEDICO WHERE especialidade = 'Cardiologia';


-- 1. Quantos pacientes estão cadastrados?
SELECT COUNT(*) AS total_pacientes FROM PACIENTE;

-- 2. Qual a data da consulta mais antiga?
SELECT MIN(data_consulta) AS consulta_mais_antiga FROM CONSULTA;

-- 3. Qual a média de valor das consultas?
SELECT AVG(valor) AS media_valor_consultas FROM CONSULTA;

-- 4. Listar todos os pacientes em ordem alfabética
SELECT * FROM PACIENTE ORDER BY nome ASC;

-- 5. Quantas consultas cada médico realizou?
SELECT medico_id, COUNT(*) AS total_consultas 
FROM CONSULTA 
GROUP BY medico_id;



-- 1. Nome do Paciente e data da Consulta (JOIN Simples)
SELECT PACIENTE.nome, CONSULTA.data_consulta
FROM PACIENTE
INNER JOIN CONSULTA ON PACIENTE.id = CONSULTA.paciente_id;

-- 2. Nome do Médico, especialidade e Nome do Paciente (JOIN Triplo)
SELECT MEDICO.nome AS medico, MEDICO.especialidade, PACIENTE.nome AS paciente
FROM CONSULTA
INNER JOIN MEDICO ON CONSULTA.medico_id = MEDICO.id
INNER JOIN PACIENTE ON CONSULTA.paciente_id = PACIENTE.id;

-- 3. Nome de todos os Médicos e datas de suas consultas (LEFT JOIN)
-- (Inclui médicos que nunca consultaram)
SELECT MEDICO.nome, CONSULTA.data_consulta
FROM MEDICO
LEFT JOIN CONSULTA ON MEDICO.id = CONSULTA.medico_id;