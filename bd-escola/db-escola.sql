CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE ALUNO (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(320),
    endereco VARCHAR(255)
);

INSERT INTO ALUNO (ID, nome, email, endereco) VALUES
(1, 'Tamires Soares', 'tamires-soares@gmail.com', 'Rua 22 de Abril, 35'),
(2, 'Larissa Rodrigues', 'larissa-rodrigues@hotmail.com', 'Rua Monteiro Lobato, 70'),
(3, 'Jean Carvalho', 'jean-carvalho@outlook.com', 'Rua São Paulo, 955')
;

SELECT * FROM ALUNO;
