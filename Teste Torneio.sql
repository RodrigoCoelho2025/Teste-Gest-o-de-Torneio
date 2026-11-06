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
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa) 
); 

CREATE TABLE Torneios ( 
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Data_Inicio DATE NOT NULL, 
Premio_Monetario DECIMAL(10,2) NOT NULL, 
CHECK (Premio_Monetario >= 0) 
); 

CREATE TABLE Participacoes ( 
ID_Equipa INT NOT NULL, 
ID_Torneio INT NOT NULL, 
PRIMARY KEY (ID_Equipa, ID_Torneio), 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa), 
FOREIGN KEY (ID_Torneio) 
REFERENCES Torneios(ID_Torneio) 
); 

Insert Into Equipas (ID_Equipa, Nome_equipa, Data_Criacao) Values
(1, 'Os tots', 01/01/2026),
(2, 'Sporting', 01/01/2026);

Insert Into Jogadores (ID_Jogador, Nome, Nickname, Data_Nascimento, ID_Equipa) values
(1, 'Rodrigo Coelho', 'Coelhots', 21/09/2009, 1),
(2, 'Tomas Ferreira', 'Tomasoto', 25/09/2008, 1);

Insert Into Torneios (ID_Torneio, Nome, Data_Inicio, Premio_Monetario) Values
(1, 'Campionato Nacional', 06/11/2026, 100000000),
(2, 'Os Tots', 06/10/2026, 200000000),
(3, 'Taca Nacional', 06/03/2027, 1000000);

Insert Into Participacoes (ID_Equipa, ID_Torneio) values
(1, 1),
(2, 1),
(1, 2),
(2, 2);

Select Nome From Jogadores order by nome desc;

Select Nome , ID_Equipa From Jogadores;

Select ID_Equipa From Participacoes Where ID_Torneio like "2%";

Select count(*) Nome From ID_Jogadore group by Equipas having count(*) > 1; 

Select Nome_Equipa from Equipas inner join Nome on Jogadores order by Jogadores desc;

Select count(*) Nome, Premio_Monetario from Torneios inner join ID_Equipa, ID_Torneio group by Participacoes having count(*) > 1;