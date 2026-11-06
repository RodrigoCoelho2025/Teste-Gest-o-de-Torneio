CREATE DATABASE gestao_torneios; 
USE gestao_torneios; 

CREATE TABLE Equipas ( 
    ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
    Nome_Equipa VARCHAR(100) NOT NULL, 
    Data_Criacao DATE NOT NULL 
); 

CREATE TABLE Jogadores ( 
    ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL, 
    Nickname VARCHAR(50) NOT NULL, 
    Data_Nascimento DATE NOT NULL, 
    ID_Equipa INT NOT NULL, 
    FOREIGN KEY (ID_Equipa) REFERENCES Equipas(ID_Equipa) 
); 

CREATE TABLE Torneios ( 
    ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL, 
    Data_Inicio DATE NOT NULL, 
    Premio_Monetario DECIMAL(15) NOT NULL, 
    CHECK (Premio_Monetario >= 0) 
); 

CREATE TABLE Participacoes ( 
    ID_Equipa INT NOT NULL, 
    ID_Torneio INT NOT NULL, 
    PRIMARY KEY (ID_Equipa, ID_Torneio), 
    FOREIGN KEY (ID_Equipa) REFERENCES Equipas(ID_Equipa), 
    FOREIGN KEY (ID_Torneio) REFERENCES Torneios(ID_Torneio) 
); 

INSERT INTO Equipas (ID_Equipa, Nome_Equipa, Data_Criacao) VALUES
(1, 'Os tots', '2026-01-01'),
(2, 'Sporting', '2026-01-01');

INSERT INTO Jogadores (ID_Jogador, Nome, Nickname, Data_Nascimento, ID_Equipa) VALUES
(1, 'Rodrigo Coelho', 'Coelhots', '2009-09-21', 1),
(2, 'Tomas Ferreira', 'Tomasoto', '2008-09-25', 1);

INSERT INTO Torneios (ID_Torneio, Nome, Data_Inicio, Premio_Monetario) VALUES
(1, 'Campionato Nacional', '2026-11-06', 150),
(2, 'Os Tots', '2026-10-06', 200),
(3, 'Taca Nacional', '2027-03-06', 100);

INSERT INTO Participacoes (ID_Equipa, ID_Torneio) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2);


SELECT Nome FROM Jogadores ORDER BY Nome asc;

SELECT Nome, ID_Equipa FROM Jogadores;

SELECT ID_Equipa FROM Participacoes WHERE ID_Torneio = 2;

SELECT ID_Equipa, COUNT(*) AS Total_Jogadores FROM Jogadores GROUP BY ID_Equipa HAVING COUNT(*) > 1;

SELECT Equipas.Nome_Equipa, Jogadores.Nome FROM Equipas INNER JOIN Jogadores ON Equipas.ID_Equipa = Jogadores.ID_Equipa ORDER BY Jogadores.Nome DESC;

SELECT Torneios.Nome, Torneios.Premio_Monetario, COUNT(Participacoes.ID_Equipa) AS Total_Equipas FROM Torneios INNER JOIN Participacoes ON Torneios.ID_Torneio = Participacoes.ID_Torneio GROUP BY Torneios.ID_Torneio, Torneios.Nome, Torneios.Premio_Monetario HAVING COUNT(Participacoes.ID_Equipa) > 1;