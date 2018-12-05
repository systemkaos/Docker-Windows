Configuration BoilerPlate 
{ 
    param ($MachineName)

    Node $MachineName
    { 
        
    } 
} 

BoilerPlate -MachineName localhost
Start-DscConfiguration -Path .\BoilerPlate -Wait -Verbose
