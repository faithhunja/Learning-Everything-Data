# Chapter 2: SQL for Data Preparation

## Assembling Data

### Connecting Tables Using JOIN

- When a table A has a column that references the primary key of another table B, the column is said to be a foreign key to table A.
- Foreign keys can also be added as a column constraint to a table in order to improve the integrity of the data by making sure that the foreign key never contains a value that cannot be found in the referenced table. This data property is known as referential integrity.
- The left table is the table mentioned first in the join clause. The right table is the latter one mentioned.

### Types of Joins

![Main types of joins](../Images/Main%20types%20of%20joins.png)

#### Inner Joins

- Inner joins will only return rows from two tables, and only if the join predicate (the primary and foreign key defining the relationship between the two tables) is met for both rows. Otherwise, no rows from either table are returned.

```sql
SELECT {columns}
FROM {table1}
INNER JOIN {table2} ON {table1}.{common_key_1} = {table2}.{common_key_2};
```

- In the query result, by default, the columns will be ordered by those of table1 first, followed by table2 columns.
- The first table mentioned in the query, table1, is on the left-hand side of the result, while table2 is on the right-hand side.

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

- In outer joins, all rows from one of the tables are returned even if they don't meet the join predicate. When the join predicate is not met, the row for the second table will be returned as NULL.
- Outer joins can be classified into three categories:
  - Left outer join/ left join - the left table (the first listed table) will have every row returned. If a row from the right table is not found, a row of NULL is returned.
  - Right outer join/ right join - the right table (the second listed table) will have every row returned. If a row from the left table is not found, a row of NULL is returned.
  - Full outer join/ full join - returns all rows from the left and right tables, regardless of a match.

#### Cross joins

- Also called the Cartesian product.
- Returns every possible combination of rows from the left table and the right table.
- The left and right table can be the same, distinguished by different aliases, allowing you to join a table to itself, also known as a self join.

### Subqueries

- Used when you want to use the tables produced by a SELECT query.
- Can be used by taking a query, inserting it between a pair of parentheses, and inserting it inside another query.
- An alias can be used for the inner query if you want to join the outer query and the results from the inner query. In this case, the alias should be placed after the parentheses.

### Unions

- Joins allow you to join data horizontally - new columns are added horizontally.
- However, unions allow you to put multiple queries together vertically, keeping the same number of columns, but adding multiple rows.

```sql
(
SELECT {column1}, {column2}, {column3}
FROM {table1}
WHERE ...
)
UNION
(
SELECT {column1}, {column2}, {column3}
FROM {table2}
WHERE ...
)
ORDER BY {order1};
```

- Using `UNION` has some caveats:
  - `UNION` requires that the subqueries there have the same name columns and the same data types for the column. If it does not, the query will not run. 
  - `UNION` technically may not return all the rows from its subqueries. By default, `UNION` removes all duplicate rows in the output. If you want to retain the duplicate rows, it is preferable to use the `UNION ALL` keyword.

### Common Table Expressions


## Transforming Data

