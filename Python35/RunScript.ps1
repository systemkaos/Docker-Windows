#NOTE: Allows us to download via HTTPS

function Secure-Webrequest {
    [CmdletBinding()]
    param (
        $uri,
        $OutFile
    )
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $uri -OutFile $OutFile -ErrorAction $ErrorActionPreference
}
function Get-Python {
    [CmdletBinding()]
    param (
        $Version
    )

    process {
        
        $ErrorActionPreference = 'Stop'
        $url = 'http://www.python.org/ftp/python/'+$Version+'/python-'+$Version+'.exe'
        $OutFile = 'python-'+$Version+'.exe'

        Secure-Webrequest -uri $url -OutFile $OutFile

    }

}

Function Get-Git{
    process {
        #TODO: Not so hard coded
        $url = 'https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/Git-2.19.1-64-bit.exe'
        $OutFile = 'Git-2.19.1-64-bit.exe'
        Secure-Webrequest -uri $url -OutFile $OutFile
    }
}

$PythonVersion = "3.5.1"
$pythonExe = ('python-'+$PythonVersion+'.exe')

Get-Python -Version $PythonVersion -Verbose
Get-Git

Start-Process $pythonExe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait
Start-Process 'Git-2.19.1-64-bit.exe' -ArgumentList '/SP /VERYSILENT /SUPPRESSMSGBOXES /NOICONS' -Wait

Remove-Item $pythonExe -Force -Verbose
Remove-Item 'Git-2.19.1-64-bit.exe' -Force -Verbose