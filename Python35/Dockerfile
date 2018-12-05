FROM microsoft/windowsservercore

ADD RunDsc.ps1 /windows/temp/RunDsc.ps1
ADD RunScript.ps1 /windows/temp/RunScript.ps1

#Run any needed pre configurations
RUN powershell.exe -executionpolicy bypass c:\windows\temp\RunDsc.ps1
#Run Any Extra scripts
RUN powershell.exe -executionpolicy bypass c:\windows\temp\RunScript.ps1

RUN Python.exe --version
RUN git --version