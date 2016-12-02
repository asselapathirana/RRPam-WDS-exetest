
$env:PATH="$($pwd)\\rrpamwds\\{app}"  
$MyProcess = Start-Process $env:PATH\rrpamwds.exe -PassThru -ArgumentList "ga"
& .\screenshot.ps1

