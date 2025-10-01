## Activity 1.03: Querying the Customers Table Using Basic Keywords in a SELECT Query

One day, your manager at ZoomZoom calls you in and tells you that the marketing department has decided that they want to do a series of marketing campaigns to help promote a sale. You will need to send queries to the manager to pull the data. The following are the steps to complete the activity:

1. Open your favorite SQL client and connect to the sqlda database. Examine the schema for the customers table from the schema drop-down list.

2. Write a query that pulls all emails for ZoomZoom customers in the state of Florida in alphabetical order.

```sql
SELECT email
FROM customers
WHERE state = 'FL'
ORDER BY email ASC;
```

3. Write a query that pulls all the first names, last names and email details forZoomZoom customers in New York City in the state of New York. They should be ordered alphabetically, with the last name followed by the first name.

```sql
SELECT first_name, last_name, email
FROM customers
WHERE state = 'NY'
ORDER BY last_name ASC, first_name ASC;
```

4. Write a query that returns all the customers with a phone number ordered by the date the customer was added to the database.

```sql
SELECT *
FROM customers
WHERE phone IS NOT NULL
ORDER BY date_added ASC;
```
