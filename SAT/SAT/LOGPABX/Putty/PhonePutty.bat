@echo off
setlocal enableextensions disabledelayedexpansion

set "textFile=C:\LOGPABX\putty.log"
set "textFile2=C:\LOGPABX\LOGS\LG%date:~0,2%%date:~3,2%%date:~8,2%.txt"

for /f "skip=1 delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
    setlocal enabledelayedexpansion
    >> "%textFile2%" echo %%i 
    endlocal
)
C:\LOGPABX\Putty\PhonePutty2.bat %textFile2%