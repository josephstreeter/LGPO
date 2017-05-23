@ECHO OFF
ECHO
ECHO Apply Detailed Audit Policy
ECHO
ECHO 1.3.1 Audit Policy: System: IPsec Driver
auditpol /set /subcategory:"IPSEC Driver" /success:enable /failure:enable

ECHO 1.3.2 Audit Policy: System: Security State Change
auditpol /set /subcategory:"Security State Change" /success:enable /failure:enable

ECHO 1.3.3 Audit Policy: System: Security System Extension
auditpol /set /subcategory:"Security System Extension" /success:enable /failure:enable

ECHO 1.3.4 Audit Policy: System: System Integrity
auditpol /set /subcategory:"System Integrity" /success:enable /failure:enable

ECHO 1.3.5 Audit Policy: Logon-Logoff: Logoff
auditpol /set /subcategory:"logoff" /success:enable 

ECHO 1.3.6 Audit Policy: Logon-Logoff: Logon
auditpol /set /subcategory:"logon" /success:enable /failure:enable

ECHO 1.3.7 Audit Policy: Logon-Logoff: Special Logon
auditpol /set /subcategory:"Special Logon" /success:enable 

ECHO 1.3.8 Audit Policy: Object Access: File System
auditpol /set /subcategory:"File System" /success:disable /failure:disable

ECHO 1.3.9 Audit Policy: Object Access: Registry
auditpol /set /subcategory:"Registry" /success:disable /failure:disable

ECHO 1.3.10 Audit Policy: Privilege Use: Sensitive Privilege Use
auditpol /set /subcategory:"Sensitive Privilege Use" /success:disable /failure:disable

ECHO 1.3.11 Audit Policy: Detailed Tracking: Process Creation
auditpol /set /subcategory:"Process Creation" /success:enable /failure:disable

ECHO 1.3.12 Audit Policy: Policy Change: Audit Policy Change
auditpol /set /subcategory:"Audit Policy Change" /success:enable /failure:enable

ECHO 1.3.13 Audit Policy: Policy Change: Authentication Policy Change
auditpol /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable

ECHO 1.3.14 Audit Policy: Account Management: Computer Account Management
auditpol /set /subcategory:"Computer account management" /success:enable /failure:disable

ECHO 1.3.15 Audit Policy: Account Management: Distribution Group Management
auditpol /set /subcategory:"Distribution Group Management" /success:disable /failure:disable

ECHO 1.3.16 Audit Policy: Account Management: Other Account Management Events
auditpol /set /subcategory:"Other Account Management Events" /success:enable /failure:disable

ECHO 1.3.17 Audit Policy: Account Management: Security Group Management
auditpol /set /subcategory:"Security Group management" /success:enable /failure:disable

ECHO 1.3.18 Audit Policy: Account Management: User Account Management
auditpol /set /subcategory:"user account management" /success:enable /failure:disable

ECHO 1.3.19 Audit Policy: Account Logon: Credential Validation
auditpol /set /subcategory:"Credential Validation" /success:enable /failure:disable
