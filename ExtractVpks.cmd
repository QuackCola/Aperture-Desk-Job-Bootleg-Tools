@echo off
setlocal
cls

echo.
echo Example : D:\Tools\Source 2\VRF - Source 2 Resource Viewer
echo. 
set /p "vrf-decompiler-exe-dir=Please Specify the directory where VRF's Decompiler.exe is located then press Enter: "
set core-game-dir=".\game\core"
set steampal-game-dir=".\game\steampal"

:: verify that we can actually see Decompiler.exe
IF NOT EXIST "%vrf-decompiler-exe-dir%/Decompiler.exe" (
	ECHO VRF Decompiler cannot be found. Are you sure youve provided the correct path?
	EXIT /B 1
)

echo VRF Decompiler Found!!

:: Set command prompt title 
title Extracting Aperture Desk Job vpk's...


:: Extract .\game\core .vpk's
"%vrf-decompiler-exe-dir%/Decompiler.exe" -i %core-game-dir% -o %core-game-dir% --recursive --recursive_vpk --threads 4 

:: Goto Drive Root and move the extracted files back to .\game\core
pushd %CD:~0,3%
echo at drive root!
echo cmd script execution directory is %~dp0

:: copy extract vpk contents back to game folder
call :robocopy_files pak01_dir.vpk "%~dp0\game\core"
call :robocopy_files shaders_pc_dir.vpk "%~dp0\game\core"
call :robocopy_files shaders_vulkan_dir.vpk "%~dp0\game\core" 

:: delete leftover folders on root of drive that are no longer needed , I dont know why the vrf decompiler puts them here...
call :delete_leftover_folders
popd

:: Extract .\game\steampal .vpk's
"%vrf-decompiler-exe-dir%/Decompiler.exe" -i %steampal-game-dir% -o %steampal-game-dir% --recursive --recursive_vpk --threads 4 

:: Goto Drive Root and move the extracted files back to .\game\steampal
pushd %CD:~0,3%
echo at drive root!
echo cmd script execution directory is %~dp0

:: copy extract vpk contents back to game folder
call :robocopy_files pak01_dir.vpk "%~dp0\game\steampal"
call :robocopy_files shaders_pc_dir.vpk "%~dp0\game\steampal"
call :robocopy_files shaders_vulkan_dir.vpk "%~dp0\game\steampal" 

:: delete leftover folders on root of drive that are no longer needed , I dont know why the vrf decompiler puts them here...
call :delete_leftover_folders
popd

:: Delete .\game\core .vpk's . No longer needed
pushd game\core

echo Deleting .\game\core pak01_.vpk's
call :delete_pack01_vpks_0to5
del pak01_dir.vpk

echo Deleting .\game\core shaders_.vpk's
call :delete_shaders_vpks

popd

:: Delete .\game\steampal .vpk's . No longer needed
pushd game\steampal

echo Deleting .\game\steampal pak01_.vpk's

call :delete_pack01_vpks_0to5
del pak01_006.vpk
del pak01_007.vpk
del pak01_008.vpk
del pak01_009.vpk
del pak01_010.vpk
del pak01_011.vpk
del pak01_012.vpk
del pak01_013.vpk
del pak01_014.vpk
del pak01_015.vpk
del pak01_016.vpk
del pak01_017.vpk
del pak01_018.vpk
del pak01_019.vpk
del pak01_020.vpk
del pak01_021.vpk
del pak01_022.vpk
del pak01_023.vpk
del pak01_024.vpk
del pak01_025.vpk
del pak01_026.vpk
del pak01_027.vpk
del pak01_dir.vpk

echo Deleting .\game\steampal shaders_.vpk's
call :delete_shaders_vpks

popd

echo.
echo !!Done!!
echo.

endlocal
pause
exit /b


:: Sub Routines 
:robocopy_files
echo Starting robocopy subroutine
robocopy %1 %2 /E /DCOPY:DAT /MOVE
goto:eof

:delete_pack01_vpks_0to5
del pak01_000.vpk
del pak01_001.vpk
del pak01_002.vpk
del pak01_003.vpk
del pak01_004.vpk
del pak01_005.vpk
goto:eof

:delete_shaders_vpks
del shaders_pc_000.vpk
del shaders_pc_dir.vpk
del shaders_vulkan_000.vpk
del shaders_vulkan_dir.vpk
goto:eof

:delete_leftover_folders
rmdir /s /q maps
rmdir /s /q materials
rmdir /s /q shaders_vulkan_dir.vpk
goto:eof
