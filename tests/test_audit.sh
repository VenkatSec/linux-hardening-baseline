#!/usr/bin/env bash

set -euo pipefail

SCRIPT="./scripts/linux_hardening_audit.sh"

if [[ ! -f "$SCRIPT" ]]; then
    echo "FAIL: Audit script not found"
    exit 1
fi

if ! bash -n "$SCRIPT"; then
    echo "FAIL: Bash syntax check failed"
    exit 1
fi

echo "PASS: Audit script exists"
echo "PASS: Bash syntax is valid"
echo "All tests passed"
