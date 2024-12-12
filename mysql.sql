--creation table edusign
CREATE TABLE edusign(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at DATETIME NOT NULL,
    users_id INTEGER,
    FOREIGN KEY (users_id) REFERENCES users(id)
);

--alimenter table edusign
INSERT INTO edusign (created_at, users_id)
VALUES
(datetime('now'), 1),
(datetime('now'), 2),
(datetime('now'), 3),
(datetime('now'), 4);

-- creation table users
CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT NOT NULL UNIQUE
);

--alimentation table users
INSERT INTO users (first_name, last_name, email) VALUES ('Ada', 'Lovelace', 'ada@test.fr');
INSERT INTO users (first_name, last_name, email) VALUES ('Beatrice', 'Worsley', 'bea@test.fr');
INSERT INTO users (first_name, last_name, email) VALUES ('Bella', 'Guerin', 'bella@test.fr');
INSERT INTO users (first_name, last_name, email) VALUES ('Barbara', 'Chase', 'barbara@test.fr');

-- realiser un join avec la foreign key pour récuper les données des 2 tables
SELECT *
FROM edusign
JOIN users
ON edusign.users_id = users.id;

--1.Sélectionner toutes les lignes de la table users
SELECT * FROM users;

--Sélectionner uniquement la ligne où le prénom est Ada dans la table users
SELECT * 
FROM users
WHERE first_name ='Ada';

--Sélectionner les lignes dont la première lettre du prénom est un B dans la table users
SELECT *
FROM users
WHERE first_name LIKE 'B%';

--Compter le nombre de ligne qu’il y a dans la table users
SELECT COUNT(*)
FROM users;

--Compter le nombre de ligne dont la première lettre du prénom est un Bdans la table users
SELECT COUNT(*)
FROM users
WHERE first_name LIKE 'B%';

--Afficher uniquement la colonne contenant le prénom de la table users
SELECT users.first_name
FROM users;

--Insérer une ligne dans la table edusign qui correspond à la user Ada avec comme date de signature le 2024-05-30 09:30:00
UPDATE edusign
SET created_at = '2024-05-30 09:30:00'
WHERE users_id = 1;

--Insérer une ligne dans la table edusign qui correspond à la user Bella avec comme date de signature le 2024-05-30 09:30:00
UPDATE edusign
SET created_at = '2024-05-30 09:30:00'
WHERE users_id = 3;

-- Insérer toutes les lignes de la table users dans la table edusign avec pour date de signature le 2024-09-01 09:30:00
INSERT INTO edusign (users_id, created_at)
VALUES
    (1, '2024-09-01 09:30:00'),
    (2, '2024-09-01 09:30:00'),
    (3, '2024-09-01 09:30:00'),
    (4, '2024-09-01 09:30:00');

--Sélectionner toutes les lignes de la table edusign ordonnées par date de signature de la plus récente à la plus ancienne et par user_id ascendant
SELECT * FROM edusign
ORDER BY created_at ASC, users_id ASC;

--Sélectionner toutes les lignes de la table edusign dont la date est 2024-05-30 09:30:00
SELECT * FROM edusign
WHERE created_at ='2024-05-30 09:30:00';

--Dans la table edusign, afficher le nombre d’apprenantes par date.
SELECT 
    created_at, 
    COUNT(DISTINCT users.id) AS nombre_apprenantes
FROM edusign
JOIN users ON edusign.users_id = users.id
GROUP BY created_at;

--Compter le nombre de ligne au sein de la table edusign dont le prénom est Bella, le nom de la colonne finale doit être volume
SELECT COUNT(*) AS volume
FROM edusign
JOIN users ON edusign.users_id = users.id
WHERE users.first_name = 'Bella';