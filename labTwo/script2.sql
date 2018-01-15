/*
Author: Andrew Blair
Cruz ID: 1364884
Assignment: Lab 2
Description:
Copies data into the TABLE's and TYPE created by script1.sql.
*/
\copy cb_authors FROM 'cb_authors.data';

\copy cb_books FROM 'cb_books.data';

\copy cb_customers FROM 'cb_customers.data';

\copy dv_address FROM 'dv_address.data';

\copy dv_film FROM 'dv_film.data';

\copy dv_customer FROM 'dv_customer.data';