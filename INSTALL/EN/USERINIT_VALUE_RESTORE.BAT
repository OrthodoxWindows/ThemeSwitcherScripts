@echo off
chcp 65001 > nul

title Reset userinit value
color 41
echo.
echo   **********************************************
echo   *  Do you want to reset the userinit value?  *
echo   **********************************************
echo.
echo This will render ThemeSwitcherScripts inoperative.
echo.
echo          Press Y to confirm, N to cancel.
echo.

CHOICE /C YN
if "%errorlevel%"=="1" (goto :RESTORE_USER_INIT)
if "%errorlevel%"=="2" (goto :ABORT)

:RESTORE_USER_INIT
title Restoring userinit value...
FOR /F %%i in ('type userinit.txt') do REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d ""%%i""
title Restoration performed
echo.
echo Restoration performed
echo.
pause
goto :END

:ABORT
title Operation canceled
echo.
echo Operation canceled
echo.
pause
goto :END

:END
