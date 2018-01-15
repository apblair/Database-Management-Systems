/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Name: script5.sql
Description:
*/

/*
1. Create a view customer_city that contains the first name, last name
and city_id of all people who are customers of both Downtown Video and City Books
*/
CREATE VIEW customer_city AS
SELECT dv_customer.first_name, dv_customer.last_name, dv_address.city_id
FROM dv_customer, cb_customers, dv_address 
WHERE dv_customer.first_name = cb_customers.first_name AND dv_customer.last_name = cb_customers.last_name;


/*
2. Create a view disctrict_stat that contains the district and
the number of Downtown Video customers living in that district (sorted
in ascending order on the number of customers)
*/
CREATE VIEW district_stat AS
SELECT dv_address.district, count(customer_id) 
FROM dv_address, dv_customer 
GROUP BY dv_address.district 
ORDER BY count(customer_id);


/*
3. Create a view _author that contains the first name, last name and title for each book in
cb_books.
*/
CREATE VIEW author_title AS
SELECT cb_authors.first_name, cb_authors.last_name, cb_books.title 
FROM cb_books, cb_authors 
WHERE cb_books.author_id = cb_authors.author_id;



/*
4. Which are the books written by Stephen Fry ? (Query from the author_title view and you need to
output only the title of the book
*/
SELECT title 
FROM author_title 
WHERE first_name = 'Steven' AND last_name = 'Fry'; 


/*
5.Which district has the least number of customers? (Query from the district_stat view and list any
5 districts)
*/
SELECT district
FROM district_stat
LIMIT 5;

/*
6.Alter the name of the customer_city view to a new name of your choice 
*/
ALTER VIEW customer_city RENAME TO customer_village