@echo off
chcp 65001 > nul

echo ************************************************************
echo *                    Windows Standard                      *
echo *                                                          *
echo * Appuyer sur I pour plus d´informations, C pour continuer *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo **************************************************************************************
echo * Auteur : Equipe de design de Microsoft                                             *
echo * Type de thème : Classic                                                            *
echo * Paramètres définis : Il s´agit du thème par défaut dans Windows ME et 2000         *
echo * C´est le thème classique par défaut dans les version ultérieurs de Windows         *
echo * Le thème est encore présent dans le registre dans les version actuelles de Windows *
echo **************************************************************************************
echo.

:APPLY
set /P c=Voulez-vous appliquer le thème Windows Standard ?[Y\N]?
if /I "%c%" EQU "Y" (goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM

"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\WindowsStandard.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Windows Standard" "1-Normal"

call "%userprofile%\TSS\Switcher_Scripts\Classic.bat"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT opération annulée
pause

:END
