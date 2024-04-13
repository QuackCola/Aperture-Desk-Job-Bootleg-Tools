@ECHO OFF
SETLOCAL
CLS

:: Make sure we are running this script in the correct place.
IF NOT EXIST ".\game\bin\win64\deskjob.exe" (
	ECHO Game binary doesn't exist. Are you executing this script from the wrong directory?
	EXIT /B 1
)

:: Some of the below won't work if the game is already running
TASKKILL /f /im "deskjob.exe" >NUL 2>&1

:: Folders
CALL :DEL_DIR ".content\_toolsautosave"
CALL :DEL_DIR ".game\steampal\_vrad3"
CALL :DEL_DIR ".game\steampal\_bakeresourcecache"
CALL :DEL_DIR ".game\testbed\_bakeresourcecache"


:: Files
CALL :DEL_FILE ".game\_toolsettings\asset_browser\settings.txt"
CALL :DEL_FILE ".game\core\tools_asset_info.bin"
CALL :DEL_FILE ".game\steampal\tools_asset_info.bin"
CALL :DEL_FILE ".game\steampal\tools_thumbnail_cache.bin"
CALL :DEL_FILE ".game\testbed\tools_asset_info.bin"
CALL :DEL_FILE ".game\testbed\tools_thumbnail_cache.bin"



ENDLOCAL
PAUSE
EXIT /B

:DEL_DIR
    ECHO Removing dir %1.
    IF EXIST %1 ( RMDIR /S /Q %1 )
    GOTO:EOF

:DEL_DIR_VS
    ECHO Removing Cache %1
    for /d /r . %%d in (.VS) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
    GOTO:EOF

:DEL_FILE
    ECHO Removing file %1.
    IF EXIST %1 ( DEL /Q %1 )
    GOTO:EOF