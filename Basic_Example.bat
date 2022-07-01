@echo off
chcp 65001 > nul

echo ************************************************************
echo *                  Exemple de Thème Basic                  *
echo *                                                          *
echo * Appuyer sur I pour plus d'informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" echo Auteur : OrthodoxWin32 Type de thème : basic Paramètres définis : Il s'agit d'un thème d'exemple, inactif. L'erreur de ThemeSwitcher est normal.
if "%errorlevel%"=="2" REM pause

set /P c=Voulez-vous appliquer le thème d'exemple ?[Y\N]?
if /I "%c%" EQU "Y" (start C:\ThemeSwitcher\Window~2\ThemeSwitcher.exe Exemple.theme
goto :CTT)
if /I "%c%" EQU "N" (goto :ANNULATION)

:CTT
if exist C:\Classic\ClassicThemeTray.exe (ren "C:\Classic\ClassicThemeTray.exe" ClassicThemeTray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start C:\Classic\ClassicThemeTray_old.exe /disable

Set BT2=BasicThemer2.exe
tasklist | find /i "%BT2%">nul  && echo Le thème basic est déjà activé || (start C:\Basic\BasicThemer2.exe
schtasks.exe /change /tn BasicTheme /ENABLE
echo Le thème basique a été activé)

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