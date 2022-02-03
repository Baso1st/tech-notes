- When adding a view to EF it should have a primary key otherwise EF will show a warning for not having a PK. If no PK and all the columns of the view are nullable then the view will not be added to EF.

- When it comes to streams in C#. **FileStream** can be used to read/write to files, but **StreamWriter** and **StreamReader** are easer to work with because it will do the conversion from/to bytearray automatically. A better option than both of them will be the **File** class. To work with files asynchronously then **FileStream** is the only option. 



----------------------------------------

#### Entity Framework Cache Busting

https://codethug.com/2016/02/19/Entity-Framework-Cache-Busting/

----------------------

Log linq query: 

According to James, Add this line of code on top of the LINQ query 

_dbModel.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);

---------------------------------------------------------

#### Write to the output window during debugging

```c#
System.Diagnostics.Debug.WriteLine("The Text");
```

