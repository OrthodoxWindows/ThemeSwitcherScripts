@echo off
chcp 65001 > nul

echo ************************************************************
echo *                 Windows 10 Aero - Light                  *
echo *                                                          *
echo * Appuyer sur I pour plus d´informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo ***********************************************************************
echo * Auteur : Equipe de design de Microsoft                              *
echo * Type de thème : DWM-Effect, style visuel Windows 10 Aero            *
echo * Paramètres définis : Il s´agit du thème par défaut dans Windows 10, *
echo * avec des couleur clairs sur les éléments de la barre des tâches     *
echo ***********************************************************************
echo.

:APPLY
set /P c=Voulez-vous appliquer le thème Windows 10 Aero - Light ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\DWM-Effects_FR.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\Light.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - Aero" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart_FR.bat"

goto :END

:ABORT opération annulée
pause

:END