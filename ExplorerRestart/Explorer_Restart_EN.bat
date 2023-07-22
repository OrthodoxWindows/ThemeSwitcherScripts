@echo off
chcp 65001 > nul

set /P c=Do you want to restart explorer ?[Y\N]?
if /I "%c%" EQU "Y" (TASKKILL /f /im explorer.exe
goto :1)
if /I "%c%" EQU "N" (goto :MSG)

:1
Set 7+=7+ Taskbar Tweaker.exe
tasklist | find /i "%7+%">nul  && (TASKKILL /f /im "7+ Taskbar Tweaker.exe"
goto :2) || goto :2

:2
start explorer.exe
timeout /t 5
if exist "%userprofile%\AppData\Local\Programs\7+ Taskbar Tweaker\7+ Taskbar Tweaker.exe" (start "" /D "%userprofile%\AppData\Local\Programs\7+ Taskbar Tweaker" "7+ Taskbar Tweaker.exe")
goto :END

:MSG Task aborted

:END
