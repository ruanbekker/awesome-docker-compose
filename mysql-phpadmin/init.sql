CREATE DATABASE IF NOT EXISTS mydb;

CREATE TABLE IF NOT EXISTS mydb.students (
    id INT(10) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	username VARCHAR(20) NOT NULL,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	age INT(3) NOT NULL,
	country VARCHAR(20) NOT NULL,
	profession VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS mydb.professions (
    id INT(10) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL,
    category VARCHAR(20) NOT NULL
);

INSERT IGNORE INTO mydb.students (id, username, firstname, lastname, age, country, profession) VALUES (NULL, 'ruanb', 'ruan', 'bekker', 30, 'south africa', 'devops');
INSERT IGNORE INTO mydb.students (id, username, firstname, lastname, age, country, profession) VALUES (NULL, 'samanthaf', 'samantha', 'fox', 32, 'mexico', 'nurse');

INSERT IGNORE INTO mydb.professions (id, name, category) VALUES (NULL, 'devops', 'engineering');
INSERT IGNORE INTO mydb.professions (id, name, category) VALUES (NULL, 'nurse', 'medical');

