# Chapter 1: Introduction to SQL for Analytics

## Updating Tables

### Adding and Removing Columns

```sql
ALTER TABLE table_name
ADD COLUMN column_name data_type;
```

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### Adding New Data

```sql
INSERT INTO table_name (column_1, column_2, …column_last)
VALUES (column_value_1, column_value_2, … column_value_last);
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
