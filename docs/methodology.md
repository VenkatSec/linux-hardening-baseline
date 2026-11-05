# Linux Hardening Audit Methodology

## Objective
Assess selected Linux security configurations using a read-only Bash audit script.

## Assessment Areas
- SSH configuration
- Firewall status
- Login auditing availability
- Automatic update configuration
- File permissions
- User account configuration
- Current umask

## Assessment Process
1. Run the audit script on a Linux system.
2. Review each PASS, WARN, and FAIL result.
3. Compare findings against the hardening checklist.
4. Investigate warnings before making configuration changes.
5. Document findings and recommended remediation.

## Testing
The test script checks that the audit script exists and passes Bash syntax validation.

## Limitations
- This is a basic security baseline, not a complete security assessment.
- Results depend on the Linux distribution and available tools.
- A warning does not automatically indicate a vulnerability.
- The audit script does not modify system configurations.
- This project does not claim CIS or other compliance certification.

## Safety
Run audits only on systems you own or are authorized to assess.
