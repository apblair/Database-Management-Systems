/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Name: script2.sql
Description:

Write commands to add foreign key constraints in the order of the keys.

Note: 

A FOREIGN KEY is a key used to link two tables together.
A FOREIGN KEY field is a field in one table that refers to
the PRIMARY KEY in another table.

*/

ALTER TABLE mg_customers
ADD FOREIGN KEY (address_id)
REFERENCES dv_address(address_id);

ALTER TABLE cb_books
ADD FOREIGN KEY (author_id)
REFERENCES cb_authors(author_id);
