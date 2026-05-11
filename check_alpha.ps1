Add-Type -AssemblyName System.Drawing
$files = Get-ChildItem -Path "C:\Users\Pichau\Desktop\naCASA\DNA brand" -Filter *.png
foreach ($f in $files) {
    $img = [System.Drawing.Image]::FromFile($f.FullName)
    $hasAlpha = [System.Drawing.Image]::IsAlphaPixelFormat($img.PixelFormat)
    Write-Host "$($f.Name) - Alpha: $hasAlpha - Width: $($img.Width) - Height: $($img.Height)"
    $img.Dispose()
}
