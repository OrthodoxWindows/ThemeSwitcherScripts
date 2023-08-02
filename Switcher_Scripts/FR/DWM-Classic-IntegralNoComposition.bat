@echo off
chcp 65001 > nul

if exist "%userprofile%"\TSS\classic\classicthemetray.exe (ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && (TASKKILL /f /im uxsms.exe) || goto :1
:1
if exist "%userprofile%"\tss\basic\uxsms.exe (ren "%userprofile%\tss\basic\uxsms.exe" uxsms_old.exe
echo Le thème basic a été désactivé) else (echo Le thème basic est déjà désactivé)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /t REG_DWORD /d 0
if exist "%userprofile%\tss\Task_Scripts\@DDEF.bat" (echo Les cadres étendus de DWM sont déjà désactivés) else (ren "%userprofile%\tss\Task_Scripts\@DDEF_old.bat" @DDEF.bat
echo Les cadres étendus de DWM ont été désactivés)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /t REG_DWORD /d 0
if exist "%userprofile%\tss\Task_Scripts\@UT.bat" (echo La composition dans la zone cliente est déjà désactivé) else (ren "%userprofile%\tss\Task_Scripts\@UT_old.bat" @UT.bat
echo La composition dans la zone cliente a été désactivé)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%\tss\Task_Scripts\@UTNC.bat" (ren "%userprofile%\tss\Task_Scripts\@UTNC.bat" @UTNC_old.bat
echo La composition intégrale dans la zone cliente a été désactivé) else (echo La composition intégrale dans la zone cliente est déjà désactivé)

if exist "%userprofile%\tss\Task_Scripts\@CTEX.bat" (ren "%userprofile%\tss\Task_Scripts\@CTEX.bat" @CTEX_old.bat
echo La barre des tâches classique à été désactivé) else (echo La barre des tâches classique est déjà désactivé)

:MSG
echo Tâche terminée
