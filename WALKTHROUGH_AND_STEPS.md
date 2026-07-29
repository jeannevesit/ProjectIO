# Enterprise 101 Homelab - Execution Steps, Links & Setup Documentation

This document records all setup steps, network architecture configurations, Virtual Machine specifications, external links, and provisioning commands executed to build the **ProjectSecurity.io Enterprise 101 Homelab** inside `c:\Temp\ProjectIO`.

---

## 1. Network Topology & IP Allocation

All virtual machines operate in an isolated VirtualBox NAT Network named **`project-x-nat`**.

- **Network Subnet**: `10.0.0.0/24`
- **Gateway**: `10.0.0.1`
- **DHCP Dynamic Range**: `10.0.0.100` - `10.0.0.200`

```
                                +-----------------------------+
                                |  Directory Services Server  |
                                |  (project-x-dc: 10.0.0.5)   |
                                +--------------+--------------+
                                               |
                                     [ project-x-nat ]
                                      (10.0.0.0/24 NAT)
                                               |
        +-------------------------+------------+------------+-------------------------+
        |                         |                         |                         |
+-------+---------------+ +-------+---------------+ +-------+---------------+ +-------+---------------+
| Corporate Server      | | Security Server (SIEM)| | Workstations          | | Attacker Environment  |
| (project-x-corp-svr)  | | (project-x-sec-box)   | | (Win/Linux/Sec-Work)  | | (project-x-attacker)  |
| IP: 10.0.0.8          | | IP: 10.0.0.10         | | IP: Dynamic / 10.0.0.x| | IP: Dynamic           |
+-----------------------+ +-----------------------+ +-----------------------+ +-----------------------+
```

---

## 2. Virtual Machine & ISO Reference

| VM Name | Purpose / Role | Allocated Resources | Static/Dynamic IP | Credentials | Mounted ISO Image |
| :--- | :--- | :---: | :--- | :--- | :--- |
| **`project-x-dc`** | Active Directory Domain Controller | 4 GB RAM / 2 vCPU / 50 GB | Static: `10.0.0.5` | `Administrator` : `@Deeboodah1!` | `Windows Server 2025.iso` |
| **`project-x-win-client`** | Windows Enterprise Workstation | 4 GB RAM / 2 vCPU / 80 GB | Dynamic (`10.0.0.100`)| `johnd` : `@password123!` | `Windows 11 Enterprise.iso` |
| **`project-x-corp-svr`** | Ubuntu Corporate Server | 2 GB RAM / 1 vCPU / 25 GB | Static: `10.0.0.8` | `project-x-admin` : `@password123!` | `ubuntu-22.04-server.iso` |
| **`project-x-sec-box`** | Wazuh SIEM Security Box | 4 GB RAM / 2 vCPU / 80 GB | Static: `10.0.0.10` | `sec-work` : `@password123!` | `ubuntu-22.04-server.iso` |
| **`project-x-attacker`** | Kali Linux Pentesting Host | 2 GB RAM / 1 vCPU / 55 GB | Dynamic | `attacker` : `attacker` | `kali-linux-2026.2-installer-amd64.iso` |
| **`project-x-linux-client`**| Linux Desktop Workstation | 2 GB RAM / 1 vCPU / 80 GB | Dynamic (`10.0.0.101`)| `janed` : `@password123!` | `ubuntu-22.04-desktop.iso` |
| **`project-x-sec-work`** | Security Analyst Playground | 2 GB RAM / 1 vCPU / 55 GB | Dynamic (`10.0.0.103`)| `project-x-sec-work` : `@password123!`| `securityonion.iso` |

---

## 3. Important Project Links & Resources

- 🌐 **Project Security Docs Portal**: [https://docs.projectsecurity.io/](https://docs.projectsecurity.io/)
- 🌐 **Project Security Course Player**: [https://learn.projectsecurity.io/courses/b0fdf91e-1cd0-438f-9443-97e7f6bc5f3e/take](https://learn.projectsecurity.io/courses/b0fdf91e-1cd0-438f-9443-97e7f6bc5f3e/take)
- 📁 **Course Author Pre-Bundled ISO Mirror (Sync.com)**: [https://ln5.sync.com/dl/831828380#cbtjtrs7-yhmjd4ad-yaxm6hka-x97b3ug7](https://ln5.sync.com/dl/831828380#cbtjtrs7-yhmjd4ad-yaxm6hka-x97b3ug7)
- 🎯 **Attack Exercise Files Repository**: [https://github.com/collinsmc23/projectsecurity-e101](https://github.com/collinsmc23/projectsecurity-e101)
- 🐙 **Student GitHub Repository**: [https://github.com/jeannevesit/ProjectIO](https://github.com/jeannevesit/ProjectIO)

---

## 4. Executed Setup Steps

1. **Retrieved & Converted Course Documentation**: Downloaded 15 course guide PDF files (`1.pdf` – `15.pdf`) into `docs/`.
2. **Downloaded Exercise Files**: Cloned and extracted attack simulation scripts (`phishing-simulation` and `reverse-shell`) into `exercise-files/`.
3. **Hypervisor & Networking Setup**: Installed Oracle VirtualBox 7.2 and created NAT Network `project-x-nat` (`10.0.0.0/24`).
4. **Virtual Machine Provisioning**: Executed `create_vms.ps1` to instantiate and register all 7 Virtual Machines in VirtualBox.
5. **ISO Mounting**: Executed `mount_all_isos.ps1` to automatically mount Windows Server 2025, Windows 11 Enterprise, Ubuntu Server, and Kali Linux ISOs to their corresponding Virtual Machines.

---

## 5. Repository Maintenance Commands

- Run `powershell -ExecutionPolicy Bypass -File create_vms.ps1` to re-create machines if needed.
- Run `powershell -ExecutionPolicy Bypass -File mount_all_isos.ps1` to re-mount ISO images.
