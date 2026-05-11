$files = Get-ChildItem -Path "C:\Users\Pichau\.gemini\antigravity\brain\10298fb4-78e9-4c34-ab07-d06ee7585c3b\.tempmediaStorage" -Filter *.png | Sort-Object LastWriteTime -Descending
$latest = $files[0]
Copy-Item -Path $latest.FullName -Destination "C:\Users\Pichau\Desktop\naCASA_deploy\logo.png" -Force
Write-Host "Copied $($latest.FullName) to logo.png"
