@echo off
chcp 65001 > nul

echo ***********************
echo *     Basic Theme     *
echo ***********************
echo.

set /P c=Do you want apply the basic theme ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CTT)
if /I "%c%" EQU "N" (goto :ABORT)

:CTT
if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo The classic theme has been disabled) else (echo The classic theme is already disabled)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\BasicThemer2.exe (echo The basic theme is already active) else (ren "%userprofile%\tss\basic\BasicThemer2_old.exe" basicthemer2.exe
echo The basic theme has been activated)
Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && echo AC || (start "" /D "%USERPROFILE%\TSS\Basic" basicthemer2.exe)

set /P c=Do you want to restart explorer ?[Y\N]?
if /I "%c%" EQU "Y" (TASKKILL /f /im explorer.exe
start explorer.exe)
if /I "%c%" EQU "N" (goto :MSG)

:MSG
echo Task completed
pause
goto :END

:ABORT
echo Task aborted
pause

:END
End