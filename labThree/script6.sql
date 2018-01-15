/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Name: script5.sql
Description:

Complete the queries

Acknowledgements: Ryan Bishop
*/

/*
1.Write a statement that will change the active attribute to true for every row in mg_customers
where active is NULL and the customer’s last name starts with ’B’ or ’C’ 
*/
UPDATE mg_customers 
SET active = true
WHERE active IS NULL AND (last_name like 'B%' OR last_name like 'C%');

/*
2. JohnSmithisanewcustomer. Hisdetailsareasfollows:
- First Name: John
- Last Name: Smith
- Address id : 700
- Address:Koshland Way
- City id : 654
- Postal code: 95064
Addthedetails ofthenewcustomer to themg customeranddv address table.(Youcanassume
the values that are not specified to be NULL) Note: one ofthese rows must be inserted before
the other; you’ll need to determinewhatis the correct order.
*/
INSERT INTO dv_address(address_id, address, city_id, postal_code)
VALUES(700, 'Koshland Way', 654, '95064');
INSERT INTO mg_customers(first_name, last_name, address_id)
VALUES ('John', 'Smith', 700);

/*
3.Listthe title ofeachfilmwhose lengthexceeds the average lengthofallfilms
*/
SELECT title
FROM dv_film
WHERE length > (SELECT AVG(length)
                FROM dv_film);

/*
4.Whatisthemaximum,minimumandaveragelengthofthefilms ineachratingcategory? 
*/
SELECT MAX(length), MIN(length), AVG(length), rating
FROM dv_film
GROUP BY rating;

/*
5.Write a statement that will delete all the books written by Nevil Shute
*/
DELETE
FROM cb_books
WHERE author_id = (SELECT author_id
                   FROM cb_authors
                   WHERE first_name='Nevil' AND last_name='Shute');