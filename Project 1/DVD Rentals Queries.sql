--Return all the columns from the actor Table 
Select * 
From actor

--Return the first name and the last name from the actor table
Select first_name, last_name
From actor

--Return all the columns from the film table
Select * 
From film

--Reurn the payment id and amount from the paymen table
Select payment_id, amount
From payment

--Return the films with length grater than 80 mins
Select *
From film
Where length >= 80

--Return the film titles with length equal to 80 mins
Select title
From film
Where length = 80

--Return the film title with length not equal to 80 mins
Select title
From film 
Where length <> 80

--Return the film with the title "Clue Grail"
Select *
From film
Where title = 'Clue Grail'

--Return the films with length greater than 100 and rental rate equal to 4.99
Select *
From film
Where length > 100 And rental_rate = 4.99

--Return the columns from the inventory Table
Select * 
From inventory

--Return the cities with country id equal to 82
Select *
From city
Where country_id = 82

--Return the cities with country id ranging from 70 to 100
Select * 
From city
Where country_id Between 70 And 100
           --OR
Select * 
From city
Where country_id >= 70 And country_id <=100

--Return the title and rental rates of movie ranging from 2.99 to 4.99
Select title, rental_rate
From film
Where rental_rate Between 2.99 And 4.99
            --OR
Select title, rental_rate
From film 
Where rental_rate >= 2.99 And rental_rate <= 4.99

--Return the movies with titles:(Bill Others, Chitty Lock, Desire Alien, Hanover Galaxy and
--Mine Titans) 
Select *
From film
Where title In ('Bill Others', 'Chitty Lock', 'Desire Alien', 'Hanover Galaxy', 'Mine Titans')
                  --Or       
Select * 
From film 
Where title = 'Bill Others' Or
	  title = 'Chitty Lock' Or 
	  title = 'Desire Alien' Or 
	  title = 'Hanover Galaxy' Or
	  title = 'Mine Titans'
	 
--Return the movies with length 121, 93, and 110
Select *
From film
Where length In ('121', '93', '110')
              --Or
Select * 
From film
Where length = 121 Or
	  length = 93 Or 
	  length = 110 
	 
--Return the possible customer first names missing two letters as 'J  n'
Select *
From customer
Where first_name Ilike 'J__n'

--Return a customer name where the first name starts with letter S and the last name
--ends with letter E
Select *
From customer
Where first_name Ilike 'S%' And last_name Ilike '%E'

--Return the first ten records from the customers Table 
Select * 
From customer 
Limit 10 

--Return the first 10 first names from the customer table in descending order
Select *
From customer
Order by first_name desc
Limit 10

--Return the data from the customer table where the first name starts and ends with an 
--unknown number of characters ut known to have a missing character in the middle 
--between E and N
Select *
From customer
Where first_name Ilike '%E_N%'
	   
--Return the different ratings from the film tabe
Select Distinct (rating)
From film	
	   
	   --Assignment
1. --Return the category Table
Select *
From category

2. --Return the names of the categories starting with the letter 'C'
Select "name"
From category
Where name Ilike 'C%'

3. --Return the count of payment made between March 19, 2007 and March 21, 2007  from 
--the payment Table
Select Count (*)
From payment 
Where payment_date Between '2007-03-19' And '2007-03-21'

4. --Return the Number Of distincts present in the address table
Select Distinct *
From address

5. --Return the no. of Actors with first name ending with letter 'E'and last name starting with letter 'G'
Select count (*)
From actor
Where first_name Ilike '%E' And last_name Ilike 'G%'lesson

--Return the movies that start with the letter B and their rating is either PG or PG-13
Select *
From film
Where title Ilike 'B%' And (rating = 'PG' Or rating = 'PG-13') 
                  --Or
Select *
From film
Where title Ilike 'B%' And rating In ('PG', 'PG-13') 

--Return the customer ID's and their total payment made so far
Select customer_id, sum(payment_id)
From payment
Group By customer_id 

--Return the total length of movies with rating 'PG-13'
Select Sum(length) 
From film
Where rating = 'PG-13'

--Return the total rent of movies for each rating
Select Distinct (rating), Sum(rental_rate)
From film
Group By rating 

--Return the total rental rate and the total replacement cost of movies for each rating
Select rating, Sum(rental_rate) As Total_Rental_Rate, Sum(replacement_cost) As Total_Relacement_Cost
From film
Group By rating

--Return the total rental rate and the total replacement cost of movies for each rating if the total rental rate is greater than 500
Select rating, Sum(rental_rate) As Total_Rental_Rate, Sum(replacement_cost) As Total_Relacement_Cost
From film
Group By rating

--Return the no. of customers registered under each store id 
Select store_id, Count(customer_id)
From customer
Group By store_id

--Return the no. of rentals each customer have made
Select customer_id, Count(rental_id) As count_of_rental_id
From rental 
Group By customer_id

--Return the total amount the staff id has processed so far
Select staff_id, Sum(amount) As sum_of_amount
From payment
Group By staff_id

--Return the country id and how many times each city appears on each of the country id
Select country_id, Count(city)
From City
Group By country_id

--Join the city table to the adress table
Select *
From City
Inner Join address
On city.city_id = address.city_id

--Join the film actor table to the actor table
Select *
From film_actor
Inner Join actor
On film_actor.actor_id = actor.actor_id

--Join the film, film actor and the film category tables together
Select *
From film
Inner Join film_actor
On film.film_id = film_actor.film_id
Inner Join film_category
On film_actor.film_id = film_category.film_id

--Return the names of each customers and the total payment they have made so far
Select customer.customer_id, first_name, last_name, Sum(amount)
From customer
Inner Join payment
On customer.customer_id = payment.customer_id
Group By customer.customer_id, first_name, last_name

--Return the number of movies each actor have acted in
Select first_name, last_name, Count (film_id)
From actor
Inner Join film_actor
On actor.actor_id = film_actor.actor_id
Group By first_name, last_name
Order By first_name
Select *
From film_actor

