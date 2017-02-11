--What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.

SELECT customer.first_name, customer.last_name, customer.email, address.address, city.id

FROM city
JOIN address
ON city.city_id = address.city_id
JOIN customer
ON address.address_id = customer.address_id

WHERE city.id = 312

--What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.category_id, category.name
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id

WHERE category.name = "Comedy"

-- What query would you run to get all the films joined by actor_id=5? Your query shoud return the film title, description and release year.

SELECT film.title, film.description, film.release_year, film_actor.actor_id
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id

WHERE actor_id = 5

-- What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address

SELECT customer.first_name, customer.last_name, customer.email, address.address, store.store_id, city_id

FROM customer
JOIN store
ON customer.store_id = store.store_id
JOIN address
ON customer.address_id = address.address_id


WHERE store.store_id =1 and city_id IN (1, 42, 312, 459)

--What query would you run to get all the films with a rating = G and special feature = behind the scenes, joined by actor_id = 15? Your query shoud return the film title, description, release year, rate and special feature.

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, film_actor.actor_id
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id


WHERE film.rating = "G" and special_features LIKE "%behind the scenes" and actor_id = 15

--What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.

SELECT film.film_id, film.title, film_actor.actor_id, actor.first_name

FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON film_actor.actor_id = actor.actor_id

WHERE film.film_id = 369

-- What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre (category).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.category_id, category.name, film.rental_rate

FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id

WHERE category.name = "Drama" and rental_rate = 2.99

-- What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.category_id, category.name, film_actor.actor_id, actor.first_name, actor.last_name

FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON film_actor.actor_id = actor.actor_id

WHERE actor.first_name = "SANDRA" and actor.last_name = "KILMER" and category.name = "Action"
