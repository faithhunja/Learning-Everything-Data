## Activity 1.04: Creating and Modifying Tables for Marketing Operations

In this activity, you will test your ability to create and modify tables using SQL. You did a great job of pulling data for the marketing team. However, the marketing manager, who you helped, realized that they had made a mistake. It turns out that instead of just the query, the manager needs to create a new table in the company's analytics database. Furthermore, they need to make some changes to the data that is present in the customers table. It is your job to help the marketing manager with the table:

1. Create a new table called customers_nyc that pulls all the rows from the customers table where the customer lives in New York City in the state of New York.

```sql
CREATE TABLE customers_nyc AS (
SELECT *
FROM customers
WHERE city = 'New York City' AND state = 'NY'
);
```

2. Delete all customers in postal code 10014 from the new table. Due to local laws, they will not be eligible for marketing.

```sql
DELETE FROM customers_nyc
WHERE postal_code = '10014';
```

3. Add a new text column called event.

```sql
ALTER TABLE customers_nyc
ADD COLUMN event text;
```

4. Set the value of the event column to thank-you party.

```sql
UPDATE customers_nyc
SET event = 'thank-you party';
```

5. You've told the manager you've completed these steps. He tells the marketing operations team, who then uses the data to launch a marketing campaign. The marketing manager thanks you and then asks you to delete the customers_nyc table.

```sql
DROP TABLE customers_nyc;
```
