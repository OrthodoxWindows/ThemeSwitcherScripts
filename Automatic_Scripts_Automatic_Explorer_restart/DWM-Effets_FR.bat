@echo off
chcp 65001 > nul

if exist "%userprofile%"\TSS\classic\classicthemetray.exe (ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && (TASKKILL /f /im basicthemer2.exe) || echo INA
if exist "%userprofile%"\tss\basic\basicthemer2.exe (ren "%userprofile%\tss\basic\basicthemer2.exe" basicthemer2_old.exe
echo Le thème basic a été désactivé) else (echo Le thème basic est déjà désactivé)

TASKKILL /f /im explorer.exe
start explorer.exe

:MSG
echo Tâche terminée
End