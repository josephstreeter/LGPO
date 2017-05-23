@Echo off
ECHO.
ECHO LocalGPO Tool
ECHO ____________________
ECHO.

%~d0
CD %~dp0

cscript //H:CScript //B //NoLogo
cscript LocalGPO.wsf

IF %errorlevel%==0 (
            CMD /K
) ELSE (
            EXIT
)

