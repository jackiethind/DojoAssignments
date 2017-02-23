--1. What query would you run to get all the countries that speak Slovene? Your query should return the name of the country, language and language percentage. Your query should arrange the result by language percentage in descending order. (1)

SELECT languages.language, languages.percentage, countries.name
-- after the . is the id, language box is where you are pulling these ids, and countries is where you pull the name id
FROM countries -- this is where the primary key is coming from
--
JOIN languages -- joining box will always have the foreign key

ON countries.id = languages.country_id --setting the primary to the foreign key

WHERE languages.language = "Slovene" --
order by language.percentage DESC; --order by descending order


--2. What query would you run to display the total number of cities for each country? Your query should return the name of the country and the total number of cities. Your query should arrange the result by the number of cities in descending order. (3)


SELECT countries.name, COUNT(cities.id)

FROM countries
JOIN cities

ON countries.code = cities.country_code
GROUP by countries.code

order by COUNT(cities.id) DESC;


--3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? Your query should arrange the result by population in descending order. (1)

SELECT cities.population, cities.name

FROM countries
JOIN cities

ON countries.code = cities.country_code
WHERE countries.name = "Mexico" and cities.population >500000

order by cities.population DESC;


--4. What query would you run to get all languages in each country with a percentage greater than 89%? Your query should arrange the result by percentage in descending order. (1)

SELECT languages.language, languages.percentage, countries.name

FROM countries
JOIN languages

ON countries.id = languages.country_id
WHERE languages.percentage > 89%

order by languages.percentage DESC;

--What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)

SELECT countries.population, countries.surface_area, countries.name

FROM countries

WHERE countries.surface_area < 501 and countries.population > 100000

--What query would you run to get countries with only Constitutional Monarchy with a capital greater than 200 and a life expectancy greater than 75 years? (1)

SELECT countries.life_expectancy, countries.capital, countries.government_form, countries.name

FROM countries

WHERE countries.government_form = "Constitutional Monarchy" and countries.capital > 200 and countries.life_expectancy > 75

--What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? The query should return the Country Name, City Name, District and Population. (2)

SELECT cities.population, countries.name, cities.name, cities.district

FROM countries
JOIN cities

ON countries.code = cities.country_code
WHERE countries.name = "Argentina" and cities.district = "Buenos Aires" and cities.population > 500000

--What query would you run to summarize the number of countries in each region? The query should display the name of the region and the number of countries. Also, the query should arrange the result by the number of countries in descending order. (2)

SELECT countries.region, COUNT(countries.id)

FROM countries

GROUP by countries.region

order by COUNT(countries.id) DESC;
