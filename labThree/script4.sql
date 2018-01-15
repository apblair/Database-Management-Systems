/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 3
Name: script4.sql
Description:

Unit tests are the key to verify that a constraint is properly working.

1. A DELETE command that violoates the foreign key constraint.

2. For every general constraint:

	2.1. An INSERT command that meets the constraint.
	2.2. An INSERT command that violates the constraint.

Note: Group the unit tests for each constraint together:

-This will end up with a group of unit tests for each constraint.
-Arrange the groups so that they appear in te same order as constraint.
-Save the unit tests for each constraint ( in the same order the constraints are given in the document.)
*/

/*
1. DELETE violoation for foreign key:
-dv_addres
-cb_authors
*/

DELETE FROM dv_address
WHERE address_id = 1000;

DELETE FROM cb_authors
WHERE author_id = 1500;

/*
2. General constraint requirements:
*/

/*2.1 Meets the constraint*/
INSERT INTO dv_film
VALUES (1500, 'Show', 'ShowTest', 20, 'PG-13');

INSERT INTO dv_address
VALUES(1002,'104 Koshland Way', 'testMe', 76, 12345, 2468101214);

INSERT INTO mg_customers
VALUES(10001, 'Shower', 'showerTester', 'apblair@ucsc.edu', 66, 't' );


/*2.2 Does not meet constraint*/
INSERT INTO dv_film
VALUES (1501, 'ShowIt', 'ShowItTest', -20, 'R');

INSERT INTO mg_customers
VALUES(1000, 'Show', 'showTest', 'apblair@ucsc.edu', NULL, 't' );

INSERT INTO dv_address
VALUES(1001, NULL, 'Show', 20, 30, 40);
