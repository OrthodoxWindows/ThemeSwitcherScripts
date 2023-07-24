@echo off
chcp 65001 > nul

title Installation terminée
color 2E
echo.
echo    ********************************************************************************************************
echo    *                                                                                                      *
echo    *                 L’installation de ThemeSwitcherScripts s’est déroulée avec succès !                  *
echo    *                                                                                                      *
echo    *                               Pour modifier ou supprimer l’installation,                             *
echo    *        rendez-vous dans le programme d’installation : "%userprofile%\TSS\INSTALL\INSTALL.EXE"        *
::echo    * Pour modifier ou supprimer l’installation, rendez-vous dans le programme "gestion de l’installation" *
::echo    *                  situé dans le dossier "ThemeSwitcherScript" de votre menu Démarrer                  *
::echo    *                                                                                                      *
echo    ********************************************************************************************************
echo.
pause
title Déplacement du script d'installation...
move "INSTALL.EXE" "%userprofile%\TSS\INSTALL\INSTALL.EXE"
pause
