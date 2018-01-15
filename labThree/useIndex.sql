

/*
1.
*/
EXPLAIN ANALYZE SELECT first_name FROM mg_customers WHERE first_name = 'John';


/*
2. The query time for this analysis was a sequence scan, and was much slower than the index scan.
*/

/*
3.
*/
CREATE INDEX firstLast ON mg_customers (first_name, last_name);

/*
4.
*/
EXPLAIN ANALYZE SELECT first_name FROM mg_customers WHERE first_name = 'John'; 

/*
5. The query time for this analysis was an index scan, and was much faster than the normal query scan.
*/