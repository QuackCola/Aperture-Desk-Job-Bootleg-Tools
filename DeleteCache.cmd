@echo off
setlocal
cls


:: Make sure we are running this script in the correct place.
IF NOT EXIST ".\game\bin\win64\deskjob.exe" (
	ECHO Game doesn't exist. Are you executing this script from the wrong directory?
	EXIT /B 1
)

:: Let the user bail
CHOICE /N /M "Are you sure you want to continue? [Y/N]"

IF ERRORLEVEL == 2 (
	ECHO Aborting.
	EXIT /B 1
)

echo.

:: Some of the below won't work if the game/tools is already running
TASKKILL /f /im "deskjob.exe" >NUL 2>&1

:: Delete generated data & other files that didnt come with the base game from steam.


CALL :DEL_DIR  ".\content\testbed\_bakeresourcecache"
CALL :DEL_DIR  ".\game\_toolsettings"
CALL :DEL_DIR  ".\game\steampal\_bakeresourcecache"
CALL :DEL_FILE ".\game\steampal\tools_asset_info.bin"
CALL :DEL_FILE ".\game\steampal\tools_thumbnail_cache.bin"
CALL :DEL_FILE ".\game\bin\win64\*.mdmp"

:: Delete generated ".\game\testbed" folders & files.

CALL :DEL_DIR  ".\game\testbed\_bakeresourcecache"
CALL :DEL_FILE ".\game\testbed\tools_asset_info.bin"
CALL :DEL_FILE ".\game\testbed\tools_thumbnail_cache.bin"

:: Delete generated ".\game\testbed_addons\addon_test" folders & files.

CALL :DEL_DIR  ".\game\testbed_addons\addon_test\_bakeresourcecache"
CALL :DEL_DIR  ".\game\testbed_addons\addon_test\maps"
CALL :DEL_DIR  ".\game\testbed_addons\addon_test\materials"
CALL :DEL_DIR  ".\game\testbed_addons\addon_test\particles"
CALL :DEL_FILE ".\game\testbed_addons\addon_test\tools_asset_info.bin"
CALL :DEL_FILE ".\game\testbed_addons\addon_test\tools_thumbnail_cache.bin"


echo.
echo !!Done!!
echo.

endlocal
pause
exit /b

:: Subroutines defined below

:DEL_DIR
    :: Let the user know the specified directory dosent exist, then exit the subroutine.
    if not exist %1 ( 
     echo %1 doent Exist, Skipping...
     goto:eof
    )

    :: If the specified directory exists proceed on with folder deletion.
    echo Removing dir %1.
    if exist %1 ( rmdir /s /q %1 )
    :endofsubroutine
    goto:eof

:DEL_FILE
    :: Let the user know the specified file dosent exist, then exit the subroutine.
    if not exist %1 ( 
     echo %1 doent Exist, Skipping...
     goto:eof
    )

    :: If the specified files exists proceed on with file deletion.
    echo Removing file %1.
    if exist %1 ( DEL /Q %1 )
    :endofsubroutine
    goto:eof