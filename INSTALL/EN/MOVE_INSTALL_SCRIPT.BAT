@echo off
chcp 65001 > nul

title Installation completed
color 2E
echo.
echo    *****************************************************************************************
echo    *                                                                                       *
echo    *                 The installation of ThemeSwitcherScripts was successful!              *
echo    *                                                                                       *
echo    *                          To modify or delete the installation,                        *
echo    *               go to the installer: "%userprofile%\TSS\INSTALL\INSTALL.EXE"            *
::echo    * To modify or delete the installation, go to the "installation management" program     *
::echo    *                  located in the "ThemeSwitcherScript" folder of your Start menu       *
::echo    *                                                                                       *
echo    *****************************************************************************************
echo.
pause
title Moving the installation script...
move "INSTALL.EXE" "%userprofile%\TSS\INSTALL\INSTALL.EXE"
pause
