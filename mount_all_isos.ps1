# Automated ISO Mounting Script for Enterprise 101 VMs
$vbox = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
$isoDir = "c:\Temp\ProjectIO\ISOs"

$mappings = @(
    @{ VM = "project-x-dc";           ISO = "Windows Server 2025.iso" },
    @{ VM = "project-x-win-client";   ISO = "Windows 11 Enterprise.iso" },
    @{ VM = "project-x-corp-svr";     ISO = "ubuntu-22.04-server.iso" },
    @{ VM = "project-x-sec-box";      ISO = "ubuntu-22.04-server.iso" },
    @{ VM = "project-x-attacker";     ISO = "kali-linux-2026.2-installer-amd64.iso" }
)

foreach ($item in $mappings) {
    $vmName = $item.VM
    $isoPath = Join-Path $isoDir $item.ISO
    
    if (Test-Path $isoPath) {
        Write-Host "Mounting $($item.ISO) to $vmName..."
        & $vbox storagectl $vmName --name "IDE Controller" --add ide 2>$null
        & $vbox storageattach $vmName --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $isoPath
    } else {
        Write-Warning "ISO not found: $isoPath"
    }
}

Write-Host "All Virtual Machines successfully mounted with their corresponding ISOs!"
