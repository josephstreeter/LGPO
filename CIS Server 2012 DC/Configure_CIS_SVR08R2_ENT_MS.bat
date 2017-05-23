@ECHO OFF
ECHO Configure CIS Benchmarks for Server 2008R2 Enterprise Member Server
ECHO
ECHO Apply Registry Based Local Group Policy

Apply_LGPO_Delta.exe CIS_SVR08R2_MS_Add_Sec.txt CIS_SVR08R2_MS_Event_Log.txt CIS_SVR08R2_MS_Inet_Com.txt CIS_SVR08R2_MS_Term_Serv.txt CIS_WU_ENT_SSLF.txt /log c:\scripts\lgpo.log /error c:\scripts\lgpo_error.log


secedit /configure /db lgpo /cfg "Enterprise Member Server.inf"

ECHO Configuration Complete

ECHO
ECHO
ECHO Apply Detailed Audit Policy

SVR_2K8_ENT_MS_Audit.bat

ECHO
ECHO Configuration Complete