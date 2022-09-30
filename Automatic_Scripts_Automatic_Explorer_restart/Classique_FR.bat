@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (echo Le thème classique est déjà activé) else (ren "%userprofile%\tss\classic\classicthemetray_old.exe" classicthemetray.exe
echo Le thème classique a été activé)

Set BT2=basicthemer2.exe
tasklist | find /i "%BT2%">nul  && (TASKKILL /f /im basicthemer2.exe) || echo INA
if exist "%userprofile%"\tss\basic\basicthemer2.exe (ren "%userprofile%\tss\basic\basicthemer2.exe" basicthemer2_old.exe
echo Le thème basic a été désactivé) else (echo Le thème basic est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray.exe /enable

TASKKILL /f /im explorer.exe
start explorer.exe

:MSG
echo Tâche terminée
End
