@echo off
chcp 65001 > nul

for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "ClassicStyle" ^| find "0x1" ') do goto :CS
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar /v Disabled /t REG_DWORD /d 1 /f
goto :MS
:CS
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar /v Disabled /t REG_DWORD /d 0 /f
:MS
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskdlg-fix" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskdlg-fix /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-uwp-fix" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-uwp-fix /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-lite" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-lite /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "HighContrastTheme" ^| find "0x1" ') do goto :HC
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "ForceFakeHighContrast" ^| find "0x0" ') do goto :HC
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast /v Disabled /t REG_DWORD /d 0 /f
goto :FHC
:HC
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast /v Disabled /t REG_DWORD /d 1 /f
:FHC
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-unextend-frames" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-unextend-frames /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-ghost-mods" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-ghost-mods /v Disabled /t REG_DWORD /d 1 /f

for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "ClassicStyle" ^| find "0x1" ') do goto :CS2
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@aerexplorer" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@aerexplorer /v Disabled /t REG_DWORD /d 1 /f
goto :MS2
:CS2
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@aerexplorer" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@aerexplorer /v Disabled /t REG_DWORD /d 0 /f
:MS2

for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "Metro" ^| find "0x1" ') do goto :1

for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\eradicate-immersive-menus" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\eradicate-immersive-menus /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-search-bar" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-search-bar /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@classic-taskbar-buttons-lite-vs-fork" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@classic-taskbar-buttons-lite-vs-fork /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win32-tray-clock-experience" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win32-tray-clock-experience /v Disabled /t REG_DWORD /d 0 /f
goto :2

:1
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\eradicate-immersive-menus" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\eradicate-immersive-menus /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-search-bar" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-search-bar /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@classic-taskbar-buttons-lite-vs-fork" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@classic-taskbar-buttons-lite-vs-fork /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win32-tray-clock-experience" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win32-tray-clock-experience /v Disabled /t REG_DWORD /d 1 /f

:2
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fix-basic-caption-text" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fix-basic-caption-text /v Disabled /t REG_DWORD /d 0 /f

for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /t REG_DWORD /d 1 /f

for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /t REG_DWORD /d 1 /f