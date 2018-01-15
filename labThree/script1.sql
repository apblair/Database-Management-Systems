/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Name: script1.sql
Description:

Write commands that add primary constraints in the order the keys.
script1.sql

Note: ALTER TABLE statement for adding primary key must have been
declared to not contain NULL values when the table was first created.
*/


ALTER TABLE mg_customers ADD PRIMARY KEY(customer_id);
ALTER TABLE dv_address ADD PRIMARY KEY(address_id);
ALTER TABLE dv_film ADD PRIMARY KEY(film_id);
ALTER TABLE cb_books ADD PRIMARY KEY(title, author_id);
ALTER TABLE cb_authors ADD PRIMARY KEY(author_id);

