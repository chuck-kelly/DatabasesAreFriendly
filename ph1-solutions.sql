/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
--Q1
SELECT first_name, last_name FROM actor WHERE first_name = 'Scarlett';

--Q2
SELECT first_name, last_name FROM actor WHERE last_name = 'Johansson';

--Q3
SELECT COUNT(DISTINCT last_name) as number_of_names FROM actor;

--Q4
SELECT DISTINCT last_name, COUNT(last_name) AS Count FROM actor GROUP BY last_name HAVING COUNT(last_name)=1;

--Q5
SELECT DISTINCT last_name, COUNT(last_name) AS Count FROM actor GROUP BY last_name HAVING COUNT(last_name)>1;

--Q6
SELECT f.title FROM film f JOIN inventory i ON f.film_id = i.film_id WHERE (i.store_id = 1 AND f.title = 'Academy Dinosaur');

--Q7


--Q8


--Q9


--Q10
SELECT Avg(length) as avg_length FROM film;