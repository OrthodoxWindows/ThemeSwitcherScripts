@echo off
chcp 65001 > nul

::Mods Classique
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskdlg-fix" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskdlg-fix /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-uwp-fix" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-uwp-fix /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-lite" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-lite /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\disable-navigation-bar" /v "disabled" ^| find "0x0" ') do goto :NoShearchBar
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\hide-search-bar" /v "disabled" ^| find "0x0" ') do goto NoShearchBar
goto :ShearchBar
:NoShearchBar
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-search-fix" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-search-fix /v Disabled /t REG_DWORD /d 1 /f
goto :NoShearchBar2
:ShearchBar
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-search-fix" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer-search-fix /v Disabled /t REG_DWORD /d 0 /f
:NoShearchBar2
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "HighContrastTheme" ^| find "0x1" ') do goto :HC
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast /v Disabled /t REG_DWORD /d 0 /f
goto :FHC
:HC
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fake-high-contrast /v Disabled /t REG_DWORD /d 1 /f
:FHC

::Mods Basique-Classique
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-unextend-frames" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-unextend-frames /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\basic-classic-theme-ribbon-fix" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\basic-classic-theme-ribbon-fix /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-ghost-mods" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-ghost-mods /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-ghost-mods\Settings" /v "useClassicTheme" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\dwm-ghost-mods\Settings /v useClassicTheme /t REG_DWORD /d 1 /f

::Mods de démétroisation obligatoires si thème classique
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\eradicate-immersive-menus" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\eradicate-immersive-menus /v Disabled /t REG_DWORD /d 0 /f
::for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aerexplorer\Settings" /v "smalladdress" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aerexplorer\Settings /v smalladdress /t REG_DWORD /d 1 /f
::for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aerexplorer\Settings" /v "alwayscpl" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aerexplorer\Settings /v alwayscpl /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-search-bar" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-search-bar /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" ^| find "0x0" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v AltTabSettings /t REG_DWORD /d 1 /f

::Mods de démétroisation non-obligatoires
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "Metro" ^| find "0x1" ') do goto :1

for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskbar-buttons-lite-vs-without-spacing" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskbar-buttons-lite-vs-without-spacing /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-clock-flyout" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-clock-flyout /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "EnableLegacyBalloonNotifications" ^| find "0x0" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer /v EnableLegacyBalloonNotifications /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell /v UseWin32BatteryFlyout /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC /v EnableMtcUvc /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\titlebar-for-everyone" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\titlebar-for-everyone /v Disabled /t REG_DWORD /d 0 /f
::for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aero-tray" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aero-tray /v Disabled /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\shrink-address-bar-height" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\shrink-address-bar-height /v Disabled /t REG_DWORD /d 0 /f
goto :2

:1
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskbar-buttons-lite-vs-without-spacing" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-taskbar-buttons-lite-vs-without-spacing /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@kill-appframe-uwp /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-clock-flyout" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\legacy-clock-flyout /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "EnableLegacyBalloonNotifications" ^| find "0x1" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer /v EnableLegacyBalloonNotifications /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell /v UseWin32BatteryFlyout /t REG_DWORD /d 0 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC /v EnableMtcUvc /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\titlebar-for-everyone" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\titlebar-for-everyone /v Disabled /t REG_DWORD /d 1 /f
::for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aero-tray" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\aero-tray /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\shrink-address-bar-height" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\shrink-address-bar-height /v Disabled /t REG_DWORD /d 1 /f

::Mods basiques
:2
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fix-basic-caption-text" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\fix-basic-caption-text /v Disabled /t REG_DWORD /d 1 /f

::Mods d'explorateur classique
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\ThemeSwitcherScripts\Settings" /v "ClassicExplorer" ^| find "0x1" ') do goto :CE
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar /v Disabled /t REG_DWORD /d 1 /f
goto :NCE
:CE
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar" /v "disabled" ^| find "0x1" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\win7-command-bar /v Disabled /t REG_DWORD /d 0 /f

:NCE

::Mods DWM
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\themed-regedit-listview" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\themed-regedit-listview /v Disabled /t REG_DWORD /d 1 /f

::Mods de thème classique partiel
for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@untheme /v Disabled /t REG_DWORD /d 1 /f

for /f "tokens=3 " %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition" /v "disabled" ^| find "0x0" ') do REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\local@unthemed-nocomposition /v Disabled /t REG_DWORD /d 1 /f
for /f "tokens=3 " %%i in ('reg query "HKEY_CURRENT_USER\SOFTWARE\OpenShell\StartMenu\Settings" /v "CustomTaskbar" ^| find "0x0" ') do REG ADD HKEY_CURRENT_USER\SOFTWARE\OpenShell\StartMenu\Settings /v CustomTaskbar /t REG_DWORD /d 1 /f

