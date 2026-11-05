# Linux Hardening Baseline

A defensive cybersecurity project that audits selected Linux security configurations using a read-only Bash script.

## Project Objectives

- Review basic Linux security configurations.
- Identify potential hardening gaps.
- Understand SSH and firewall security.
- Review file permissions and account configuration.
- Practice defensive security auditing.

## Features

- SSH root-login configuration check
- Firewall status check
- Login auditing availability check
- Automatic update configuration check
- World-writable file check under `/etc`
- Duplicate UID detection
- Account file permission checks
- Current umask review
- PASS, WARN, and FAIL summary

## Project Structure

- `scripts/` — Linux audit script
- `tests/` — Basic script validation
- `checks/` — Hardening checklist
- `docs/` — Audit methodology
- `reports/` — Reserved for future audit reports

## Requirements

- Linux environment
- Bash
- Standard Linux utilities

## Usage

Run the audit:

    bash scripts/linux_hardening_audit.sh

Run the tests:

    bash tests/test_audit.sh

## Safety

This project performs read-only checks and does not automatically modify system settings.

Run it only on systems you own or have permission to assess.

## Limitations

This is an educational security baseline, not a complete penetration test or compliance assessment.

## Learning Outcomes

- Linux security fundamentals
- Bash scripting
- File permission auditing
- SSH hardening concepts
- Firewall verification
- Defensive security practices

## Author

VenkatSec
