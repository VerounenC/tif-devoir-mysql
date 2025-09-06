CREATE DATABASE tifosi
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
  
USE tifosi;

-- Le script SQL de création du schéma de la base de données,

CREATE TABLE client (
  id_client INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  code_postal INT
);

CREATE TABLE marque (
  id_marque INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE boisson (
  id_boisson INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  id_marque INT NOT NULL,
  CONSTRAINT fk_boisson_marque
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE ingredient (
  id_ingredient INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE focaccia (
  id_focaccia INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL UNIQUE,
  prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0)
);

CREATE TABLE menu (
  id_menu INT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL UNIQUE,
  prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0)
);

CREATE TABLE comprend (
  id_focaccia INT,
  id_ingredient INT,
  quantite INT NOT NULL CHECK (quantite > 0),
  PRIMARY KEY (id_focaccia, id_ingredient),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE est_constitue (
  id_menu INT,
  id_focaccia INT,
  PRIMARY KEY (id_menu, id_focaccia),
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE contient (
  id_menu INT,
  id_boisson INT,
  PRIMARY KEY (id_menu, id_boisson),
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE achete (
  id_client INT,
  id_menu INT,
  date_achat DATE NOT NULL,
  PRIMARY KEY (id_client, id_menu, date_achat),
  FOREIGN KEY (id_client) REFERENCES client(id_client)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
    ON UPDATE CASCADE ON DELETE RESTRICT
);
