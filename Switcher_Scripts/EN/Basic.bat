@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo The classic theme has been disabled) else (echo The classic theme is already disabled)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\uxsms.exe (goto :2) else (ren "%userprofile%\tss\basic\uxsms_old.exe" uxsms.exe
echo The basic theme has been activated)
:2
Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && echo The basic theme is already active || (start "" /D "%USERPROFILE%\TSS\Basic" uxsms.exe)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /t REG_DWORD /d 0
if exist "%userprofile%"\tss\Task-Scripts\@DDEF.bat" (echo DWM extended frames are already disabled) else (ren "%userprofile%"\tss\Task-Scripts\@DDEF_old.bat" @DDEF.bat
echo DWM extended frames have been disabled)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%"\tss\Task-Scripts\@UT.bat" (ren "%userprofile%"\tss\Task-Scripts\@UT.bat" @UT_old.bat
echo Composition in client area has been enabled) else (echo Composition in client area is already enabled)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%"\tss\Task-Scripts\@UTNC.bat" (ren "%userprofile%"\tss\Task-Scripts\@UTNC.bat" @UTNC_old.bat
echo Full composition in the client area has been enabled) else (echo Full composition in the client area is already enabled)

:MSG
echo Task completed
