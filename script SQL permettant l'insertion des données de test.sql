USE tifosi;

-- Le script SQL permettant l'insertion des données de test

INSERT INTO marque (id_marque, nom) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

INSERT INTO boisson (id_boisson, nom, id_marque) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Cristalline eau plate', 2),
(7, 'Cristalline eau gazeuse', 2),
(8, 'Monster Energy', 3),
(9, 'Pepsi', 4),
(10, '7Up', 4);

INSERT INTO ingredient (id_ingredient, nom) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base Crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

INSERT INTO focaccia (id_focaccia, nom, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90);

INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES
-- Mozaccia : Base tomate, Mozarella, Cresson, Jambon fumé, Ail
(1, 5, 1), (1, 25, 1), (1, 9, 1), (1, 13, 1), (1, 1, 1),

-- Gorgonzollaccia : Base tomate, Gorgonzola, Cresson, Ail, Champignon
(2, 5, 1), (2, 11, 1), (2, 9, 1), (2, 1, 1), (2, 7, 1),

-- Raclaccia : Base tomate, Raclette, Cresson, Ail, Champignon, Parmesan, Poivre
(3, 5, 1), (3, 22, 1), (3, 9, 1), (3, 1, 1), (3, 7, 1), (3, 18, 1), (3, 20, 1),

-- Emmentalaccia : Base crème, Emmental, Cresson, Champignon, Parmesan
(4, 6, 1), (4, 10, 1), (4, 9, 1), (4, 7, 1), (4, 18, 1),

-- Tradizione : Base tomate, Mozarella, Cresson, Jambon cuit, Oignon
(5, 5, 1), (5, 25, 1), (5, 9, 1), (5, 12, 1), (5, 15, 1);

INSERT INTO menu (id_menu, nom, prix) VALUES
(1, 'Menu Classico', 12.90),
(2, 'Menu Duo', 15.50);

INSERT INTO est_constitue (id_menu, id_focaccia) VALUES
(1, 1), (1, 5),
(2, 2), (2, 3);

INSERT INTO contient (id_menu, id_boisson) VALUES
(1, 1), (1, 6),
(2, 2), (2, 9);

INSERT INTO client (id_client, nom, email, code_postal) VALUES
(1, 'Alice Dupont', 'alice.dupont@example.com', 74000),
(2, 'Bob Martin', 'bob.martin@example.com', 75015);

INSERT INTO achete (id_client, id_menu, date_achat) VALUES
(1, 1, '2025-09-01'),
(2, 2, '2025-09-02');
