@echo off
chcp 65001 > nul

echo ************************************************************
echo *                    Windows Classique                     *
echo *                                                          *
echo * Appuyer sur I pour plus d´informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo *****************************************************************************************
echo * Auteur : Equipe de design de Microsoft                                                *
echo * Type de thème : Classic                                                               *
echo * Paramètres définis : Il s´agit d'un thème présent dans Windows ME, 2000, XP et Vista, *
echo * concu pour ressembler au thème par défault de Windows 98.                             *
echo * Le fond d'écran est cepandant d'une couleur différente.                               *
echo *****************************************************************************************
echo.

:APPLY
set /P c=Voulez-vous appliquer le thème Windows Classique ?[Y\N]?
if /I "%c%" EQU "Y" (goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM

"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\WindowsClassic.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Windows Classic" "1-Normal"

call "%userprofile%\TSS\Switcher_Scripts\Classic.bat"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT opération annulée
pause

:END
