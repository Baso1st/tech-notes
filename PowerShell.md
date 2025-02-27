#### When you get the running script is not allowed on this sytem: Run the following command in PowerSheell using admin rights. 
``` set-executionpolicy remotesigned ```

### Free a port
**To know the process using a port**

```netstat -ano | findstr :8080```

The process Id is at the end `TCP    127.0.0.1:10253        0.0.0.0:0              LISTENING       48324`

The process Id is `48324`

**To kill the process**
```taskkill /PID 48324 /F```
