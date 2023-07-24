@echo off
chcp 65001 > nul

echo ************************************************************
echo *             Windows 10 Contraste blanc élevé             *
echo *                                                          *
echo * Appuyer sur I pour plus d´informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo *************************************************************************************************
echo * Auteur : Equipe de design de Microsoft                                                        *
echo * Type de thème : DWM-Effect, style visuel Windows 10 Aerolite HC                               *
echo * Paramètres définis : Il s´agit d'un thème à contraste élevé inclu par défault dans Windows 10 *
echo *************************************************************************************************
echo.

:APPLY
set /P c=Voulez-vous appliquer le thème Windows 10 Contraste blanc élevé ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\DWM-Effects_FR.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Ease of Access Themes\hcwhite.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - High Contrast White" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart_FR.bat"

goto :END

:ABORT opération annulée
pause

:END