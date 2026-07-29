# ProjectIO - Enterprise 101 Homelab Project

This repository hosts the homelab environment setup, Virtual Machine definitions, exercise files, and documentation for **Enterprise 101 - From Initial Access to Breached** by [ProjectSecurity.io](https://docs.projectsecurity.io/).

## Key Guides & Documentation

- 📋 [**`WALKTHROUGH_AND_STEPS.md`**](file:///c:/Temp/ProjectIO/WALKTHROUGH_AND_STEPS.md): Full record of all setup steps, executed commands, resources, external links, network diagram, and VM specs.
- 📘 [**`VM_ISO_MAPPING_GUIDE.md`**](file:///c:/Temp/ProjectIO/VM_ISO_MAPPING_GUIDE.md): ISO mapping guide for `project-x-dc` and all VMs, VirtualBox mounting steps, IP addresses, and login credentials.
- 🗺️ [**`LAB_STRUCTURE.md`**](file:///c:/Temp/ProjectIO/LAB_STRUCTURE.md): Network topology map (`project-x-nat`: `10.0.0.0/24`) and VM hardware specifications.
- 📂 **`docs/`**: Complete PDF guide documents (`1.pdf` – `15.pdf`).
- 🎯 **`exercise-files/`**: Cyber attack simulation exercise files (phishing templates & reverse shells).
- 📜 **`create_vms.ps1`**: VirtualBox CLI automation script.
- 📜 **`mount_all_isos.ps1`**: Automated ISO mounting script.

## VM-to-ISO Quick Reference

| VM Name | Target OS | Mounted ISO Image | Status |
| :--- | :--- | :--- | :---: |
| **`project-x-dc`** | **Windows Server 2025** | `Windows Server 2025.iso` | ✅ **Mounted** |
| **`project-x-win-client`** | **Windows 11 Enterprise** | `Windows 11 Enterprise.iso` | ✅ **Mounted** |
| **`project-x-corp-svr`** | **Ubuntu Server 22.04 LTS** | `ubuntu-22.04-server.iso` | ✅ **Mounted** |
| **`project-x-sec-box`** | **Ubuntu Server (Wazuh SIEM)** | `ubuntu-22.04-server.iso` | ✅ **Mounted** |
| **`project-x-attacker`** | **Kali Linux 2026.2** | `kali-linux-2026.2-installer-amd64.iso` | ✅ **Mounted** |
| **`project-x-linux-client`** | **Ubuntu Desktop 22.04 LTS** | `ubuntu-22.04-desktop.iso` | ✅ **Ready** |
| **`project-x-sec-work`** | **Security Analyst Playground**| `securityonion.iso` / `ubuntu` | ✅ **Ready** |
