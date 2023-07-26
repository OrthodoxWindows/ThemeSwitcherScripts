@echo off
chcp 65001 > nul

echo ************************************************************
echo *             Windows 10 - Autocolorization                *
echo *                                                          *
echo * Appuyer sur I pour plus d´informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo ********************************************************************************************
echo * Auteur : Equipe de design de Microsoft                                                   *
echo * Type de thème : DWM-Effect, style visuel Windows 10 Aero (Autolorization)                *
echo * Paramètres définis : Thème par défaut dans Windows 10, avec un diaporama en arrière-plan *
echo ********************************************************************************************
echo.

:APPLY
set /P c=Voulez-vous appliquer le thème Windows 10 - Autocolorization ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\DWM-Effects.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\theme1.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - Aero" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT opération annulée
pause

:END
