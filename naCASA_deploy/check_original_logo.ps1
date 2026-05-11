Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("C:\Users\Pichau\Downloads\Design sem nome (1) (1).png")
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
Write-Host "Design sem nome (1) (1).png - Transparent pixels: $transparentCount"
$img.Dispose()
$bmp.Dispose()
