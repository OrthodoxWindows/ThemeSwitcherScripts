@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (echo Le thème classique est déjà activé) else (ren "%userprofile%\tss\classic\classicthemetray_old.exe" classicthemetray.exe
echo Le thème classique a été activé)

Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && (TASKKILL /f /im uxsms.exe) || goto :1
:1
if exist "%userprofile%"\tss\basic\uxsms.exe (ren "%userprofile%\tss\basic\uxsms.exe" uxsms_old.exe
echo Le thème basic a été désactivé) else (echo Le thème basic est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray.exe /enable

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
