### Find which process is using a specific port using CMD

```powershell
 netstat -aon | findstr 8080 
```
 To find which TCP process is using the port 
 
 ```powershell
 Get-Process -Id (Get-NetTCPConnection -LocalPort YourPortNumberHere).OwningProcess
 ```
