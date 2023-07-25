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

set /P c=Do you want to restart explorer ?[Y\N]?
if /I "%c%" EQU "Y" (TASKKILL /f /im explorer.exe
goto :EX1)
if /I "%c%" EQU "N" (goto :MSG)

:EX1
Set 7+=7+ Taskbar Tweaker.exe
tasklist | find /i "%7+%">nul  && (TASKKILL /f /im "7+ Taskbar Tweaker.exe"
goto :2) || goto :EX2

:EX2
start explorer.exe
timeout /t 5
if exist "%userprofile%\AppData\Local\Programs\7+ Taskbar Tweaker\7+ Taskbar Tweaker.exe" (start "" /D "%userprofile%\AppData\Local\Programs\7+ Taskbar Tweaker" "7+ Taskbar Tweaker.exe")
goto :MSG

:MSG
echo Task completed
