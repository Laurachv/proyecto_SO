
DROP DATABASE IF EXISTS Quien_es_quien;


CREATE DATABASE Quien_es_quien;


USE Quien_es_quien;


CREATE TABLE Jugadores (
    ID_jugador INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);


CREATE TABLE Partidas (
    ID_partida INT AUTO_INCREMENT PRIMARY KEY,
    ID_jugador INT,
    Victorias INT,
    Derrotas INT,
    Puntuacion INT,
    FOREIGN KEY (ID_jugador) REFERENCES Jugadores(ID_jugador)
);


CREATE TABLE Preguntas_Realizadas (
    ID_pregunta INT AUTO_INCREMENT PRIMARY KEY,
    ID_partida INT,
    atributo_id INT,
    respuesta ENUM('sí', 'no') NOT NULL,
    FOREIGN KEY (ID_partida) REFERENCES Partidas(ID_partida)
);


INSERT INTO Jugadores (username, password) VALUES ('jugador1', 'pass1');
INSERT INTO Jugadores (username, password) VALUES ('jugador2', 'pass2');
INSERT INTO Jugadores (username, password) VALUES ('jugador3', 'pass3');


INSERT INTO Partidas (ID_jugador, Victorias, Derrotas, Puntuacion) 
VALUES (1, 3, 2, 30);

INSERT INTO Partidas (ID_jugador, Victorias, Derrotas, Puntuacion) 
VALUES (2, 5, 1, 50);

INSERT INTO Partidas (ID_jugador, Victorias, Derrotas, Puntuacion) 
VALUES (3, 2, 4, 20);

INSERT INTO Preguntas_Realizadas (ID_partida, atributo_id, respuesta) 
VALUES (1, 1, 'sí');

INSERT INTO Preguntas_Realizadas (ID_partida, atributo_id, respuesta) 
VALUES (1, 2, 'no');

INSERT INTO Preguntas_Realizadas (ID_partida, atributo_id, respuesta) 
VALUES (2, 1, 'no');

INSERT INTO Preguntas_Realizadas (ID_partida, atributo_id, respuesta) 
VALUES (2, 2, 'sí');

INSERT INTO Preguntas_Realizadas (ID_partida, atributo_id, respuesta) 
VALUES (3, 1, 'sí');