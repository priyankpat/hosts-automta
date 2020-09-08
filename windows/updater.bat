:: @ECHO OFF
TITLE Update Hosts

:: Check if we are administrator. If not, exit immediately.

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %ERRORLEVEL% NEQ 0 (
    ECHO This script must be run with administrator privileges!
    ECHO Please launch command prompt as administrator. Exiting...
    EXIT /B 1
)
:: Download Latest Updated Hosts File
:: Uses a Windows component called BITS 
:: It has been included in Windows since XP and 2000 SP3

echo Move new hosts file in-place

:: Move new hosts file in-place

COPY %~dp0\hosts %WINDIR%\System32\drivers\etc\

echo Flush the DNS cache

:: Flush the DNS cache

ipconfig /flushdns

echo ALL DONE !!! Enjoy :) !!