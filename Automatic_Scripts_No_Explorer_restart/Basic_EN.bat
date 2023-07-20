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

:MSG
echo Task completed
