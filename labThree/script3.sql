/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Name: script3.sql
Description:

General contraints:

1. Length of the film has to be a positive integer.
	-Name constraint: positive_length

2. An mg_customer must not have an empty foreign key to
	the address table.
	-the address_id cannot be NULL
	-address_id must first be set to NULL as the default
	-address_id that are set to NULL must be set to some arbitruary value

3. Any of the dv_address tuple must not have an empty address attribute
	the address attribute in the dv_address cannot be NULL.
*/

/*
1
*/
ALTER TABLE dv_film
ADD CONSTRAINT positive_length
CHECK (length>0);

/*
2
1) Default is all set to null
2) Any addition must not be null
*/
UPDATE mg_customers
SET address_id = 21
WHERE address_id IS NULL;

ALTER TABLE mg_customers ALTER COLUMN address_id SET NOT NULL;

/*
3
1) It cannot be null
2) Any additions cannot be null
*/
ALTER TABLE dv_address
ADD CONSTRAINT show_Me
CHECK (address IS NOT NULL);

ALTER TABLE dv_address ALTER COLUMN address SET NOT NULL;