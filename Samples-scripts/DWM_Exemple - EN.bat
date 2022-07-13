@echo off
chcp 65001 > nul

echo ************************************************************
echo *                    Sample DWM Theme                      *
echo *                                                          *
echo *        Press I for more info, press C to continue        *
echo ************************************************************
echo.

CHOICE /C IC
if "%errorlevel%"=="1" echo Author : OrthodoxWin32 Theme type : DWM Defined parameters : This theme is a sample, inactive theme. The ThemeSwitcher error is normal.
if "%errorlevel%"=="2" REM pause

set /P c=Do you want apply the sample theme ?[Y\N]?
if /I "%c%" EQU "Y" (Start %userprofile%\TSS\ThemeSwitcher\ThemeSwitcher.exe Exemple.theme
goto :CTT)
if /I "%c%" EQU "N" (goto :ANNULATION)

:CTT
if exist %userprofile%\TSS\classic\classicthemetray.exe (ren "%userprofile%\classic\TSS\classicthemetray.exe" ClassicThemeTray_old.exe
echo The classic theme has been disabled) else (echo The classic theme is already disabled)

start %userprofile%\TSS\classic\classicthemetray_old.exe /disable

Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && (TASKKILL /f /im BasicThemer2.exe) || echo 0
if exist %userprofile%\tss\basic\basicthemer2.exe (ren "%userprofile%\tss\basic\basicthemer2.exe" BasicThemer2_old.exe
echo The basic theme has been disabled) else (echo The basic theme is already disabled)

set /P c=Voulez-vous redémarrer l'explorateur ?[Y\N]?
if /I "%c%" EQU "Y" (TASKKILL /f /im explorer.exe
start explorer.exe)
if /I "%c%" EQU "N" (goto :MSG)

:MSG
echo Task completed
pause
goto :FIN

:ANNULATION
echo Task aborted
pause

:FIN
End
