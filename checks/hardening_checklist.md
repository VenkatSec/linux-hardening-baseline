# Linux Hardening Checklist

## System Security
- [ ] Confirm system is updated.
- [ ] Review installed packages and remove unnecessary software.
- [ ] Check running services.
- [ ] Review active user accounts.

## Access Control
- [ ] Review user and group permissions.
- [ ] Check for duplicate user IDs.
- [ ] Verify `/etc/passwd` permissions.
- [ ] Verify `/etc/shadow` permissions.

## SSH Security
- [ ] Disable direct root SSH login where appropriate.
- [ ] Review SSH authentication settings.
- [ ] Use strong authentication methods.

## Firewall
- [ ] Confirm a firewall is installed.
- [ ] Verify firewall status.
- [ ] Review allowed inbound services.

## Logging and Monitoring
- [ ] Review authentication logs.
- [ ] Confirm failed-login monitoring is available.
- [ ] Review system logs regularly.

## Updates and Maintenance
- [ ] Review automatic security update configuration.
- [ ] Check system backup procedures.
- [ ] Schedule periodic security audits.

## Final Review
- [ ] Document findings.
- [ ] Prioritize identified risks.
- [ ] Record recommended remediation.
