@echo off
chcp 65001 > nul

echo ***********************************************************
echo *                Windows 10 Aerolite Basic                *
echo *                                                         *
echo *       Press I for more information, C to continue       *
echo ***********************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo ********************************************************************************
echo * Author : Microsoft design team                                               *
echo * Theme type : Basic, Windows 10 Aerolite Visual Style                         *
echo * Parameters set : This is the aerolite theme on Windows 10, but in Basic mode *
echo ********************************************************************************    
echo.

:APPLY
set /P c=Do you want to apply the Windows 10 Aerolite Basic theme ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\Basic_FR.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\aerolite.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - Aerolite" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart_FR.bat"

goto :END

:ABORT operation canceled
pause

:END