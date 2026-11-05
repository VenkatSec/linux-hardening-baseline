# Linux Hardening Baseline

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Linux-black?logo=linux" alt="Linux">
  <img src="https://img.shields.io/badge/Language-Bash-4EAA25?logo=gnubash&logoColor=white" alt="Bash">
  <img src="https://img.shields.io/badge/Focus-Defensive%20Security-blue" alt="Defensive Security">
  <img src="https://img.shields.io/badge/Project-Educational-orange" alt="Educational Project">
</p>

## Overview

**Linux Hardening Baseline** is a defensive cybersecurity project that audits selected Linux security configurations using a read-only Bash script.

The project helps identify potential system hardening gaps by reviewing important areas such as SSH configuration, firewall status, account security, file permissions and system update mechanisms.

It was developed as a hands-on learning project to strengthen Linux administration, Bash scripting and defensive security auditing skills.

## Objectives

- Understand Linux system hardening fundamentals.
- Review essential Linux security configurations.
- Identify potentially insecure file permissions.
- Examine SSH and firewall security settings.
- Review account configuration and login auditing.
- Practise defensive security assessment and documentation.

## Features

| Security Area | Audit Check |
|---|---|
| SSH Security | Reviews SSH root-login configuration where available |
| Firewall | Checks supported firewall manager status |
| Login Auditing | Checks availability of failed-login history tooling |
| System Updates | Reviews automatic update mechanisms |
| File Permissions | Identifies world-writable files under `/etc` |
| User Accounts | Checks for duplicate user IDs |
| Account Security | Reviews selected `/etc/passwd` and `/etc/shadow` permissions |
| System Configuration | Reviews current umask |
| Audit Summary | Reports PASS, WARN and FAIL results |

## Project Structure

```text
linux-hardening-baseline/
│
├── checks/
│   └── hardening_checklist.md
│
├── docs/
│   └── methodology.md
│
├── reports/
│   └── .gitkeep
│
├── scripts/
│   └── linux_hardening_audit.sh
│
├── tests/
│   └── test_audit.sh
│
├── .gitignore
├── LICENSE
└── README.md
```

## Requirements

- Linux operating system or compatible Linux environment.
- Bash shell.
- Standard Linux command-line utilities.

No third-party Python packages or additional dependencies are required by the audit script.

## Installation

Clone the repository:

```bash
git clone https://github.com/VenkatSec/linux-hardening-baseline.git
```

Enter the project directory:

```bash
cd linux-hardening-baseline
```

## Usage

Run the Linux hardening audit:

```bash
bash scripts/linux_hardening_audit.sh
```

Run the basic validation tests:

```bash
bash tests/test_audit.sh
```

## Understanding Audit Results

The script uses three result categories:

- **PASS:** The specific check met its expected condition.
- **WARN:** A configuration or environmental condition needs further review.
- **FAIL:** A condition was identified that the script classifies as a failure.

A warning does not automatically mean a system is vulnerable. Findings should be interpreted according to the Linux distribution, system role and available services.

## Security and Safety

This project is designed for defensive security learning.

- Performs read-only security checks.
- Does not automatically modify system configurations.
- Does not install packages or change firewall rules.
- Should only be executed on systems you own or have permission to assess.

## Limitations

- This is an educational security baseline, not a complete penetration test.
- It does not provide comprehensive Linux compliance validation.
- Results depend on the environment, available utilities and execution privileges.
- SSH settings affected by `Match` blocks may not be fully represented by the checks.
- Current automated tests validate script existence and Bash syntax; they do not cover every audit check's behaviour.

## Learning Outcomes

Through this project, I practised:

- Linux system administration fundamentals.
- Bash scripting and shell validation.
- Linux file permission auditing.
- SSH security concepts.
- Firewall verification.
- User account security checks.
- Defensive security assessment.
- Security documentation and reporting.

## Future Improvements

- Add automated behavioural tests for individual audit checks.
- Improve SSH configuration analysis.
- Add structured JSON reporting.
- Introduce distribution-specific hardening checks.
- Add configurable audit profiles.

## Author

**VenkatSec**

Cybersecurity | Linux Security | Blue Team | Defensive Security

[GitHub Profile](https://github.com/VenkatSec)

---

*Built as part of my cybersecurity portfolio project series.*