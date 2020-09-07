:: @ECHO OFF
TITLE Update Hosts

cd \
mkdir tmp

:: Check if we are administrator. If not, exit immediately.

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %ERRORLEVEL% NEQ 0 (
    ECHO This script must be run with administrator privileges!
    ECHO Please launch command prompt as administrator. Exiting...
    EXIT /B 1
)
if not exist "%WINDIR%\System32\drivers\etc\hosts.bak" (
	COPY %WINDIR%\System32\drivers\etc\hosts %WINDIR%\System32\drivers\etc\hosts.bak
    )
if not exist "%WINDIR%\System32\drivers\etc\hosts.original" (
	COPY %WINDIR%\System32\drivers\etc\hosts %WINDIR%\System32\drivers\etc\hosts.original
    )
:: Download Latest Updated Hosts File
:: Uses a Windows component called BITS 
:: It has been included in Windows since XP and 2000 SP3

bitsadmin.exe /transfer "Download Fresh Hosts File" https://gist.githubusercontent.com/priyankpat/e427d46f7a438ad91b1f5dc7211c99f0/raw/822aa815d386ac9d15cdb84bb7218da14e054502/gistfile1.txt C:\tmp\hosts

echo Move new hosts file in-place

:: Move new hosts file in-place

COPY C:\tmp\hosts %WINDIR%\System32\drivers\etc\

echo Flush the DNS cache

:: Flush the DNS cache

ipconfig /flushdns

echo ALL DONE !!! Enjoy :) !!