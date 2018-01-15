/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 2
Description:
Create TABLE's and TYPE's for CMPS 182 Lab 2.
*/
CREATE TABLE dv_customer(
	customer_id int,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	--address_id needs to be an int, when loading data. 
	address_id varchar(50),
	active boolean
);

CREATE TABLE dv_address(
	address_id varchar(50),
	address varchar(50),
	address2 varchar(50),
	district varchar(50),
	city_id int,
	postal_code varchar(50),
	phone varchar(50)
);

CREATE TYPE mpaa_rating AS ENUM (
	'G',
	'PG',
	'PG-13',
	'R',
	'NC-17'
);

CREATE TABLE dv_film(
	film_id int,
	title varchar(50),
	description text,
	length smallint,
	rating mpaa_rating
);

CREATE TABLE cb_customers(
	last_name varchar(50),
	first_name varchar(50)
);

CREATE TABLE cb_books(
	title varchar(50),
	author_id int
);

CREATE TABLE cb_authors(
	author_id int,
	first_name varchar(50),
	last_name varchar(50)
);

CREATE TABLE mg_customers(
	customer_id int,
	first_name varchar(50),
	last_name  varchar(50),
	email  varchar(50),
	address_id varchar(50),
	active boolean
);