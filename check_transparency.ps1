Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("C:\Users\Pichau\.gemini\antigravity\brain\10298fb4-78e9-4c34-ab07-d06ee7585c3b\.tempmediaStorage\media_10298fb4-78e9-4c34-ab07-d06ee7585c3b_1778087326880.png")
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
Write-Host "Transparent pixels (sampled): $transparentCount"
$img.Dispose()
$bmp.Dispose()
