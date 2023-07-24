@echo off
chcp 65001 > nul

echo **********************************************************
echo *                     Windows Classic                    *
echo *                                                        *
echo *       Press I for more information, C to continue      *
echo **********************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo *******************************************************************************************************
echo * Author : Microsoft design team                                                                      *
echo * Theme type : Classic                                                                                *
echo * Parameters set : This is a theme present in Windows ME, 2000, XP and Vista,                         *
echo * designed to look like to the default Windows 98 theme. However, the wallpaper is a different color. *
echo *******************************************************************************************************
echo.

:APPLY
set /P c=Do you want to apply the Windows Classic theme ?[Y\N]?
if /I "%c%" EQU "Y" (goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM

"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\WindowsClassic.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Windows Classic" "1-Normal"

call "%userprofile%\TSS\Switcher_Scripts\Classic_FR.bat"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart_FR.bat"

goto :END

:ABORT operation canceled
pause

:END