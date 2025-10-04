# Chapter 2: SQL for Data Preparation

## Assembling Data

### Connecting Tables Using JOIN

- When a table A has a column that references the primary key of another table B, the column is said to be a foreign key to table A.
- Foreign keys can also be added as a column constraint to a table in order to improve the integrity of the data by making sure that the foreign key never contains a value that cannot be found in the referenced table. This data property is known as referential integrity.

### Types of Joins

![Main types of joins](../Images/Main%20types%20of%20joins.png)

#### Inner Joins

```sql
SELECT {columns}
FROM {table1}
INNER JOIN {table2} ON {table1}.{common_key_1} = {table2}.{common_key_2};
```

- In the query result, by default, the columns will be ordered by those of table1 first, followed by table2 columns.
- The first table listed in the query, table1, is on the left-hand side of the result, while table2 is on the right-hand side.

- To only retrieve the table1 portion of the query above, we can select table1 columns using the following star syntax:

```sql
SELECT {table1}.*
FROM {table1}
INNER JOIN {table2} ON {table1}.{common_key_1} = {table2}.{common_key_2};
```

- Instead of typing out the entire name of the table every time, an alias can be used to represent the table name.
- The name of the alias should be indicated after the first mention of the tables:

```sql
SELECT {t1}.*
FROM {table1} {t1}
INNER JOIN {table2} {t2} ON {t1}.{common_key_1} = {t2}.{common_key_2};
```

- Alternatively, you could also put the AS keyword between the table name and alias to make the alias more explicit:

```sql
SELECT {t1}.*
FROM {table1} AS {t1}
INNER JOIN {table2} AS {t2} ON {t1}.{common_key_1} = {t2}.{common_key_2};
```

#### Outer Joins



## Transforming Data
