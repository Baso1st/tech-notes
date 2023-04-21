#### Search a blob 

```sql
select *
  from CRM.EDI_LOG
 where dbms_lob.instr (CONTENT, -- the blob
                   utl_raw.cast_to_raw ('B24131W371400'), -- the search string cast to raw
                   1, -- where to start. i.e. offset
                   1 -- Which occurrance i.e. 1=first
                    ) > 0 -- location of occurrence. Here I don't care.  Just find any
AND DOC_ID = 90;
```

-----------------------------------------

#### CURSOR SYNTAX 

```plsql
DECLARE 

CURSOR GROUPED IS
SELECT ITEM.ORDER_ID, ITEM.LOADING_GROUP
FROM CRM.SALES_ITEM ITEM 
WHERE ITEM.LOADING_GROUP > 0
GROUP BY ITEM.ORDER_ID, ITEM.LOADING_GROUP;

GROUPED_ROW GROUPED%ROWTYPE;

GROUP_ID NUMBER := 0;

BEGIN 

OPEN GROUPED;

LOOP 
FETCH GROUPED INTO GROUPED_ROW; 
EXIT WHEN GROUPED%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( 'ORDER ID: ' || GROUPED_ROW.ORDER_ID);
    INSERT INTO CRM.LOADING_GROUP_HEADER COLUMNS(CREATED_BY) VALUES(1274);
    
END LOOP;
CLOSE GROUPED;    
END;
```



#####  You can also create a cursor without open, close and fetch. Just using a for loop 

```sql
FOR record IN cursor_name
LOOP
    process_record_statements;
END LOOP;
```



##### You can even do it without a cursor

```sql
FOR record IN (select_statement)
LOOP
    process_record_statements;
END LOOP;
```



##### This query is just to show how to create a dynamic table and loop through it. 

```sql
FOR record IN (
    SELECT *
    FROM TABLE(
        SYS.ODCIVARCHAR2LIST(
            'S364981.01'
        )
    )
)
LOOP
END LOOP;
```





---------------------



#### Creating a table with primary and foreign keys 

```plsql
CREATE TABLE CRM.SALES_ITEM_BUCKET 
(
    ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ITEM_ID NUMBER,
    BUCKET_ID NUMBER,
    QUANTITY NUMBER,
    CONSTRAINT SALES_ITEM_BUCKET_FK1 FOREIGN KEY (ITEM_ID) REFERENCES CRM.SALES_ITEM(ID),
    CONSTRAINT SALES_ITEM_BUCKET_FK2 FOREIGN KEY (BUCKET_ID) REFERENCES OVDBA.PM_BCKT(ID)
);
```

#### Drop a column from a table 

```plsql
ALTER TABLE CRM.SALES_ITEM 
SET UNUSED (LOADING_GROUP, COLUMN2);

ALTER TABLE CRM.SALES_ITEM 
DROP UNUSED COLUMNS;
```



#### Add new Column to existing table

```plsql
ALTER TABLE CRM.ITEM_EQUALIZED_FREIGHT
ADD EXPIRED NUMBER(1) DEFAULT 0 NOT NULL;
```

-------------------------------------



#### Calling a procedure from within a function

To call a procedure from within a function you need to add the following, right after the Is or As of the function (before the variable declaration)

```sql
pragma autonomous_transaction;
```

-----------------------



#### DBMS_OUTPUT

To output anything you have to right it between begin and end block;

```sql
BEGIN
	DBMS_OUTPUT.PUT_LINE('Under the sales order section');
END;
```

You can also execute a procedure the same way. 

```sql
BEGIN
   OVDBA.PROC_SEND_DB_EMAIL('',NULL,'REQUIRED BUNDLE LOST TARP','TARP',NULL,1);
END;
```

---------------------------------------

#### Search all objects in oracle for a specific string 

```sql
 SELECT * FROM DBA_source WHERE UPPER(text) LIKE '%UNPROCESSED%';
```



------------------------------

#### Grant privilege 

```sql
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON CRM.SALES_AUDIT_SESSION TO CODEREF WITH GRANT OPTION;
GRANT ALL ON CRM.SALES_AUDIT_SESSION TO CODEREF WITH GRANT OPTION;
GRANT ALL ON CRM.SALES_AUDIT_SESSION TO CODEREF, GEN_APP_USER WITH GRANT OPTION;
```

- An interesting note about OVDBA privilege: If you create a table using OVDBA in another schema, then try to reference that table OVDBA won't have privilege to do so, and can't grant privilege to itself either. The solution in this case is to grant all to GEN_APP_USER on the table then login using GEN_APP_USER and grant all to OVDBA on the same table. 

-----------------------------------------------------------------------

##### Query to get the table size in GB

```sql
select
  owner as "Schema"
  , segment_name as "Object Name"
  , segment_type as "Object Type"
  , round(bytes/1024/1024/1024,2) as "Object Size (Gb)"
  , tablespace_name as "Tablespace"
from dba_segments
WHERE owner = 'CRM'
order by round(bytes/1024/1024/1024,2) desc;
```

-----------------------------------------------------------------------------------------



#### Insert into a table from another table

```sql
INSERT INTO table2
SELECT * FROM table1
WHERE condition;
```

```sql
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;
```

---------------------------------------



#### Create a table from another table 

```sql
CREATE TABLE new_table
  AS (SELECT * FROM old_table);
```

