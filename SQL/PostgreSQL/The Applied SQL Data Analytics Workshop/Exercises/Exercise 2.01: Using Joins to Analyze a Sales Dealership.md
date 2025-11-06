## Exercise 2.01: Using Joins to Analyze a Sales Dealership

In this exercise, we will use joins to bring related tables together.

The head of sales at your company would like a list of all customers who bought a car. We need to create a query that will return all customer IDs, first names, last names, and valid phone numbers of customers who purchased a car.

To solve this problem, perform the following steps:

1. Open your favorite SQL client and connect to the sqlda database.

2. Use an inner join to bring the tables sales and customers together, which returns data for the following: customer IDs, first names, last names, and valid phone numbers:

```sql
SELECT s.customer_id, c.first_name, c.last_name, c.phone
FROM sales s
INNER JOIN customers c ON c.customer_id = s.customer_id
INNER JOIN products p ON p.product_id = s.product_id
WHERE p.product_type = 'automobile'
AND c.phone IS NOT NULL;
```
