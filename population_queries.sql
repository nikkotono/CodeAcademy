-- Solutions for World Population II Challenge from Code Academy's Data Science Program by Nicolas Matiz

-- How many entries in the database are from Africa?

SELECT COUNT(*) as 'African Entries'
FROM countries
WHERE countries.continent = 'Africa';

-- What was the total population of Oceania in 2005?

SELECT SUM(population_years.population) as 'Total Population of Oceania in 2005'
FROM countries
JOIN population_years
ON countries.id = population_years.id
WHERE population_years.year = 2005;

-- What is the average population of countries in South America in 2003?

SELECT AVG(py.population)
FROM countries
JOIN population_years py
  ON countries.id = py.country_id
WHERE countries.continent = 'South America' AND
      py.year = 2003;


-- What country had the smallest population in 2007?

SELECT countries.name, MIN(py.population)
FROM countries
  JOIN population_years py on countries.id = py.country_id
WHERE py.year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?

SELECT AVG(py.population) as 'Avg population', c.name as 'Country'
FROM population_years py
JOIN countries c on py.id = c.id
WHERE c.name = 'Poland';

-- How many countries have the word "The" in their name?

SELECT COUNT(c.name) as 'Countries with |the|'
FROM countries c
WHERE name LIKE '%The';


-- What was the total population of each continent in 2010?

SELECT c.continent, SUM(py.population)
FROM countries c
JOIN population_years py on c.id = py.id
WHERE py.year = 2010
GROUP BY c.continent;

