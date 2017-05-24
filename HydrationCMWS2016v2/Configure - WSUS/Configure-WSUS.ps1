<#
Solution: Hydration
Purpose: Used to postinstall configure Windows Update Services 
Version: 1.0 - May 22, 2017

This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the authors or Deployment Artist. 

Author - Sven van Rijen
    Twitter: @svenvanrijen
    Blog   : http://www.svenvanrijen.nl
#>

# Determine where to do the logging 
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
$logPath = $tsenv.Value("LogPath") 
$logFile = "$logPath\$($myInvocation.MyCommand).log" 

# Start the logging 
Start-Transcript $logFile 
Write-Host "Logging to $logFile" 

# Start the postinstall config of WSUS
Set-Location 'C:\Program Files\Update Services\Tools'
.\WsusUtil.exe postinstall SQL_INSTANCE_NAME=WSUS01\SQLExpress Content_Dir=E:\WSUS\

# Stop logging 
Stop-Transcript