@echo off
chcp 65001 > nul

echo ***********************************************************
echo *        ThemeSwitcherScripts installation test           *
echo *                                                         *
echo *                      Version 1.0                        *
echo ***********************************************************
echo.

:CONFIRMATION
set /P c=Do you want to test the installation of programs used by ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :TEST)
if /I "%c%" EQU "N" (goto :ANNULATION)

:TEST
echo.
if exist %userprofile%\TSS (goto :ST) else (echo Installation folder does not exist
goto :ANNULATION)

:ST
echo.
if exist %userprofile%\TSS\classic\classicthemetray.exe (echo ClassicThemeTray is installed and activated)
if exist %userprofile%\TSS\classic\classicthemetray_old.exe (echo ClassicThemeTray is installed and disabled)
if not exist "%userprofile%\TSS\classic\" (echo ClassicThemeTray is not installed)

echo.
if exist %userprofile%\TSS\Basic\BasicThemer2.exe (echo BasicThemer2 is installed and activated)
if exist %userprofile%\TSS\Basic\BasicThemer2_old.exe (echo BasicThemer2 is installed and disabled)
if not exist "%userprofile%\TSS\Basic\" (BasicThemer2 is not installed)

echo.
if exist C:\Users\camil\TSS\ThemeSwitcher\ThemeSwitcher.exe (echo Winaero ThemeSwitcher is installed) else (echo Winaero ThemeSwitcher is not installed)

echo.
echo Task completed
goto :FIN

:ANNULATION
echo.
echo Task aborted
goto :FIN

:FIN
pause
end