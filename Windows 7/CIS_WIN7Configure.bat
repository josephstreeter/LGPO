@ECHO OFF
CLS

ECHO .
ECHO #################################
ECHO # Apply local security template #
ECHO #################################
ECHO .

secedit /configure /db CIS.db /cfg .\CIS_WIN7_Sec_Temp.inf

del .\CIS.db

ECHO .
Echo Complete
ECHO .

ECHO ######################################
ECHO # Apply registry based LGPO policies #
ECHO ######################################
ECHO .
ECHO 1.4.1 Application: Maximum Log Size (KB)
ECHO 1.4.2 Application:Retain old events
ECHO 1.4.3 Security: Maximum Log Size (KB)
ECHO 1.4.4 Security:Retain old events
ECHO 1.4.5 System: Maximum Log Size (KB)
ECHO 1.4.6 System: Retain old events
ECHO .
ECHO 1.10.1  Always prompt for password upon connectionSoftware\Policies\Microsoft\Windows NT\Terminal Services
ECHO 1.10.2  Set client connection encryption level
ECHO 1.10.3  Do not allow drive redirection
ECHO 1.10.5  Do not allow passwords to be saved
ECHO .
ECHO 1.11.1  Turn off downloading of print drivers over HTTP
ECHO 1.11.2  Turn off the "Publish to Web" task for files and folders
ECHO 1.11.3  Turn off Internet download for Web publishing and online ordering wizards
ECHO 1.11.4  Turn off printing over HTTP
ECHO 1.11.5  Turn off Search Companion content file updates
ECHO 1.11.6  Turn off the Windows Messenger Customer Experience Improvement Program
ECHO 1.11.7  Turn off Windows Update device driver searching
ECHO .
ECHO 1.12.1  Require a Password When a Computer Wakes (On Battery)
ECHO 1.12.2  Require a Password When a Computer Wakes (Plugged In)
ECHO 1.12.4  Turn off Data Execution Prevention for Explorer
ECHO 1.12.5  Do not process the legacy run listt
ECHO 1.12.6  Do not process the run once list
ECHO 1.12.7  Registry policy processing
ECHO 1.12.7  Registry policy processing
ECHO 1.12.8  Offer Remote Assistance
ECHO 1.12.9  Solicited Remote Assistance
ECHO 1.12.12 Turn off Autoplay
ECHO 1.12.13 Enumerate administrator accounts on elevation
ECHO 1.12.14 Require trusted path for credential entry
ECHO 1.12.15 Prevent the computer from joining a homegroupp
ECHO .
ECHO 1.13.1  Do not preserve zone information in file attachments
ECHO 1.13.2  Hide mechanisms to remove zone information
ECHO 1.13.3  Notify antivirus programs when opening attachments
ECHO 1.13.7  Password protect the screen saver
ECHO 1.13.8  Force specific screen saver
ECHO 1.13.9  Screen Saver timeout
ECHO 1.13.10 Enable screen saver

Apply_LGPO_Delta.exe CIS_WIN7_Add_Sec.txt CIS_WIN7_Event_Log.txt CIS_WIN7_Inet_Com.txt CIS_WIN7_Term_Serv.txt CIS_WIN7_User.txt /log LGPO-Log.txt /error LGPO-ErrorLog.txt

ECHO .
Echo Complete
ECHO .

ECHO ###############################
ECHO # Apply Detailed Audit Policy #
ECHO ###############################

ECHO 1.3.1  Audit Policy: System: IPsec Driver
auditpol /set /subcategory:"IPSEC Driver" /success:enable /failure:enable > NUL

ECHO 1.3.2  Audit Policy: System: Security State Change
auditpol /set /subcategory:"Security State Change" /success:enable /failure:enable > NUL

ECHO 1.3.3  Audit Policy: System: Security System Extension
auditpol /set /subcategory:"Security System Extension" /success:enable /failure:enable > NUL

ECHO 1.3.4  Audit Policy: System: System Integrity
auditpol /set /subcategory:"System Integrity" /success:enable /failure:enable > NUL

ECHO 1.3.5  Audit Policy: Logon-Logoff: Logoff
auditpol /set /subcategory:"logoff" /success:enable  > NUL

ECHO 1.3.6  Audit Policy: Logon-Logoff: Logon
auditpol /set /subcategory:"logon" /success:enable /failure:enable > NUL

ECHO 1.3.7  Audit Policy: Logon-Logoff: Special Logon
auditpol /set /subcategory:"Special Logon" /success:enable  > NUL

ECHO 1.3.8  Audit Policy: Object Access: File System
auditpol /set /subcategory:"File System" /success:disable /failure:disable > NUL

ECHO 1.3.9  Audit Policy: Object Access: Registry
auditpol /set /subcategory:"Registry" /success:disable /failure:disable > NUL

ECHO 1.3.10 Audit Policy: Privilege Use: Sensitive Privilege Use
auditpol /set /subcategory:"Sensitive Privilege Use" /success:disable /failure:disable > NUL

ECHO 1.3.11 Audit Policy: Detailed Tracking: Process Creation
auditpol /set /subcategory:"Process Creation" /success:enable /failure:disable > NUL

ECHO 1.3.12 Audit Policy: Policy Change: Audit Policy Change
auditpol /set /subcategory:"Audit Policy Change" /success:enable /failure:enable > NUL

ECHO 1.3.13 Audit Policy: Policy Change: Authentication Policy Change
auditpol /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable > NUL

ECHO 1.3.14 Audit Policy: Account Management: Computer Account Management
auditpol /set /subcategory:"Computer account management" /success:enable /failure:disable > NUL

ECHO 1.3.15 Audit Policy: Account Management: Distribution Group Management
auditpol /set /subcategory:"Distribution Group Management" /success:disable /failure:disable > NUL

ECHO 1.3.16 Audit Policy: Account Management: Other Account Management Events
auditpol /set /subcategory:"Other Account Management Events" /success:enable /failure:disable > NUL

ECHO 1.3.17 Audit Policy: Account Management: Security Group Management
auditpol /set /subcategory:"Security Group management" /success:enable /failure:disable > NUL

ECHO 1.3.18 Audit Policy: Account Management: User Account Management
auditpol /set /subcategory:"user account management" /success:enable /failure:disable > NUL

ECHO 1.3.19 Audit Policy: Account Logon: Credential Validation
auditpol /set /subcategory:"Credential Validation" /success:enable /failure:disable > NUL

ECHO .
Echo Complete
ECHO .
