@echo off
chcp 65001 > nul

echo ************************************************************
echo *              Windows 10 - Autocolorization               *
echo *                                                          *
echo *       Press I for more information, C to continue        *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo **********************************************************************************************************
echo * Author : Microsoft design team                                                                         *
echo * Theme type : DWM-Effect, Windows 10 Aero Visual Style (Autocolorization)                               *
echo * Parameters set : This is a theme included by default in Windows 10, with a slideshow in the background *
echo **********************************************************************************************************
echo.

:APPLY
set /P c=Do you want to apply the Windows 10 - Autocolorization theme ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\DWM-Effects.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\theme1.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - Aero" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT operation canceled
pause

:END
