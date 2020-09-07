:: @ECHO OFF
TITLE Uninstall Hosts

:: Check if we are administrator. If not, exit immediately.

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %ERRORLEVEL% NEQ 0 (
    ECHO This script must be run with administrator privileges!
    ECHO Please launch command prompt as administrator. Exiting...
    EXIT /B 1
)
	COPY %WINDIR%\System32\drivers\etc\hosts.original %WINDIR%\System32\drivers\etc\hosts
)

:: Flush the DNS cache

ipconfig /flushdns

echo ALL DONE !!! Restored successfully !!