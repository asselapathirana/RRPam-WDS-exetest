
$env:PATH="C:\\projects\\rrpam-wds-exetest\\rrpamwds\\{app}" 
$MyProcess = Start-Process $env:PATH\rrpamwds.exe "dummy" -PassThru
Start-Sleep -s 30 
