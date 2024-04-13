@echo off
setlocal


if [%ARGUMENTS%] == [] (
	set arguments=dev_mode
	echo Choose in what to start.
	echo 1. dev_mode
	echo 2. tools
	echo 3. testbed
	echo 4. testbed_tools
	choice /C:1234
	if ERRORLEVEL 1 set arguments=dev_mode
	if ERRORLEVEL 2 set arguments=-noassert -dev -allowdebug -vconsole -toconsole -sw -720 -tools -nocustomermachine & goto :stock_exe
	if ERRORLEVEL 3 set arguments=testbed
	if ERRORLEVEL 4 set arguments=-noassert -dev -allowdebug -vconsole -toconsole -sw -720 -tools -nocustomermachine 
	)


if [%ARGUMENTS%] == [tools] (
goto :stock_exe
)


:stock_exe
echo Stock exe
::game\bin\win64\deskjob.exe %ARGUMENTS%
pause

:modified_exe
echo modified exe
::game\bin\win64\deskjob-testbed.exe %ARGUMENTS%

:eof
endlocal
pause