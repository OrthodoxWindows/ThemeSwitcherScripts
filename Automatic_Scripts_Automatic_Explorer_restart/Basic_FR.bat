@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\basicthemer2.exe (echo Le thème basic est déjà activé) else (ren "%userprofile%\tss\basic\BasicThemer2_old.exe" basicthemer2.exe
echo Le thème basic a été activé)
Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && echo AC || (start "" /D "%USERPROFILE%\TSS\Basic" BasicThemer2.exe)

TASKKILL /f /im explorer.exe
start explorer.exe

:MSG
echo Tâche terminée
End