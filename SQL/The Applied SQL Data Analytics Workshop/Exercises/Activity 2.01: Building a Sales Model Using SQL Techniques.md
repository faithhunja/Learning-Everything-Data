## Activity 2.01: Building a Sales Model Using SQL Techniques

In this activity, we will clean and prepare our data for analysis using SQL techniques.

The data science team wants to build a new model to help predict which customers are the best prospects for remarketing. A new data scientist has joined their team and does not know the database well enough to pull a dataset for this new model.The responsibility has fallen to you to help the new data scientist prepare and build a dataset to be used to train a model. Write a query to assemble a dataset. Here are the steps to perform:

1. Open a SQL client and connect to the database.

2. Use INNER JOIN to join the customers table to the sales table.

3. Use INNER JOIN to join the products table to the sales table.

4. Use LEFT JOIN to join the dealerships table to the sales table.

5. Now, return all columns of the customers table and the products table.

6. Then, return the dealership_id column from the sales table, but fill in dealership_id in sales with -1 if it is NULL.

7. Add a column called high_savings that returns 1 if the sales amount was 500 lessthan base_msrp or lower. Otherwise, it returns 0.

```sql
SELECT
    c.*,
    p.*,
    COALESCE(s.dealership_id, -1) AS dealership_id,
    CASE
        WHEN s.sales_amount <= (p.base_msrp-500) THEN 1
        ELSE 0
    END AS high_savings
FROM sales s
FULL JOIN customers c ON  c.customer_id = s.customer_id
FULL JOIN products p ON p.product_id = s.product_id
LEFT JOIN dealerships d ON d.dealership_id = s.dealership_id;
```
