# 🐘 SQL

L’objectif est de vous familiariser avec les bases de SQL.

L’exercice individuel est découpé en 3 étapes :

1. Premier pas, pour faire son premier schéma simple d’une table
2. Structuration, pour créer ses premières tables
3. Requêtes, découper en 3 niveaux (facile, moyen, moyen+). 
*Les niveaux moyen et moyen+ sont pour celles et ceux qui se sentent un peu plus à l’aise. Vous pouvez retrouver ces deux niveaux plus tard si le premier vous semble déjà difficile.*

## 🎯 Objectif

### Contexte

Nous allons créer la base de données d’Edusign comme on l’imaginerait.

Pour ne pas complexifier notre base, nous partons sur celle utilisée par l’application des apprenants et apprenantes. Ce sera donc une version réduite d’Edusign.

## 📘 Instructions

Pour celles et ceux qui ne sont pas encore à l’aise avec SQL, je vous recommande de commencer par des schémas que vous pouvez faire avec un papier stylo ou avec [Figjam](https://www.figma.com/fr-fr/figjam/online-whiteboard/) de Figma.

Pour celles et ceux qui se sentent à l’aise avec les toutes premières bases de SQL, vous pouvez accélérer sur les étapes “Premier pas”.

Par bonne pratique, je nommerai les colonnes et noms de tables en anglais mais si vous êtes plus à l’aise avec du français, c’est OK aussi. 
Tant que vous ne mettez pas d’accents ou autres caractères spéciaux 👀

Aussi, j’adopterai le `snake_case` en convention de nommage.

## 🔧 Outils

Un SQLite en ligne suffit.

Notre recommandation pour pratiquer simplement : 

- https://simple-sqlite-editor.vercel.app/

Pour info, il existe aussi :

- https://sqliteonline.com/
- https://sqlfiddle.com/

## 👟 Étape 1 : Premiers pas sur papier !

L’objectif de ces premiers pas est de vous permettre de conscientiser l’importance de découper ses tables. C’est pourquoi on part ici sur une table générale que nous allons découper dans les prochaines étapes.

### Instructions

- Imaginons une première table `edusign` qui regroupe les signatures des apprenants et apprenantes.
- On considère ici la date de signature comme une signature.

Elle devra contenir :

- Le prénom
- Le nom
- L’email
- La date de signature

*Exemple de schéma :*

![15_mysql_01.png](images/15_mysql_01.png)

*Exemple de schéma de contenu de table :*

![15_mysql_02.png](images/15_mysql_02.png)

### Première conclusion

Une fois votre schéma fait, on remarquera que notre table va finir par contenir de la donnée  redondante : les informations sur l’apprenante peuvent se répéter sur plusieurs lignes.

Ce qui n’est pas très optimal et déprécié.

Nous allons donc séparer les informations et nous lancer dans la création de tables relationnelles.

## 🔨 Étape 2 : Structurons la base de données

Séparons donc les informations pour réduire la répétition d’informations dans la table `edusign`

☝ Conseil 1 : faite un schéma avant de vous lancer dans la rédaction des requêtes

☝ Conseil 2 : et n’oublie pas d’enregistrer ton fichier dans un `.sql` au fur à mesure pour ne pas perdre ce que tu as fait

### Instructions

- Créer la table **`users`** qui permet de référencer les apprenants et apprenantes utilisant Edusign et qui contiendra donc le **Prénom**, **Nom** et l’adresse **Email**.
- Créer un identifiant au sein de la table `users`
- Modifier la table **`edusign`** pour remplacer les colonnes Prénom, Nom et Email par l’identifiant de la table `users`

- Vous pouvez dorénavant insérer de la données fictives dans vos tables pour vérifier que tout est bon. Un exemple de requête ci-dessous :

```sql
INSERT INTO users (firstname, lastname, email) VALUES ('Ada', 'Lovelace', 'ada@test.fr');
INSERT INTO users (firstname, lastname, email) VALUES ('Beatrice', 'Worsley', 'bea@test.fr');
INSERT INTO users (firstname, lastname, email) VALUES ('Bella', 'Guerin', 'bella@test.fr');
INSERT INTO users (firstname, lastname, email) VALUES ('Barbara', 'Chase', 'barbara@test.fr');
```

## 💬 Étape 3 : Requêtons

### Niveau facile

1. Sélectionner toutes les lignes de la table `users`
2. Sélectionner uniquement la ligne où le prénom est `Ada` dans la table `users`
3. Sélectionner les lignes dont la première lettre du prénom est un `B` dans la table `users`
4. Compter le nombre de ligne qu’il y a dans la table `users`
5. Compter le nombre de ligne dont la première lettre du prénom est un `B`dans la table `users`
6. Afficher uniquement la colonne contenant le prénom de la table `users`. Résultat attendu 👇

![15_mysql_03](images/15_mysql_03.png)

### Niveau moyen

1. Insérer une ligne dans la table `edusign` qui correspond à la user `Ada` avec comme date de signature le `2024-05-30 09:30:00`
2. Insérer une ligne dans la table `edusign` qui correspond à la user `Bella` avec comme date de signature le `2024-05-30 09:30:00` 
3. Insérer toutes les lignes de la table `users` dans la table `edusign` avec pour date de signature le `2024-09-01 09:30:00` 
4. Sélectionner toutes les lignes de la table `edusign` ordonnées par date de signature de la plus récente à la plus ancienne et par `user_id` ascendant.
Résultat attendu 👇

*Note : les id peuvent potentiellement être différents entre ce résultat et le votre.
Selon comment vous avez construit votre table et l’ordre dans laquelle vous avez inséré les données* 

![15_mysql_04.png](images/15_mysql_04.png)

5. Sélectionner toutes les lignes de la table `edusign` dont la date est `2024-05-30 09:30:00` 

### Niveau moyen+ (bonus)

1. Dans la table `edusign`, afficher le nombre d’apprenantes par date.
2. Compter le nombre de ligne au sein de la table `edusign` dont le prénom est `Bella`, le nom de la colonne finale doit être `volume`
