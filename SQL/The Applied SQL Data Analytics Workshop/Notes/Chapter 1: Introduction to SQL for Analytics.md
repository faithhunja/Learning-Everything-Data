# Chapter 1: Introduction to SQL for Analytics

## Relational Databases and SQL

- Tables are usually referred to in queries in the format `[schema].[table]`. For example, a products table in the analytics schema would be generally referred to as `analytics.product`.
- However, there is also a special schema called the public schema. This is a default schema where, if you do not explicitly mention a schema, then the database uses the public schema; for example, the `public.products` table and the `products` table are the same.

## Basic Data Types of SQL

- Numeric - represents numbers. It includes integer, bigint, decimal, numeric, real, serial, etc.
- Character - stores text information. It includes varchar, char, text.
- Boolean - represents True or False. Accepted values for True include: t, true, y, yes, on, 1, and vice versa for False. Booleans can also take NULL values.
- Datetime - stores time-based information, like dates and times.
- Data structures - supported ones include JSON and arrays.

## Reading Tables: The SELECT Query

The steps of a SELECT query are as follows:

1. Create a data source by taking one or more tables and combining them together into one large table.
2. Filter the table based on the large data source created in Step 1 by seeing which rows meet the WHERE clause.
3. Calculate values based on columns in the data source in Step 1. If there is a GROUP BY clause, divide the rows into groups and then calculate an aggregate statistic for each group. Otherwise, return a column or value that has been calculated by performing functions on one or more columns together.
4. Take the rows returned and format them by sorting and limiting the data, often using ORDER BY then LIMIT.

### Basic Keywords in a SELECT Query

- The SELECT and FROM statements.
- The WHERE clause - limits the amount of data returned; usually found after the FROM clause of a single SELECT statement.
- The AND/OR clause - checks if multiple conditions have been met at once.
- The IN/NOT IN clause - returns all the values that are/are not in a list of values.
- The ORDER BY clause - specifies an order sequence for rows returned. It is ascending order by default. You can order by multiple columns.
- The LIMIT clause - limits the number of rows returned.
- The IS NULL/IS NOT NULL clause - finds rows where data is not filled/is filled for a certain column.

## Creating Tables

### Creating Blank Tables

```sql
CREATE TABLE {table_name} (
{column_name_1} {data_type_1} {column_constraint_1},
{column_name_2} {data_type_2} {column_constraint_2},
{column_name_3} {data_type_3} {column_constraint_3},
   
{column_name_last} {data_type_last} {column_constraint_last},
);
```

- The column constraint is one or more optional keywords giving special properties to the column. It includes NOT NULL, UNIQUE and PRIMARY KEY.

### Creating Tables with SELECT

- Used to create a table using data from an existing table.

```sql
CREATE TABLE {table_name} AS (
{select_query}
);
```

## Updating Tables

### Adding Columns

```sql
ALTER TABLE {table_name}
ADD COLUMN {column_name} {data_type};
```

### Removing Columns

```sql
ALTER TABLE {table_name}
DROP COLUMN {column_name};
```

### Adding New Data

```sql
INSERT INTO {table_name} ({column_1], {column_2}, …{column_last})
VALUES ({column_value_1}, {column_value_2}, … {column_value_last});
```

- Using the INSERT statement with a SELECT query:

```sql
INSERT INTO {table_name} ({column_1], {column_2}, …{column_last})
{select_query};
```

### Updating Existing Rows

```sql
UPDATE {table_name}
SET {column_1} = {column_value_1},
    {column_2} = {column_value_2},
    ...
    {column_last} = {{column_value_last}}
WHERE
{conditional};
```

### Deleting Data and Tables

#### Deleting Values from a Row

```sql
UPDATE {table_name}
SET {column_1} = NULL,
    {column_2} = NULL,
    ...
    {column_last} = NULL
WHERE
{conditional};
```

#### Deleting Rows from a Table

```sql
DELETE FROM {table_name}
WHERE {conditional};
```

- To delete all the data in a table without deleting the table:

```sql
DELETE FROM {table_name};
```

- or:

```sql
TRUNCATE TABLE {table_name};
```

#### Deleting Tables

```sql
DROP TABLE {table_name};
```
