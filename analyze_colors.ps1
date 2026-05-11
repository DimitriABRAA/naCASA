Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("C:\Users\Pichau\Desktop\naCASA_deploy\logo.png")
$bmp = new-object System.Drawing.Bitmap($img)
$colors = @{}
for ($x=0; $x -lt $bmp.Width; $x+=5) {
    for ($y=0; $y -lt $bmp.Height; $y+=5) {
        $c = $bmp.GetPixel($x,$y)
        if ($c.A -gt 50) {
            $key = '{0},{1},{2}' -f $c.R, $c.G, $c.B
            $colors[$key]++
        }
    }
}
$img.Dispose()
$bmp.Dispose()
$colors.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 5
