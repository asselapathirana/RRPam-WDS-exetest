
$d="$($pwd)\\rrpamwds\\{app}"  
$MyProcess = Start-Process $d\rrpamwds.exe -PassThru -ArgumentList "ga"
& .\screenshot.ps1

