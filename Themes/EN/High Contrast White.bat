@echo off
chcp 65001 > nul

echo ************************************************************
echo *             Windows 10 High Contrast White               *
echo *                                                          *
echo *       Press I for more information, C to continue        *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo ***********************************************************************************
echo * Author : Microsoft design team                                                  *
echo * Theme type : DWM-Effect, Windows 10 Aerolite HC Visual style                    *
echo * Parameters set: This is a high contrast theme included by default in Windows 10 *
echo ***********************************************************************************
echo.

:APPLY
set /P c=Do you want to apply Windows 10 High Contrast White theme ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\DWM-Effects.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Ease of Access Themes\hcwhite.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - High Contrast White" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT operation canceled
pause

:END
