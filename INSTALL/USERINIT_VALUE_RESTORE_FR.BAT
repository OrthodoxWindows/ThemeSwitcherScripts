@echo off
chcp 65001 > nul

title Réinitialisation de la valeur userinit
color 41
echo.
echo **********************************************
echo * Voulez-vous restaurer la valeur userinit ? *
echo **********************************************
echo.
echo  Cela rendra peut-être ThemeSwitcherScripts innopérent.
echo.
echo             Appuyez sur Y pour confirmer,
echo                   N pour annuler.
echo.

CHOICE /C YN
if "%errorlevel%"=="1" (goto :RESTORE_USER_INIT)
if "%errorlevel%"=="2" (goto :ABORT)

:RESTORE_USER_INIT
title restauration de la sous-clef userinit...
FOR /F %%i in ('type userinit.txt') do REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d ""%%i""
title Restauration effectuée
echo.
echo Restauration effectuée
echo.
pause
goto :END

:ABORT
title Opération annulée
echo.
echo Opération annulée
echo.
pause
goto :END

:END
