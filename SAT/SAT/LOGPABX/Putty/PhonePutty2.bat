@echo off
setlocal disableDelayedExpansion
set "file=%~1"
set "sorted=%~1.sorted"
set "deduped=%~1.deduped"
::Define a variable containing a linefeed character
set LF=^


::The 2 blank lines above are critical, do not remove
sort "%file%" >"%sorted%"
>"%deduped%" (
  set "prev="
  for /f usebackq^ eol^=^%LF%%LF%^ delims^= %%A in ("%sorted%") do (
    set "ln=%%A"
    setlocal enableDelayedExpansion
    if /i "!ln!" neq "!prev!" (
			if "%date:~0,2%" equ "!ln:~13,2!" ( 
				endlocal
				echo %%A
				set "prev=%%A"
			)
		)
	rem else endlocal
	)
)
>nul move /y "%deduped%" "%file%"
del "%sorted%"