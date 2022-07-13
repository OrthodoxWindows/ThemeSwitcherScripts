@echo off
chcp 65001 > nul

echo **********************
echo *    Thème Basic     *
echo **********************
echo.

set /P c=Voulez-vous appliquer le thème Basic ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CTT)
if /I "%c%" EQU "N" (goto :ANNULATION)

:CTT
if exist %userprofile%\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" ClassicThemeTray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start %userprofile%\TSS\classic\classicthemetray_old.exe /disable

Set BT2=BasicThemer2.exe
tasklist | find /i "%BT2%">nul  && echo AC || (start C:\TSS\BasicTheme\BasicThemer2.exe)
if exist %userprofile%\tss\basic\BasicThemer2.exe (echo Le thème basic est déjà activé) else (ren "%userprofile%\tss\basic\BasicThemer2_old.exe" BasicThemer2.exe
echo Le thème basic a été activé)

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
