# DatabasesAreFriendly
databases are a data engineer's Best Friend. and if not, do this lab and make them so. mysql needed. local is best.

## MySQL installed?

Make sure you have MySQL installed on your local machine.

## Install Sakila Database

This [document](https://downloads.mysql.com/docs/sakila-en.pdf) describes Sakila sample database installation, structure, usage, and history.
Use this document to install the sakila database on your dev machine.
Or use the online pages at [Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/).

The sources for the database are [sakila-db.tar.gz](https://downloads.mysql.com/docs/sakila-db.tar.gz)

On the mac, double-clicking that file, once downloaded, should be all you need to do the installation.


## Complete these exercises

You’re writing software to manage a chain of movie rental stores.

There are two phases of the exercises for ths project. 

### Phase 1. Poking at the DB

* Write an SQL script with queries that answer the following questions:
* 1. Which actors have the first name ‘Scarlett’
SELECT first_name, last_name FROM actor WHERE first_name = 'Scarlett';
* 2. Which actors have the last name ‘Johansson’
SELECT first_name, last_name FROM actor WHERE last_name = 'Johansson';
* 3. How many distinct actors last names are t here?
SELECT COUNT(DISTINCT last_name) as number_of_names FROM actor;
* 4. Which last names are not repeated?
SELECT DISTINCT last_name, COUNT(last_name) AS Count FROM actor GROUP BY last_name HAVING COUNT(last_name)=1;
* 5. Which last names appear more than once?
SELECT DISTINCT last_name, COUNT(last_name) AS Count FROM actor GROUP BY last_name HAVING COUNT(last_name)>1;
* 6. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id GROUP BY fa.actor_id ORDER BY film_count DESC LIMIT 1;
* 7. Is ‘Academy Dinosaur’ available for rent from Store 1?
SELECT f.title FROM film f JOIN inventory i ON f.film_id = i.film_id WHERE (i.store_id = 1 AND f.title = 'Academy Dinosaur');
* 8. Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today .

* 9. When is ‘Academy Dinosaur’ due?

* 10. What is that average running time of all the films in the sakila DB?
SELECT Avg(length) as avg_length FROM film;
* 11. What is the average running time of films by category?

* 12. Why does this query return the empty set? 

`select * from film natural join inventory;`

The solutions to these are in [sakila-queries-answers.sql](doc/sakila-queries-answers.sql) (But don't look at them until you've really tried to solved them all yourself.)

### Phase 2. Longer, Harder, More Realistic.

Use google as lightly as possible in solving these. These are the kind of queries that any data engineer should be able to perform on a familiar dataset.

* 1a. Display the first and last names of all actors from the table `actor`. 

* 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column `Actor Name`. 

* 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
  	
* 2b. Find all actors whose last name contain the letters `GEN`:
  	
* 2c. Find all actors whose last names contain the letters `LI`. This time, order the rows by last name and first name, in that order:

* 2d. Using `IN`, display the `country_id` and `country` columns of the following countries: Afghanistan, Bangladesh, and China:

* 3a. Add a `middle_name` column to the table `actor`. Position it between `first_name` and `last_name`. Hint: you will need to specify the data type.
  	
* 3b. You realize that some of these actors have tremendously long last names. Change the data type of the `middle_name` column to `blobs`.

* 3c. Now delete the `middle_name` column.

* 4a. List the last names of actors, as well as how many actors have that last name.
  	
* 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
  	
* 4c. Oh, no! The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as `GROUCHO WILLIAMS`, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
  	
* 4d. Perhaps we were too hasty in changing `GROUCHO` to `HARPO`. It turns out that `GROUCHO` was the correct name after all! In a single query, if the first name of the actor is currently `HARPO`, change it to `GROUCHO`. Otherwise, change the first name to `MUCHO GROUCHO`, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO `MUCHO GROUCHO`, HOWEVER! (Hint: update the record using a unique identifier.)

* 5a. You cannot locate the schema of the `address` table. Which query would you use to re-create it? 

  * Hint: [https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html](https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html)

* 6a. Use `JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address`:

* 6b. Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`. 
  	
* 6c. List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join.
  	
* 6d. How many copies of the film `Hunchback Impossible` exist in the inventory system?

* 6e. Using the tables `payment` and `customer` and the `JOIN` command, list the total paid by each customer. List the customers alphabetically by last name

* 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters `K` and `Q` have also soared in popularity. Use subqueries to display the titles of movies starting with the letters `K` and `Q` whose language is English. 

* 7b. Use subqueries to display all actors who appear in the film `Alone Trip`.
   
* 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.

* 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.

* 7e. Display the most frequently rented movies in descending order.
  	
* 7f. Write a query to display how much business, in dollars, each store brought in.

* 7g. Write a query to display for each store its store ID, city, and country.
  	
* 7h. List the top five genres in gross revenue in descending order. (**Hint**: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
  	
* 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
  	
* 8b. How would you display the view that you created in 8a?

* 8c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.
