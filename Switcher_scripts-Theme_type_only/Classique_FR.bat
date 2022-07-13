@echo off
chcp 65001 > nul

echo ***************************
echo *     Thème Classique     *
echo ***************************
echo.

set /P c=Voulez-vous appliquer le thème classique ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CTT)
if /I "%c%" EQU "N" (goto :ANNULATION)

:CTT
if exist %userprofile%\tss\classic\classicthemetray.exe (echo Le thème classique est déjà activé) else (ren "%userprofile%\tss\classic\classicthemetray_old.exe" classicthemetray.exe
echo Le thème classique a été activé)

Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && (TASKKILL /f /im BasicThemer2.exe) || echo INA
if exist %userprofile%\tss\basic\basicthemer2.exe (ren "%userprofile%\tss\basic\basicthemer2.exe" BasicThemer2_old.exe
echo Le thème basic a été désactivé) else (echo Le thème basic est déjà désactivé)

start %userprofile%\TSS\classic\classicthemetray.exe /enable

set /P c=Voulez-vous redémarrer l'explorateur ?[Y\N]?
if /I "%c%" EQU "Y" (TASKKILL /f /im explorer.exe
start explorer.exe)
if /I "%c%" EQU "N" (goto :MSG)

:MSG
echo Tâche terminée
pause
goto :FIN

:ANNULATION
echo Opération annulée
pause

:FIN
End
