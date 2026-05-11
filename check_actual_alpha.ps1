Add-Type -AssemblyName System.Drawing
$files = Get-ChildItem -Path "C:\Users\Pichau\Desktop\naCASA\DNA brand" -Filter *.png
foreach ($f in $files) {
    try {
        $img = [System.Drawing.Image]::FromFile($f.FullName)
        $bmp = new-object System.Drawing.Bitmap($img)
        $transparentCount = 0
        for ($x=0; $x -lt $bmp.Width; $x+=10) {
            for ($y=0; $y -lt $bmp.Height; $y+=10) {
                $c = $bmp.GetPixel($x,$y)
                if ($c.A -lt 250) {
                    $transparentCount++
                }
            }
        }
        Write-Host "$($f.Name) - Transparent: $transparentCount"
        $img.Dispose()
        $bmp.Dispose()
    } catch {
        Write-Host "Error with $($f.Name)"
    }
}
