#### One Vision access and sales hold

```sql
DELETE FROM OTK_UA_WINDOW WHERE C_USER_ID = 'MUHAMMADABDULWANIS';
INSERT INTO OTK_UA_WINDOW ( C_TERM_LOC, C_WINDOW_ID, C_USER_ID, L_OK_TO_CRE, L_OK_TO_READ, L_OK_TO_UPD, L_OK_TO_DEL, L_OK_TO_EXE )(
                            SELECT
                                DISTINCT
                                'LT01',
                                C_WINDOW_ID,
                                'MUHAMMADABDULWANIS',
                                1,
                                1,
                                1,
                                1,
                                1
                            FROM
                                OTK_WINDOW_ATTR
                        );

DELETE FROM SALES_ORDER_HOLDS_SECURITY 
WHERE EMP_ID = 1274;

Insert into SALES_ORDER_HOLDS_SECURITY
   (STATION_ID, CODE_TYPE, CODE_ID, EMP_ID, ALLOWED_CLOSE_CANCEL)
 Values
   ('OTK', 'SALES_HOLD', 'SALES', 1274, 1);
COMMIT;
                         
```


​                         

----------------------------

#### Lance's queries to return material for shipped BOLs.



```sql
select * from pm_item
 where C_ITEM_ID IN ( select c_item_id
                        from sl_bol_line_item
                       where c_bol_id in ( '0000637725' ));   
   
select * from SL_BOL_LINE_ITEM
 where c_bol_id in ( '0000637725' );       
 
select * from SL_BOL_LINE_ITEM_SECTION
 where c_bol_id in ( '0000637725' );   
 
UPDATE SL_BOL_LINE_ITEM
   SET L_RETURNED = 1,
       C_RETURN_USER_ID = 'LTILLMAN',
       q_return_date = sysdate
 where c_bol_id in ( '0000637725' );    
   
UPDATE SL_BOL_LINE_ITEM_SECTION
   SET L_RETURNED = 1,
       C_RETURN_USER_ID = 'LTILLMAN',
       q_return_date = sysdate
 where c_bol_id in ( '0000637725' );   

update pm_item
   SET C_SITE_ID = 'STLD - CCI',
       C_WH_ID = 'BLM YARD',
       C_WH_AREA_ID = '007',
       C_X_POS = '01',
       C_Y_POS = '01',
       C_Z_POS = '01',
       C_MAT_STATUS_CODE = 'AVAIL',
       C_NOTES = CASE WHEN C_NOTES IS NULL THEN 
                        'SHIPPED ON 0000637725 - LET'
                      WHEN LTRIM(RTRIM(C_NOTES)) = '' THEN
                        'SHIPPED ON 0000637725 - LET'
                 ELSE
                    c_notes || ', SHIPPED ON 0000637725 - LET'
                 END 
 where C_ITEM_ID IN ( select c_item_id
                        from sl_bol_line_item
                       where c_bol_id in ( '0000637725' ));   
                         
SELECT * FROM PM_ITEM_STOCK
 WHERE c_item_id in ( select c_item_id
                        from sl_bol_line_item
                       where c_bol_id in ( '0000637725' ));    
                          
SELECT * FROM PM_SECTION_STOCK
 WHERE c_item_id in ( select c_item_id
                        from sl_bol_line_item
                       where c_bol_id in ( '0000637725' ));
```

------------------------------------------------------------------------------------------



#### Query to find the running distrep



```sql
SELECT E.DISTREP_ID, R.TITLE REPORT_TITLE, P.*
  FROM LEVEL3.L3_SCHEDULE_EVENT_PROP  P
       JOIN LEVEL3.L3_SCHEDULE_EVENT E ON P.EVENT_ID = E.SCHEDULE_EVENT_ID
       JOIN LEVEL3.REPORT R ON R.REPORT_ID = E.DISTREP_ID
 WHERE P.RUNNING = 1 AND P.ENABLED = 1
 ORDER BY P.LAST_RUN_TIME DESC
```

