/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Description:
Write a statement that declares a default value of true to the active
attributes of mg customers.

script0.sql
*/

ALTER TABLE mg_customers
ALTER COLUMN active
SET DEFAULT true; 


/*
SELECT *
FROM mg_customers
DECLARE active boolean default true;
*/