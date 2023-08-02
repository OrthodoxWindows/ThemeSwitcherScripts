@echo off
chcp 65001 > nul

REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\unthemed-nocomposition /v Disabled /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Windhawk\Engine\Mods\unthemed-nocomposition /v Disabled /t REG_DWORD /d 0
