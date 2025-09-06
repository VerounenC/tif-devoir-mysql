USE tifosi;

-- Le script SQL permettant d'exécuter les requêtes de test

-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom
FROM focaccia
ORDER BY nom ASC;
-- Résultat attendu : tous les noms classés A→Z

-- 2. Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients
FROM ingredient;
-- Résultat attendu : nombre d’enregistrements dans ingredient

-- 3. Afficher le prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM focaccia;
-- Résultat attendu : moyenne des prix de toutes les focaccias

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT b.nom  AS boisson,
       m.nom  AS marque
FROM boisson b
JOIN marque  m ON m.id_marque = b.id_marque
ORDER BY b.nom ASC;
-- Résultat attendu : (boisson, marque) pour chaque boisson, triées par boisson

-- 5. Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom
FROM focaccia f
JOIN comprend fi      ON fi.id_focaccia   = f.id_focaccia
JOIN ingredient i     ON i.id_ingredient  = fi.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom ASC;
-- Résultat attendu : noms d’ingrédients liés à la focaccia Raclaccia

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT f.nom,
       COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN comprend fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom ASC;
-- Résultat attendu : (nom_focaccia, nb_ingredients) pour toutes les focaccias

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom
FROM focaccia f
JOIN comprend fi ON fi.id_focaccia = f.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY COUNT(*) DESC, f.nom ASC
LIMIT 1;
-- Résultat attendu : 1 ligne (ou plusieurs en cas d’égalité), tri secondaire sur le nom

-- 8. Afficher la liste des focaccia qui contiennent de l'ail
SELECT DISTINCT f.nom
FROM focaccia f
JOIN comprend fi  ON fi.id_focaccia  = f.id_focaccia
JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
WHERE i.nom = 'Ail'
ORDER BY f.nom ASC;
-- Résultat attendu : toutes les focaccias contenant l’ingrédient 'Ail'

-- 9. Afficher la liste des ingrédients inutilisés
SELECT i.nom
FROM ingredient i
LEFT JOIN comprend fi ON fi.id_ingredient = i.id_ingredient
WHERE fi.id_ingredient IS NULL
ORDER BY i.nom ASC;
-- Résultat attendu : ingrédients n’apparaissant dans aucune focaccia

-- 10. Afficher la liste des focaccia qui n'ont pas de champignons
SELECT f.nom
FROM focaccia f
LEFT JOIN comprend fi  ON fi.id_focaccia  = f.id_focaccia
LEFT JOIN ingredient i ON i.id_ingredient = fi.id_ingredient
GROUP BY f.id_focaccia, f.nom
HAVING SUM(CASE WHEN i.nom = 'Champignon' THEN 1 ELSE 0 END) = 0
ORDER BY f.nom ASC;
-- Résultat attendu : focaccias pour lesquelles l’ingrédient 'Champignon' n’est pas présent