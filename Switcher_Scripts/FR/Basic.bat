@echo off
chcp 65001 > nul

if exist "%userprofile%"\tss\classic\classicthemetray.exe (ren "%userprofile%\tss\classic\classicthemetray.exe" classicthemetray_old.exe
echo Le thème classique a été désactivé) else (echo Le thème classique est déjà désactivé)

start "" /D "%USERPROFILE%\TSS\classic" classicthemetray_old.exe /disable

if exist "%userprofile%"\tss\basic\uxsms.exe (goto :2) else (ren "%userprofile%\tss\basic\uxsms_old.exe" uxsms.exe
echo Le thème basic a été activé)
:2
Set BT5=uxsms.exe
tasklist | find /i "%BT5%">nul  && echo Le thème basic est déjà activé || (start "" /D "%USERPROFILE%\TSS\Basic" uxsms.exe)

for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "Metro" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v Metro /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles" /v "Classic" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v Classic /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles" /v "Basic-Classic" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v Basic-Classic /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles" /v "DWM-Style" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v DWM-Style /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles" /v "DWM-Classic-Integral" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v DWM-Classic-Integral /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles" /v "DWM-Classic-NoClassicScrollbar" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v DWM-Classic-NoClassicScrollbar /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles" /v "Basic" ^| find "0x0" ') do (REG ADD HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Profiles /v Basic /t REG_DWORD /d 1 /f
call "%userprofile%\tss\task_scripts\@BasicMods.bat")

:MSG
echo Tâche terminée