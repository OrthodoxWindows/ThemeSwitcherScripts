@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo The classic theme has been disabled) else (echo The classic theme is already disabled)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\BasicThemer2.exe (echo The basic theme is already active) else (ren "%userprofile%\tss\basic\BasicThemer2_old.exe" basicthemer2.exe
echo The basic theme has been activated)
Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && echo AC || (start "" /D "%USERPROFILE%\TSS\Basic" basicthemer2.exe)

:MSG
echo Task completed
End