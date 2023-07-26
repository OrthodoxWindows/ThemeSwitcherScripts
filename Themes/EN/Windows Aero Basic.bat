@echo off
chcp 65001 > nul

echo ************************************************************
echo *                 Windows 10 Aero Basic                    *
echo *                                                          *
echo *       Press I for more information, C to continue        *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" goto :INF
if "%errorlevel%"=="2" goto :APPLY

:INF
echo.
echo *******************************************************************************
echo * Author : Microsoft design team                                              *
echo * Theme type : Basic, Windows 10 Aero Visual Style                            *
echo * Parameters set : This is the default theme in Windows 10, but in Basic mode *
echo *******************************************************************************
echo.

:APPLY
set /P c=Do you want to apply the Windows 10 Aero Basic theme ?[Y\N]?
if /I "%c%" EQU "Y" (call "%userprofile%\TSS\Switcher_Scripts\Basic.bat"
goto :THM)
if /I "%c%" EQU "N" (goto :ABORT)

:THM
"%userprofile%\TSS\WTS\ThemeSwitcher.exe" "C:\Windows\Resources\Themes\aero.theme"

start "" /D "%userprofile%\TSS\CTC" "Themes_W10.exe" @appearance /Apply "Win10 - Aero" "Normal"

call "%userprofile%\TSS\Explorer_Restart\Explorer_Restart.bat"

goto :END

:ABORT operation canceled
pause

:END
