FROM microsoft/microsoft/windowsservercore

LABEL Description="Redis server"

#Run any needed pre configurations
RUN powershell.exe -executionpolicy bypass c:\windows\temp\RunDsc.ps1
#Run Any Extra scripts
RUN powershell.exe -executionpolicy bypass c:\windows\temp\RunScript.ps1

WORKDIR /redis

CMD redis-server.exe