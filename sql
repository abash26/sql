CREATE TABLE cities (
	name VARCHAR(50), 
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);

INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 38505000, 8223);

INSERT INTO cities (name, country, population, area)
VALUES 
    ('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3043);

SELECT * FROM cities;
SELECT name, country FROM cities;
SELECT name, population / area AS population_density
FROM cities;

SELECT name + ', ' + country AS location FROM cities;
SELECT CONCAT(name, ', ', country) AS location FROM cities;
SELECT UPPER(CONCAT(name, ', ', country)) AS location FROM cities;

SELECT name, area FROM cities WHERE area > 4000;
SELECT name, area FROM cities WHERE area = 4015;
SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 5000;
SELECT name, area FROM cities WHERE name IN ('Delhi', 'Shanghai');
SELECT name, area FROM cities WHERE name NOT IN ('Delhi', 'Shanghai');
SELECT name, area FROM cities WHERE area NOT IN (8223) AND name = 'Delhi';

SELECT name, population / area AS population_density
FROM cities WHERE population / area > 6000;

UPDATE cities SET population = 39505 WHERE name = 'Tokyo';
SELECT * FROM cities;

DELETE FROM cities WHERE name = 'Tokyo';
SELECT * FROM cities;


CREATE TABLE users (
  id INT IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(50)
);

INSERT INTO users (username)
VALUES
    ('monahan93'),
  ('pferrer'),
  ('si93onis'),
  ('99stroman');

SELECT * FROM users;

CREATE TABLE photos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO photos (url, user_id)
VALUES
('http:/one.jpg', 4),
('http:/two.jpg', 1),
('http:/25.jpg', 1),
('http:/36.jpg', 1),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);

SELECT * FROM photos WHERE user_id = 4;

INSERT INTO photos (url, user_id)
VALUES ('http://one.jpg', 42);

INSERT INTO photos (url, user_id)
VALUES ('http://one.jpg', NULL);

DELETE FROM users WHERE id = 1;

DROP TABLE photos;

CREATE TABLE photos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO photos (url, user_id)
VALUES
('http:/one.jpg', 4),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);

SELECT * FROM photos;

DELETE FROM users WHERE id = 4;
