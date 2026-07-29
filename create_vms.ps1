# PowerShell script to provision Enterprise 101 Virtual Machines in VirtualBox
$vboxPath = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

if (-not (Test-Path $vboxPath)) {
    Write-Error "VirtualBox executable not found at $vboxPath. Please ensure VirtualBox installation is complete."
    exit 1
}

Write-Host "Creating NAT Network: project-x-nat..."
& $vboxPath natnetwork add --netname "project-x-nat" --network "10.0.0.0/24" --enable --dhcp on 2>$null

$vmList = @(
    @{ Name = "project-x-dc";           OSType = "Windows2022_64"; CPU = 2; RAM = 4096; VDI = 50GB },
    @{ Name = "project-x-corp-svr";     OSType = "Ubuntu_64";      CPU = 1; RAM = 2048; VDI = 25GB },
    @{ Name = "project-x-sec-box";      OSType = "Ubuntu_64";      CPU = 2; RAM = 4096; VDI = 80GB },
    @{ Name = "project-x-sec-work";     OSType = "Ubuntu_64";      CPU = 1; RAM = 2048; VDI = 55GB },
    @{ Name = "project-x-win-client";   OSType = "Windows11_64";   CPU = 2; RAM = 4096; VDI = 80GB },
    @{ Name = "project-x-linux-client"; OSType = "Ubuntu_64";      CPU = 1; RAM = 2048; VDI = 80GB },
    @{ Name = "project-x-attacker";     OSType = "Debian_64";      CPU = 1; RAM = 2048; VDI = 55GB }
)

$vmDir = "c:\Temp\ProjectIO\VMs"

foreach ($vm in $vmList) {
    Write-Host "Configuring VM: $($vm.Name)..."
    & $vboxPath createvm --name $vm.Name --ostype $vm.OSType --register --basefolder $vmDir 2>$null
    & $vboxPath modifyvm $vm.Name --cpus $vm.CPU --memory $vm.RAM --nic1 natnetwork --natnet1 "project-x-nat"
    
    $vdiPath = Join-Path $vmDir "$($vm.Name)\$($vm.Name).vdi"
    if (-not (Test-Path $vdiPath)) {
        & $vboxPath createmedium disk --filename $vdiPath --size ($vm.VDI / 1MB) --format VDI
        & $vboxPath storagectl $vm.Name --name "SATA Controller" --add sata --controller IntelAhci
        & $vboxPath storageattach $vm.Name --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $vdiPath
    }
}

Write-Host "VM setup script completed successfully."
