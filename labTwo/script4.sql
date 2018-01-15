/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 2
Description:
Answer query related questions.

Acknowledgements: 
Thank you to Ryan Bishop for working with me on the query scripts. 
*/

-- 1) What are the first and last names of all people who are customers of both Downtown Video and City Books ?
SELECT d.first_name, d.last_name
FROM dv_customer d, cb_customers c
WHERE d.first_name=c.first_name AND d.last_name=c.last_name;

-- 2) What are phone numbers of all people who are customers of both Downtown Video and City Books ?
SELECT dv_address.phone
FROM dv_address
WHERE dv_address.address_id IN (SELECT d.address_id
								FROM dv_customer d, cb_customers c
								WHERE d.first_name=c.first_name AND
								d.last_name=c.last_name);

-- 3) What are the first and last names of all customers who live in the district having the most customers?
SELECT first_name, last_name
FROM mg_customers
INNER JOIN dv_address
ON mg_customers.address_id=dv_address.address_id
WHERE dv_address.district = (SELECT district
                             FROM dv_address
                             GROUP BY district
                             ORDER BY COUNT(district) DESC
                             LIMIT 1); 


-- 4) What rating is the least common among films in the Downtown Video database, and how many films have that rating?
-- 		Return both the rating and the number of films in one result.
SELECT rating, COUNT(*)
FROM dv_film
GROUP BY rating
ORDER BY COUNT(rating) ASC
LIMIT 1;


-- 5) What are the first and last names of the top 10 authors when ranked by the number of books each has written?
--		Return both author name and the number of books of top 10 authors, sorted in descending order.

/*
SELECT first_name, last_name
FROM cb_authors
ON cb_authors.author_id=cb_books.author_id
WHERE cb_authors
ORDER BY COUNT()
*/

/*
select count(title),author_id from cb_books
group by author_id
order by COUNT(title) DESC
*/


SELECT COUNT(cb_books.author_id) AS ct, cb_authors.last_name, cb_authors.first_name
FROM cb_books
JOIN cb_authors
ON cb_authors.author_id = cb_books.author_id
GROUP BY cb_authors.last_name, cb_authors.first_name
ORDER BY ct DESC
LIMIT 10;

/*
SELECT author_id
FROM cb_authors, cb_books
WHERE cb_authors.author_id=cb_books.author_id
ORDER BY COUNT (SELECT first_name, last_name
				FROM cb_authors, cb_books)
*/