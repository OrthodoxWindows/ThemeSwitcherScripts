@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (echo Le thème classique est déjà activé) else (ren "%userprofile%\tss\classic\classicthemetray_old.exe" classicthemetray.exe
echo Le thème classique a été activé)

if exist "%userprofile%"\tss\basic\uxsms.exe (goto :2) else (ren "%userprofile%\tss\basic\uxsms_old.exe" uxsms.exe
echo Le thème basic a été activé)
:2
Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && echo Le thème basic est déjà activé || (start "" /D "%USERPROFILE%\TSS\Basic" uxsms.exe)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray.exe /enable

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@disable-dwm-extended-frames /v Disabled /t REG_DWORD /d 0
if exist "%userprofile%\tss\Task_Scripts\@DDEF.bat" (echo Les cadres étendus de DWM sont déjà désactivés) else (ren "%userprofile%\tss\Task_Scripts\@DDEF_old.bat" @DDEF.bat
echo Les cadres étendus de DWM ont été désactivés)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%\tss\Task_Scripts\@UT.bat" (ren "%userprofile%\tss\Task_Scripts\@UT.bat" @UT_old.bat
echo La composition dans la zone cliente a été activé) else (echo La composition dans la zone cliente est déjà activé)

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /t REG_DWORD /d 1
if exist "%userprofile%\tss\Task_Scripts\@UTNC.bat" (ren "%userprofile%\tss\Task_Scripts\@UTNC.bat" @UTNC_old.bat
echo La composition intégrale dans la zone cliente a été activé) else (echo La composition intégrale dans la zone cliente est déjà activé)

if exist "%userprofile%\tss\Task_Scripts\@CTEX.bat" (echo La barre des tâches classique est déjà activé) else (ren "%userprofile%\tss\Task_Scripts\@CTEX_old.bat" @CTEX.bat
echo La barre des tâches classique à été activé)

:MSG
echo Tâche terminée
