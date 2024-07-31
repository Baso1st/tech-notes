# Script to restart Windows Explorer, to fix the issue with windows search not showing up.

# Kill the explorer.exe process
Stop-Process -Name explorer -Force

# Start a new instance of explorer.exe
Start-Process explorer
