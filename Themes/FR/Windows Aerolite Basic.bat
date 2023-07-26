@echo off
chcp 65001 > nul

echo ************************************************************
echo *               Windows 10 Aerolite Basique                *
echo *                                                          *
echo * Appuyer sur I pour plus d´informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo ****************************************************************************************
echo * Auteur : Equipe de design de Microsoft                                               *
echo * Type de thème : Basic, style visuel Windows 10 Aerolite                              *
echo * Paramètres définis : Il s´agit du thème Aerolite de Windows 10, mais en mode Basique *
echo ****************************************************************************************    
echo.

:APPLY
set /P c=Voulez-vous appliquer le thème Windows 10 Aerolite Basique ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\Basic.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\aerolite.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - Aerolite" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT opération annulée
pause

:END
