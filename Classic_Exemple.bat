@echo off
chcp 65001 > nul

echo ************************************************************
echo *                Exemple de Thème Classique                *
echo *                                                          *
echo * Appuyer sur I pour plus d'informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" echo Auteur : OrthodoxWin32 Type de thème : classique Paramètres définis : Il s'agit d'un thème d'exemple, inactif. L'erreur de ThemeSwitcher est normal.
if "%errorlevel%"=="2" REM pause

set /P c=Voulez-vous appliquer le thème d'exemple ?[Y\N]?
if /I "%c%" EQU "Y" (Start C:\ThemeSwitcher\Window~2\ThemeSwitcher.exe Exemple.theme
goto :CTT)
if /I "%c%" EQU "N" (goto :ANNULATION)

:CTT
if exist C:\Classic\ClassicThemeTray.exe (echo Le thème classique est déjà activé) else (ren "C:\Classic\ClassicThemeTray_old.exe" ClassicThemeTray.exe
echo Le thème classique a été activé)

Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && (TASKKILL /f /im BasicThemer2.exe
schtasks.exe /change /tn basictheme /DISABLE
echo Le thème basic a été désactivé) || echo Le thème basic est déjà désactivé

start C:\Classic\ClassicThemeTray.exe /enable

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