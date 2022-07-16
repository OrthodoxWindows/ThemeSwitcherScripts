@echo off
chcp 65001 > nul

echo ***************************
echo *      Classic Theme      *
echo ***************************
echo.

set /P c=Do you want apply the classic theme ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CTT)
if /I "%c%" EQU "N" (goto :ANNULATION)

:CTT
if exist %userprofile%\tss\classic\classicthemetray.exe (echo The classic theme is already active) else (ren "%userprofile%\tss\classic\classicthemetray_old.exe" classicthemetray.exe
echo The classic theme has been activated)

Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && (TASKKILL /f /im BasicThemer2.exe) || echo INA
if exist %userprofile%\tss\basic\basicthemer2.exe (ren "%userprofile%\tss\basic\basicthemer2.exe" BasicThemer2_old.exe
echo The basic theme has been disabled) else (echo The basic theme is already disabled)

start %userprofile%\TSS\classic\classicthemetray.exe /enable

set /P c=Do you want to restart explorer ?[Y\N]?
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
