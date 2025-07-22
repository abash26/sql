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
