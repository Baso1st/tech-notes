- The 100 most interesting tables:TODO

-----------


- Procedure for changing the way optimizer handle the queries.
    - OVDBA.PROC_SESSION_LEGACY_FEATURES



--------------

- Where to get customer info? table **LEVEL3.CUSTOMER**
- Where to get customer's salesperson? table **LEVEL3.CUSTOMER**
- Where to get sales people? table **OVDBA.COR_SALESPERSON**
- Where to get Address info? view **OVDBA.COR_ADDR**
- Where to get info about customers and their addresses? table **OVDBA.OM_CUST_ADDR**

--------------

### Freight Rates
- Function **LEVEL3.FUNC_TMS_ROUTING_RATE** gets freight rate from views that pull from the table **TMS_CITY_OVERRIDE_RATE** using vehicle group id from the table **LEVEL3.VEHICLE_GROUP**
- Table **FREIGHT_CITY_RATE** is used for rail rates only and all the truck rates in it is invalid and not being used. 
- **Distrip service 446** is the service that updates the orders that don't have freight when a freight rate is added. It runs every 15 minutes. 
- When a freight rate is missing, the post-departure process will fail for that (vehicle, city, state). Find out the vehicle group and the city/state, send them to Mandy and Fawn and they will update it in Freight City Override. Once they add it, we can re-queue it back in Document delivery. 



-------------------------------



Oracle Client is downloaded from oracle website. You must have an account to download it, Oracle 12.2 and above compatible with visual studio 2017 and they have visual studio tools with them. Visual studio tools needed to create a connection to our databases in visual studio server explorer and be able to use it with Entity Framework. You only need to install **ODTwithODAC122011.zip** it has everything needed. 


-----------------------------------------


## VW_ITEM_DETAILS

- **VW_ITEM_DETAILS.SHIPPED_TONS**: Are the tons from SL_BOL_LINE_ITEM that have a "shipped" status,(confirmed are not included) and are not returned. 
- **VW_ITEM_DETAILS.PLANNED_LBS**: Are the tons from SL_LOAD for that line that are in any status except "Shipped"




