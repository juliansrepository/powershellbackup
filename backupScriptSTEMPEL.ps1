$locations = @("Documents", "Desktop", "Downloads", "Pictures") 
#Bookmarks for chrome, firefox, safari 
$ListUsr = Read-Host "This script requires the username parameter, type yes or y to have them all displayed. Otherwise press any key"
if ($ListUsr -eq "yes" -OR $ListUsr -eq "y") {    
    Get-ChildItem -Path c:\Users\
}
$UserName = Read-Host "Please type the username you wish to back up"
Write-Host "****** Starting backup script ******"
foreach ($location in $locations) {
    if (!(Test-Path -path \\phitsrv.ad.fiu.edu\Backup\$UserName.$(get-date -f yyyy-MM-dd)\$location)) { ## Check if destination exists, if no create folder
        New-Item \\phitsrv.ad.fiu.edu\Backup\$UserName.$(get-date -f yyyy-MM-dd)\$location -type directory
    }
    robocopy $env:HOMEDRIVE\Users\$UserName\$location \\phitsrv.ad.fiu.edu\Backup\$UserName.$(get-date -f yyyy-MM-dd)\$location /S /R:3
}