# Enterprise 101 Homelab Architecture & VM Specification Guide

This repository contains the architecture, configuration scripts, exercise files, and documentation for building the **Enterprise 101 Cybersecurity Homelab** based on [ProjectSecurity.io](https://docs.projectsecurity.io/).

---

## 1. Network Topology (`project-x-nat`)

All virtual machines operate inside an isolated VirtualBox NAT Network named **`project-x-nat`**.

- **Network CIDR**: `10.0.0.0/24`
- **Usable IP Range**: `10.0.0.1` - `10.0.0.254`
- **DHCP Dynamic Scope**: `10.0.0.100` - `10.0.0.200`

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

## 2. Virtual Machine Specifications & Accounts

| Hostname | OS / Base Image | vCPU | RAM | Storage | Static / Dynamic IP | Credentials |
| :--- | :--- | :---: | :---: | :---: | :--- | :--- |
| **`project-x-dc`** | Windows Server 2025/2022 | 2 | 4096 MB | 50 GB | Static: `10.0.0.5` | `Administrator` : `@Deeboodah1!` |
| **`project-x-corp-svr`** | Ubuntu Server 22.04 | 1 | 2048 MB | 25 GB | Static: `10.0.0.8` | `project-x-admin` : `@password123!` |
| **`project-x-sec-box`** | Ubuntu Server 22.04 | 2 | 4096 MB | 80 GB | Static: `10.0.0.10` | `sec-work` : `@password123!` |
| **`project-x-sec-work`** | Security Onion / Ubuntu | 1 | 2048 MB | 55 GB | Dynamic (`10.0.0.103`) | `project-x-sec-work` : `@password123!` |
| **`project-x-win-client`**| Windows 11/10 Enterprise| 2 | 4096 MB | 80 GB | Dynamic (`10.0.0.100`) | `johnd` : `@password123!` |
| **`project-x-linux-client`**| Ubuntu Desktop 22.04 | 1 | 2048 MB | 80 GB | Dynamic (`10.0.0.101`) | `janed` : `@password123!` |
| **`project-x-attacker`** | Kali Linux 2024.2 | 1 | 2048 MB | 55 GB | Dynamic | `attacker` : `attacker` |

---

## 3. Directory Layout

- `docs/`: Downloaded reference PDFs and guide materials (`1.pdf` through `15.pdf`).
- `exercise-files/`: Phishing site templates, SMTP payloads, and reverse shell scripts from `collinsmc23/projectsecurity-e101`.
- `ISOs/`: Operating System ISO installer files.
- `VMs/`: VirtualBox Virtual Hard Disks and machine definitions.

---

## 4. Provisioning Commands (VirtualBox CLI)

### Step 1: Create NAT Network
```bash
VBoxManage natnetwork add --netname project-x-nat --network "10.0.0.0/24" --enable --dhcp on
```

### Step 2: Provision VMs
VirtualBox VMs are created with the corresponding CPU, RAM, and Disk allocations specified above, connected to `project-x-nat`.
