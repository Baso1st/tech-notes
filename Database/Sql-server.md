#### How to find tables with a column name
```sql
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE LOWER(COLUMN_NAME) LIKE '%grade%'
```
-----------------------------------
