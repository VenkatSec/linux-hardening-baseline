#!/usr/bin/env bash

# Project 06/18: Linux Hardening Baseline
# Purpose: Defensive Linux security auditing
# Mode: Read-only

set -uo pipefail

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

check_result() {
    local name="$1"
    local status="$2"
    local details="$3"

    printf "[%s] %s: %s\n" "$status" "$name" "$details"

    case "$status" in
        PASS) PASS_COUNT=$((PASS_COUNT + 1)) ;;
        WARN) WARN_COUNT=$((WARN_COUNT + 1)) ;;
        FAIL) FAIL_COUNT=$((FAIL_COUNT + 1)) ;;
    esac
}

echo "===================================="
echo "     LINUX HARDENING AUDIT"
echo "===================================="
echo "Operating System: $(uname -s)"
echo "Kernel: $(uname -r)"
echo "Date: $(date)"
echo

if [[ "$EUID" -eq 0 ]]; then
    check_result "Root privileges" "PASS" "Running as root"
else
    check_result "Root privileges" "WARN" "Not running as root"
fi

if command -v sshd >/dev/null 2>&1; then
    SSH_EFFECTIVE=$(sshd -T 2>/dev/null || true)

    if grep -qx "permitrootlogin no" <<< "$SSH_EFFECTIVE"; then
        check_result "SSH root login" "PASS" "Root login disabled"
    else
        check_result "SSH root login" "WARN" "Review effective SSH configuration"
    fi
else
    check_result "SSH service" "WARN" "OpenSSH server not detected"
fi

if command -v ufw >/dev/null 2>&1; then
    if ufw status 2>/dev/null | grep -q "Status: active"; then
        check_result "Firewall" "PASS" "UFW is active"
    else
        check_result "Firewall" "WARN" "UFW is inactive"
    fi
elif command -v firewall-cmd >/dev/null 2>&1; then
    if firewall-cmd --state 2>/dev/null | grep -qx "running"; then
        check_result "Firewall" "PASS" "Firewalld is running"
    else
        check_result "Firewall" "WARN" "Firewalld is inactive"
    fi
else
    check_result "Firewall" "WARN" "No supported firewall manager found"
fi

if command -v lastb >/dev/null 2>&1; then
    check_result "Login auditing" "PASS" "lastb utility available"
else
    check_result "Login auditing" "WARN" "lastb utility unavailable"
fi

if command -v systemctl >/dev/null 2>&1; then
    if systemctl is-enabled unattended-upgrades.service >/dev/null 2>&1 ||
       systemctl is-enabled dnf-automatic.timer >/dev/null 2>&1; then
        check_result "Automatic updates" "PASS" "Automatic update mechanism enabled"
    else
        check_result "Automatic updates" "WARN" "Enablement not confirmed"
    fi
else
    check_result "Automatic updates" "WARN" "systemd unavailable"
fi

if [[ -d /etc ]]; then
    if find /etc -xdev -type f -perm -0002 -print -quit 2>/dev/null | grep -q .; then
        check_result "File permissions" "WARN" "World-writable file detected under /etc"
    else
        check_result "File permissions" "PASS" "No world-writable files detected under /etc"
    fi
fi

if [[ -r /etc/passwd ]]; then
    DUPLICATES=$(awk -F: '{print $3}' /etc/passwd | sort -n | uniq -d)

    if [[ -n "$DUPLICATES" ]]; then
        check_result "Duplicate UIDs" "WARN" "Duplicate user IDs detected"
    else
        check_result "Duplicate UIDs" "PASS" "No duplicate UIDs found"
    fi
fi

if [[ -r /etc/passwd ]]; then
    check_result "Account database" "PASS" "/etc/passwd is readable"
else
    check_result "Account database" "WARN" "Cannot read /etc/passwd"
fi

if [[ -e /etc/shadow ]]; then
    SHADOW_MODE=$(stat -c '%a' /etc/shadow 2>/dev/null || true)

    case "$SHADOW_MODE" in
        600|640)
            check_result "Shadow permissions" "PASS" "Restricted permissions detected"
            ;;
        *)
            check_result "Shadow permissions" "WARN" "Review /etc/shadow permissions"
            ;;
    esac
else
    check_result "Shadow permissions" "WARN" "Shadow file unavailable"
fi

CURRENT_UMASK=$(umask)

if [[ "$CURRENT_UMASK" == "0077" || "$CURRENT_UMASK" == "077" ]]; then
    check_result "Current umask" "PASS" "Restrictive umask detected"
else
    check_result "Current umask" "WARN" "Review current umask: $CURRENT_UMASK"
fi

echo
echo "===================================="
echo "          AUDIT SUMMARY"
echo "===================================="

TOTAL=$((PASS_COUNT + WARN_COUNT + FAIL_COUNT))

echo "Total: $TOTAL"
echo "PASS:  $PASS_COUNT"
echo "WARN:  $WARN_COUNT"
echo "FAIL:  $FAIL_COUNT"

echo "===================================="
echo "       AUDIT COMPLETED"
echo "===================================="

exit 0
