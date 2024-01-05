-- 7. В подключенном MySQL репозитории создать базу данных “Друзья
-- человека”
DROP DATABASE IF EXISTS friends_of_human;
CREATE DATABASE friends_of_human;
USE friends_of_human;

-- 8. Создать таблицы с иерархией из диаграммы в БД
-- 9. Заполнить низкоуровневые таблицы именами(животных), командами
-- которые они выполняют и датами рождения
DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_type VARCHAR(45)
);
INSERT INTO animals (animal_type)
VALUES ('domestic'),
    ('pack');


DROP TABLE IF EXISTS domestic;
CREATE TABLE domestic (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR (45),
    animal_type_id INT,
    FOREIGN KEY (animal_type_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO domestic (species, animal_type_id)
VALUES ('dog', 1),
    ('cat', 1),
    ('hamster', 1);


DROP TABLE IF EXISTS pack;
CREATE TABLE pack (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR (45),
    animal_type_id INT,
    FOREIGN KEY (animal_type_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO pack (species, animal_type_id)
VALUES ('horse', 2),
    ('camel', 2),
    ('donkey', 2);


DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    date_birth DATE,
    skills VARCHAR(180),
    species_id int,
    Foreign KEY (species_id) REFERENCES domestic (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO dogs (name, date_birth, skills, species_id)
VALUES ('Ace', '2023-12-12', 'come', 1),
    ('Rocky', '2022-12-12', 'stay', 1),
    ('Prince', '2010-12-12', 'drop it', 1);


DROP TABLE IF EXISTS cats;
CREATE TABLE cats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    date_birth DATE,
    skills VARCHAR(180),
    species_id int,
    Foreign KEY (species_id) REFERENCES domestic (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO cats (name, date_birth, skills, species_id)
VALUES ('Elvis', '2023-12-12', 'high five', 2),
    ('Simba', '2022-12-12', 'jump', 2),
    ('Luna', '2010-12-12', 'fetch', 2);


DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    date_birth DATE,
    skills VARCHAR(180),
    species_id int,
    Foreign KEY (species_id) REFERENCES domestic (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO hamsters (name, date_birth, skills, species_id)
VALUES ('Biscuit', '2023-12-12', 'stand', 3),
    ('Felix', '2022-12-12', 'roll', 3),
    ('Snowball', '2010-12-12', 'climb', 3);


DROP TABLE IF EXISTS horses;
CREATE TABLE horses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    date_birth DATE,
    skills VARCHAR(180),
    species_id int,
    Foreign KEY (species_id) REFERENCES pack (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO horses (name, date_birth, skills, species_id)
VALUES ('Bandit', '2023-12-12', 'come', 1),
    ('Captain', '2022-12-12', 'stay', 1),
    ('Buck', '2010-12-12', 'drop it', 1);


DROP TABLE IF EXISTS camels;
CREATE TABLE camels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    date_birth DATE,
    skills VARCHAR(180),
    species_id int,
    Foreign KEY (species_id) REFERENCES pack (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO camels (name, date_birth, skills, species_id)
VALUES ('Blaze', '2023-12-12', 'high five', 2),
    ('Champ', '2022-12-12', 'jump', 2),
    ('Cookie', '2010-12-12', 'fetch', 2);


DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    date_birth DATE,
    skills VARCHAR(180),
    species_id int,
    Foreign KEY (species_id) REFERENCES pack (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO donkeys (name, date_birth, skills, species_id)
VALUES ('Star', '2023-12-12', 'stand', 3),
    ('Trixie', '2022-12-12', 'roll', 3),
    ('Trigger', '2010-12-12', 'climb', 3);


-- 10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
-- питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
TRUNCATE camels;

SELECT name,
    date_birth,
    skills,
    species_id
FROM horses
UNION
SELECT name,
    date_birth,
    skills,
    species_id
FROM donkeys;


-- 11.Создать новую таблицу “молодые животные” в которую попадут все
-- животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
-- до месяца подсчитать возраст животных в новой таблице
