@echo off
chcp 65001 > nul

echo ************************************************************
echo *                High Contrast #1 - Classic                *
echo *                                                          *
echo *        Press I for more information, C to continue       *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo ********************************************************************************************
echo * Author : Microsoft design team                                                           *
echo * Theme type : Classic                                                                     *
echo * Parameters set: This is a high contrast theme included by default in Windows ME and 2000 *
echo * The theme is still present in the registry in current versions of Windows                *
echo ********************************************************************************************
echo.

:APPLY
set /P c=Do you want to apply High Contrast #1 - Classic theme ?[Y\N]?
if /I "%c%" EQU "Y" (goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM

"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Ease of Access Themes\hc1classic.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "High Contrast #1" "1-Normal"

call "%userprofile%\TSS\Switcher_Scripts\Classic.bat"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT operation canceled
pause

:END
