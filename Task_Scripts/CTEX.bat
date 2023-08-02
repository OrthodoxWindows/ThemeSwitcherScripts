@echo off
chcp 65001 > nul

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\classic-theme-explorer /v Disabled /t REG_DWORD /d 0
