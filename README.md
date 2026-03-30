# OSS Audit — Linux System Monitoring Toolkit

**Student Name:** Suyash Billaiya  
**Registration Number:** 24MIM10165  
**Course:** Open Source Software  
**Chosen Software:** Linux Kernel (GPL v2)

---

## Project Overview

This project is a set of five Bash shell scripts written as part of the Open Source Software capstone project. Each script demonstrates practical Linux automation and relates to the philosophy, installation, and usage of open source software — specifically the Python programming language.

---

## Chosen Software: Linux Kernel

The Linux kernel is an open source monolithic Unix-like kernel released under the **GNU General Public License v2 (GPL v2)**. It was created by Linus Torvalds in 1991 as a free alternative to proprietary Unix systems. Today it is the most widely deployed OS kernel in the world — powering Android smartphones, cloud servers, supercomputers, and embedded devices. Kernel development is coordinated by Linus Torvalds and a global community of thousands of contributors via the Linux Kernel Mailing List (LKML).

---

## Scripts Included

### 1. `sys_health_monitor.sh` — System Identity Report
Displays a formatted welcome screen showing the Linux distribution name, kernel version, current logged-in user and their home directory, system uptime, current date and time, and the open source license that covers the Linux operating system (GPL v2).

**Concepts used:** variables, command substitution `$()`, `echo`, `uname`, `lsb_release`, `whoami`, `uptime`, `date`

### 2. `foss_package_report.sh` — FOSS Package Inspector
Checks whether the `python3` package is installed on the system, displays its version and package metadata, and uses a `case` statement to print a philosophy note about several recognised open source packages.

**Concepts used:** `if-then-else`, `case` statement, `dpkg -s`, `grep`, pipe `|`, `awk`

### 3. `directory_security_scan.sh` — Disk and Permission Auditor
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports permissions, owner, group, and disk usage for each. Also checks and reports on Linux kernel-related directories (`/boot`, `/proc`, `/sys/kernel`).

**Concepts used:** `for` loop, `ls -ld`, `du -sh`, `awk`, `cut`, `if [ -d ]`

### 4. `log_keyword_tracker.sh` — Log File Analyzer
Reads a log file line by line using a `while read` loop, counts how many lines contain a given keyword using a counter variable, and prints the last 5 matching lines. Accepts the log file path and keyword as command-line arguments.

**Concepts used:** `while IFS= read -r`, `if-then`, counter variable `$((COUNT + 1))`, `grep`, `tail`, `$1`/`$2` arguments

### 5. `open_source_story.sh` — Open Source Manifesto Generator
Asks the user three interactive questions, composes a personalised open source philosophy statement using their answers, and saves it to a `.txt` file named after the current user.

**Concepts used:** `read`, string concatenation, file writing with `>` and `>>`, `date` command, alias concept (documented in comments)

---

## Dependencies

| Dependency | Purpose | Install command |
|---|---|---|
| `bash` | Shell interpreter for all scripts | Pre-installed on all Linux systems |
| `lsb_release` | Detect Linux distro name (Script 1) | `sudo apt install lsb-release` |
| `dpkg` | Check installed packages (Script 2) | Pre-installed on Debian/Ubuntu |
| `coreutils` | `du`, `ls`, `date`, `whoami`, etc. | Pre-installed on all Linux systems |
| `grep` | Keyword search (Scripts 2, 4) | Pre-installed on all Linux systems |

> These scripts are written for **Debian/Ubuntu-based** Linux distributions. Script 2 uses `dpkg` for package inspection. On RPM-based systems (Fedora, CentOS), replace `dpkg -s` with `rpm -qi`.

---

## Running the Scripts

### Step 1 — Make all scripts executable

```bash
chmod +x *.sh
```

### Step 2 — Run each script

**Script 1: System Identity Report**
```bash
./sys_health_monitor.sh
```

**Script 2: FOSS Package Inspector**
```bash
./foss_package_report.sh
```

**Script 3: Disk and Permission Auditor**
```bash
./directory_security_scan.sh
```
> Note: Some directories like `/var/log` may show limited size output without `sudo`.

**Script 4: Log File Analyzer**
```bash
./log_keyword_tracker.sh /var/log/syslog error
```
Replace `/var/log/syslog` with any readable log file on your system, and `error` with any keyword you want to search for.

**Script 5: Open Source Manifesto Generator**
```bash
./open_source_story.sh
```
You will be prompted to answer three questions interactively. The manifesto is saved to `manifesto_<username>.txt` in the current directory.

---

## Repository Structure

```
oss-audit-24MIM10165/
├── README.md
├── sys_health_monitor.sh
├── foss_package_report.sh
├── directory_security_scan.sh
├── log_keyword_tracker.sh
└── open_source_story.sh
```
