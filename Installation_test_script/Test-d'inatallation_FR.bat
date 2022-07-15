@echo off
chcp 65001 > nul

echo ***********************************************************
echo *      Test d'installation de ThemeSwitcherScripts        *
echo *                                                         *
echo *                      Version 1.0                        *
echo ***********************************************************
echo.

:CONFIRMATION
set /P c=Voulez-vous tester l'installation des programmes utilisés par ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :TEST)
if /I "%c%" EQU "N" (goto :ANNULATION)

:TEST
echo.
if exist %userprofile%\TSS (goto :ST) else (echo Le dossier d'installation n'existe pas
goto :ANNULATION)

:ST
echo.
if exist %userprofile%\TSS\classic\classicthemetray.exe (echo ClassicThemeTray est installé et activé)
if exist %userprofile%\TSS\classic\classicthemetray_old.exe (echo ClassicThemeTray est installé et désactivé)
if not exist "%userprofile%\TSS\classic\" (echo ClassicThemeTray n'est pas installé)

echo.
if exist %userprofile%\TSS\Basic\BasicThemer2.exe (echo BasicThemer2 est installé et activé)
if exist %userprofile%\TSS\Basic\BasicThemer2_old.exe (echo BasicThemer2 est installé et désactivé)
if not exist "%userprofile%\TSS\Basic\" (BasicThemer2 n'est pas installé)

echo.
if exist C:\Users\camil\TSS\ThemeSwitcher\ThemeSwitcher.exe (echo Winaero ThemeSwitcher est installé) else (echo Winaero ThemeSwitcher n'est pas installé)

echo.
echo Opération terminée
goto :FIN

:ANNULATION
echo.
echo Opération annulée
goto :FIN

:FIN
pause
end