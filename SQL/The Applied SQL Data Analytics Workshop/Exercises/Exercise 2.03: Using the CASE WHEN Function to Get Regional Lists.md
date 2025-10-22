## Exercise 2.03: Using the CASE WHEN Function to Get Regional Lists

The aim of this exercise is to create a query that will map various values in a column to other values.

The head of sales has an idea to try and create specialized regional sales teams that will be able to sell scooters to customers in specific regions, as opposed to generic sales teams. To make his idea a reality, he would like a list of all customers mapped to regions. For customers from the states of MA, NH, VT, ME, CT, or RI, he would like them labeled as New England. For customers from the states of GA, FL, MS, AL, LA, KY, VA, NC, SC, TN, VI, WV, or AR, he would like the customers labeled as Southeast. Customers from any other state should be labeled as Other.
To complete this exercise, perform the following steps:

1. Open your favorite SQL client and connect to the sqlda database.

2. Create a query that will produce a customer_id column and a column called region, with the states categorized as in the following scenario:

```sql
SELECT customer_id,
    CASE
        WHEN state IN ('MA', 'NH', 'VT', 'ME', 'CT', 'RI') THEN 'New England'
        WHEN state IN ('GA', 'FL', 'MS', 'AL', 'LA', 'KY', 'VA', 'NC', 'SC', 'TN', 'VI', 'WV', 'AR') THEN 'Southeast'
        ELSE 'Other'
    END
AS region
FROM customers
ORDER BY 1;
```
