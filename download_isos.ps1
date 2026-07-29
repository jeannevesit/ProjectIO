# ISO Download Helper Script for Enterprise 101 Homelab
$isoDir = "c:\Temp\ProjectIO\ISOs"
if (-not (Test-Path $isoDir)) { New-Item -ItemType Directory -Path $isoDir -Force }

$downloads = @{
    "ubuntu-22.04-server.iso"  = "https://releases.ubuntu.com/jammy/ubuntu-22.04.5-live-server-amd64.iso";
    "ubuntu-22.04-desktop.iso" = "https://releases.ubuntu.com/jammy/ubuntu-22.04.5-desktop-amd64.iso";
    "kali-linux-installer.iso" = "https://cdimage.kali.org/kali-2024.2/kali-linux-2024.2-installer-amd64.iso"
}

foreach ($name in $downloads.Keys) {
    $targetPath = Join-Path $isoDir $name
    if (-not (Test-Path $targetPath)) {
        Write-Host "Downloading $name..."
        Invoke-WebRequest -Uri $downloads[$name] -OutFile $targetPath
    } else {
        Write-Host "$name already exists in ISOs folder."
    }
}
Write-Host "ISO download process complete."
