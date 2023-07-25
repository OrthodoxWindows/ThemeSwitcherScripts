@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\uxsms.exe (goto :2) else (ren "%userprofile%\tss\basic\uxsms_old.exe" uxsms.exe
echo Le thème basic a été activé)
:2
Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && echo Le thème basic est déjà activé || (start "" /D "%USERPROFILE%\TSS\Basic" uxsms.exe)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /t REG_DWORD /d 0

set /P c=Voulez-vous redémarrer l'explorateur ?[Y\N]?
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
echo Tâche terminée
