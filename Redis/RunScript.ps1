$ErrorActionPreference = 'Stop'
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Method Get -Uri https://github.com/MSOpenTech/redis/releases/download/win-2.8.2400/Redis-x64-2.8.2400.zip -OutFile c:\redis.zip
Expand-Archive -Path c:\redis.zip -DestinationPath c:\redis
Remove-Item c:\redis.zip -Force