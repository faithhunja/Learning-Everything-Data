## Exercise 2.02: Generating an Elite Customer Party Guest List Using UNION

In this exercise, we will assemble two queries using unions.

In order to help build up marketing awareness for the new Model Chi, the marketing team would like to throw a party for some of ZoomZoom's wealthiest customers in Los Angeles, CA. To help facilitate the party, they would like you to make a guest list with ZoomZoom customers who live in Los Angeles, CA, as well as salespeople who work at the ZoomZoom dealership in Los Angeles, CA. The guest list should include first and last names and whether the guest is a customer or an employee. To solve this problem, execute the following:

1. Open your favorite SQL client and connect to the sqlda database.

2. Write a query that will make a list of ZoomZoom customers and company employees who live in Los Angeles, CA. The guest list should contain first and last names and whether the guest is a customer or an employee.

```sql
(
SELECT first_name, last_name, 'Customer' AS guest_type
FROM customers
WHERE city = 'Los Angeles' AND state = 'CA'
)
UNION
(
SELECT s.first_name, s.last_name, 'Employee' AS guest_type
FROM salespeople s
INNER JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE d.city = 'Los Angeles' AND state = 'CA'
)
```
