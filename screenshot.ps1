[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.Screen]::PrimaryScreen
$SCREENWIDTH = [int]$screen.bounds.Size.Width
$SCREENHEIGHT = [int]$screen.bounds.Size.Height
$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, $SCREENWIDTH, $SCREENHEIGHT)
$timeout = new-timespan -Minutes 2
$sw = [diagnostics.stopwatch]::StartNew()
while ($sw.elapsed -lt $timeout){
   $n = $sw.elapsed -replace '\:','_'
    echo "$($pwd)\screenshot-$($n).png" 
    screenshot $bounds "$($pwd)\screenshot-$($n).png"
    start-sleep -seconds 5
}
 
write-host "Timed out"