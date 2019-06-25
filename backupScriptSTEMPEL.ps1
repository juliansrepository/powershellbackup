$locations = @("Documents","Desktop","Downloads","Pictures") 
#Bookmarks for chrome, firefox, safari 
$ListUsr=Read-Host "This script requires the username parameter, type yes or y to have them all displayed. Otherwise press any key"
  if ($ListUsr -eq "yes" –OR $ListUsr –eq "y"){    
    Get-ChildItem -Path c:\Users\
}
$UserName=Read-Host "Please type the username you wish to back up"

foreach ($location in $locations){
   if (!(Test-Path -path \\phitsrv.ad.fiu.edu\Backup\$UserName\$location))  ## Check if destination exists, if no create folder
 {
 New-Item \\phitsrv.ad.fiu.edu\Backup\$UserName\$location -type directory
 }
 robocopy $env:HOMEDRIVE\Users\$UserName\$location \\phitsrv.ad.fiu.edu\Backup\$UserName\$location /S /R:3
}
## make array with desktop,documents,downloads. Then iterate through it using a loop.

##Todo: 1) create folder with time stamp 2) Bookmarks for chrome, firefox, safari