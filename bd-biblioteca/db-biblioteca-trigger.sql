-- Criação banco de dados
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Criação da tabela de Livros
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Disponivel BOOLEAN
);

-- Criação da tabela de Usuários
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);

-- Criação da tabela de Empréstimos
CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    id_usuario INT,
    DataEmprestimo DATETIME,
    DataDevolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Inserção de dados na tabela livros
INSERT INTO Livros (Titulo, Autor, Disponivel) VALUES
    ('A Sociedade do Anel', 'J. R. R.Tolkien', TRUE),
    ('A Ordem da Fênix', 'J. K. Rowling', TRUE),
    ('A Viagem do Peregrino da Alvorada', 'C. S. Lewis', TRUE),
    ('Percy Jackson e O Último Olimpiano', 'Rick Riordan', TRUE),
    ('Jogos Vorazes', 'Suzanne Collins', TRUE),
    ('Sherlock Holmes - O cão dos Baskervilles', 'Arthur Conan Doyle', TRUE),
    ('Orgulho e Preconceito', 'Jane Austen', TRUE),
    ('Ilíada', 'Homero', TRUE),
    ('Sonho de uma Noite de Verão', 'William Shakespeare', TRUE),
    ('Os Três Mosqueteiros', 'Alexandre Dumas', TRUE),
    ('O Natal do Avarento', 'Charles Dickens', TRUE),
    ('O Guarani', 'José de Alencar', TRUE),
    ('O Poder do Agora', 'Eckhart Tolle', TRUE),
    ('Mindset', 'Carol S. Dweck', TRUE);

-- Inserção de dados na tabela usuários
INSERT INTO Usuarios (Nome, Email) VALUES
    ('Tamires Soares', 'tamires-soares@gmail.com'),
    ('Larissa Rodrigues', 'larissa-rodrigues@hotmail.com'),
    ('Jean Camargo', 'jean-camargo@outlook.com'),
    ('Gustavo Gaspar', 'gustavo-gaspar@gmail.com'),
    ('Michele Alves', 'michele-alves@outllok.com'),
    ('Priscila Goncalves', 'priscila-goncalves@outlook.com'),
    ('Danilo Carvalho', 'danilo-carvalho@gmail.com');
    
-- Inserção de dados na tabela emprestimos
INSERT INTO Emprestimos (id_livro, id_usuario, DataEmprestimo) VALUES
    (7, 1, NOW()),
    (9, 2, NOW()),
    (5, 4, NOW());

-- Criação de trigger para atualizar a disponibilidade do livro
DELIMITER //
CREATE TRIGGER AtualizarDisponibilidade
AFTER INSERT ON Emprestimos
FOR EACH ROW
BEGIN
   UPDATE Livros SET Disponivel = FALSE WHERE id_livro = NEW.id_livro;
END;//
DELIMITER ;

INSERT INTO Emprestimos (id_livro, id_usuario, DataEmprestimo) VALUES
    (1, 3, NOW());