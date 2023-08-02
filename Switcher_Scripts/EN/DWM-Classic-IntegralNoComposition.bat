@echo off
chcp 65001 > nul

if exist "%userprofile%"\TSS\classic\classicthemetray.exe (ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
echo The classic theme has been disabled) else (echo The classic theme is already disabled)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && (TASKKILL /f /im uxsms.exe) || goto :1
:1
if exist "%userprofile%"\tss\basic\uxsms.exe (ren "%userprofile%\tss\basic\uxsms.exe" uxsms_old.exe
echo The basic theme has been disabled) else (echo The basic theme is already disabled)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%"\tss\Task-Scripts\@DDEF.bat" (ren "%userprofile%"\tss\Task-Scripts\@DDEF.bat" @DDEF_old.bat
echo The DWM extended frames have been enabled) else (echo The DWM Extended Frames are already enabled)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%"\tss\Task-Scripts\@UT.bat" (ren "%userprofile%"\tss\Task-Scripts\@UT.bat" @UT_old.bat
echo Composition in client area has been enabled) else (echo Composition in client area is already enabled)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /t REG_DWORD /d 0
if exist "%userprofile%\tss\Task_Scripts\@UTNC.bat" (echo Full composition in the client area is already disabled) else (ren "%userprofile%\tss\Task_Scripts\@UTNC_old.bat" @UTNC.bat
echo Full composition in the client area has been disabled)

if exist "%userprofile%\tss\Task_Scripts\@CTEX.bat" (echo The classic taskbar are already enabled) else (ren "%userprofile%\tss\Task_Scripts\@CTEX_old.bat" @CTEX.bat
echo The classic taskbar has ben enabled)

:MSG
echo Task completed
