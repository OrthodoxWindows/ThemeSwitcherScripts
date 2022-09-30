@echo off
chcp 65001 > nul

echo **********************
echo *    Thème Basic     *
echo **********************
echo.

set /P c=Voulez-vous appliquer le thème Basic ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CTT)
if /I "%c%" EQU "N" (goto :ABORT)

:CTT
if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\basicthemer2.exe (echo Le thème basic est déjà activé) else (ren "%userprofile%\tss\basic\BasicThemer2_old.exe" basicthemer2.exe
echo Le thème basic a été activé)
Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && echo AC || (start "" /D "%USERPROFILE%\TSS\Basic" BasicThemer2.exe)

set /P c=Voulez-vous redémarrer l'explorateur ?[Y\N]?
if /I "%c%" EQU "Y" (TASKKILL /f /im explorer.exe
start explorer.exe)
if /I "%c%" EQU "N" (goto :MSG)

:MSG
echo Tâche terminée
pause
goto :END

:ABORT
echo Opération annulée
pause

:END
End