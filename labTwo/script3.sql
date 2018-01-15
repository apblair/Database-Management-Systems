/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 2
Description:
Populate the merged tables with data from both City Books and Downtown Video
databases.

Tasks:
1) Preserve the customer_id of the dv_customers table. Then merge remaining data into the tables. 
2) Create sequences for the merged table
3) Ensure that the id attribute in the merged table uses the sequence to generate values.
4) Copy additional data. 
*/

--Task 1
INSERT INTO mg_customers(first_name, last_name, customer_id, email, address_id, active)
SELECT dv_customer.first_name, dv_customer.last_name, dv_customer.customer_id, dv_customer.email, dv_customer.address_id, dv_customer.active FROM dv_customer;

--Task 2
CREATE SEQUENCE
mg_customers_seq START
600;

--Task 3
ALTER TABLE mg_customers ALTER
COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

--Task 4
/*
No two customers will have the same first name and last name.

Description:
SELECT only City Books customers whose first name and last name together
do not match the Downtown Video customer's first and last names. 

SELECT first and last name TOGETHER of the City Book customers who do not match
Downtown Video customer's first and last name. 

1) SELECT the first and last name of all City Books customers
2) SELECT (seperate) select all City Books and Downtown Video customers whose first
and last names do match. Then use EXCEPT to find the difference of the two sets.
3) INSERT first and last name
*/

INSERT INTO mg_customers(first_name, last_name)
SELECT first_name, last_name
FROM cb_customers
EXCEPT
SELECT first_name, last_name
FROM dv_customer;

/*
INSERT INTO mg_customers(first_name, last_name)
SELECT first_name, last_name
FROM cb_customers, dv_customer
WHERE cb_customers.first_name EXCEPT dv_customer.first_name AND cb_customers.last_name EXCEPT dv_customer.last_name;
*/



/*
INSERT INTO mg_customers(first_name, last_name)
SELECT first_name, last_name
FROM cb_customers, dv_customer
EXCEPT
SELECT first_name, last_name
FROM dv_customer;
*/