# Enterprise 101 - Virtual Machine ISO & Setup Guide

This guide details which ISO file to use for **`project-x-dc`** and every other virtual machine in the **ProjectSecurity.io Enterprise 101** homelab, including download links, VirtualBox mounting steps, and initial setup credentials.

---

## 1. Complete VM-to-ISO Mapping Table

| VM Name | Target OS | Recommended ISO Image File | Source / Download Link | Current Status |
| :--- | :--- | :--- | :--- | :--- |
| **`project-x-dc`** | **Windows Server 2022 / 2025** | `Windows_Server_2022_Eval.iso` | [Microsoft Eval Center](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2022) or [Sync.com Repository](https://ln5.sync.com/dl/831828380#cbtjtrs7-yhmjd4ad-yaxm6hka-x97b3ug7) | ⏳ Download ISO & attach |
| **`project-x-corp-svr`** | **Ubuntu Server 22.04 LTS** | `ubuntu-22.04-server.iso` | Pre-downloaded in `c:\Temp\ProjectIO\ISOs` | ✅ **Mounted & Ready** |
| **`project-x-sec-box`** | **Ubuntu Server (Wazuh SIEM)**| `ubuntu-22.04-server.iso` | Pre-downloaded in `c:\Temp\ProjectIO\ISOs` | ✅ **Mounted & Ready** |
| **`project-x-win-client`** | **Windows 11 / 10 Enterprise** | `Windows_11_Enterprise_Eval.iso` | [Microsoft Eval Center](https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise) or [Sync.com Repository](https://ln5.sync.com/dl/831828380#cbtjtrs7-yhmjd4ad-yaxm6hka-x97b3ug7) | ⏳ Download ISO & attach |
| **`project-x-linux-client`** | **Ubuntu Desktop 22.04 LTS** | `ubuntu-22.04-desktop.iso` | Pre-downloaded or [Ubuntu Releases](https://releases.ubuntu.com/jammy/) | ⏳ Attach to optical drive |
| **`project-x-sec-work`** | **Security Onion / Ubuntu** | `securityonion.iso` or `ubuntu-22.04-desktop.iso` | [Security Onion](https://securityonionsolutions.com/software) or Ubuntu Desktop | ⏳ Attach to optical drive |
| **`project-x-attacker`** | **Kali Linux 2024 / 2026** | `kali-linux-2026.2-installer-amd64.iso` | Pre-downloaded in `c:\Temp\ProjectIO\ISOs` (4.8 GB) | ✅ **Mounted & Ready** |

---

## 2. Step-by-Step: How to Attach an ISO in VirtualBox

If an ISO is not yet attached to a VM, follow these 4 simple steps in VirtualBox:

1. Open **Oracle VirtualBox**.
2. Select the Virtual Machine (e.g. **`project-x-dc`**) from the left sidebar and click **Settings** (Gear Icon).
3. Go to **Storage** tab on the left:
   - Under **Storage Devices**, click on the **Empty** CD/DVD drive (Optical Drive).
   - On the right side, click the **CD Icon** next to *Optical Drive*, select **Choose a disk file...**.
   - Browse to `c:\Temp\ProjectIO\ISOs` and select your downloaded ISO file.
4. Click **OK**, then click **Start** (Green Arrow) to boot the VM and start installation!

---

## 3. Network & Login Credentials Reference

Once booted, configure each machine with these settings according to course guide `1.pdf`:

### Network Adapter
- **Adapter 1**: NAT Network -> **`project-x-nat`** (10.0.0.0/24)

### Host Credentials & IP Addresses

- **`project-x-dc` (Domain Controller)**
  - IP: `10.0.0.5`
  - Subnet: `255.255.255.0` | Gateway: `10.0.0.1` | DNS: `127.0.0.1`
  - Admin User: `Administrator`
  - Password: `@Deeboodah1!`

- **`project-x-corp-svr` (Corporate Server)**
  - IP: `10.0.0.8`
  - User: `project-x-admin`
  - Password: `@password123!`

- **`project-x-sec-box` (SIEM Security Server)**
  - IP: `10.0.0.10`
  - User: `sec-work`
  - Password: `@password123!`

- **`project-x-win-client` (Windows Client)**
  - IP: Dynamic (`10.0.0.100`)
  - User: `johnd@corp.project-x-dc.com`
  - Password: `@password123!`

- **`project-x-linux-client` (Linux Client)**
  - IP: Dynamic (`10.0.0.101`)
  - User: `janed@linux-client`
  - Password: `@password123!`

- **`project-x-attacker` (Kali Attacker)**
  - IP: Dynamic
  - User: `attacker`
  - Password: `attacker`
