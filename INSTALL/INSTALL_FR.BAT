@echo off
chcp 65001 > nul

:MENU
title Menu d'installation de ThemeSwitcherScripts
color 0F
echo **************************************************************************************************************
echo *                           Bienvenue dans l’installation de ThemeSwitcherScripts                            *
echo *                                                                                                            *
echo * Appuyez sur I pour installer TSS, R pour réparer TSS, D pour désinstaller TSS, A pour quitter le programme *
echo **************************************************************************************************************
echo.

CHOICE /C IRUA
if "%errorlevel%"=="1" goto :INSTALL
if "%errorlevel%"=="2" goto :REPAIR
if "%errorlevel%"=="3" goto :UNINSTALL
if "%errorlevel%"=="4" goto :ABORT
echo.

:REPAIR
title Menu de réparation de ThemeSwitcherScripts
color 47
echo ***********************************************
echo *     Réparation de ThemeSwitcherScripts      *
echo *                                             *
echo * Appuyez sur P pour réparer les programmes,  *
echo *    T pour réparer les tâches planifiés,     *
echo *       R pour réparer la clef userinit,      *
echo *     A pour revenir à l’étape précédente     *
echo ***********************************************
echo.

CHOICE /C PTRA
if "%errorlevel%"=="1" goto :PROGRAMS_INSTALL_R
if "%errorlevel%"=="2" goto :SCHDTASKS_R
if "%errorlevel%"=="3" goto :USERINIT_REG_KEY_R
if "%errorlevel%"=="4" goto :MENU

:UNINSTALL
title Menu de désinstallation de ThemeSwitcherScripts
color 3E
echo *********************************************************************************
echo *                 Désinstallation de ThemeSwitcherScripts                       *
echo *                                                                               *
echo *                  Appuyez sur D pour tout désinstaller,                        *
echo * R pour restaurer la sous-clef userinit à son état antérieur à l’installation, *
echo *                   A pour revenir à l’étape précédente                         *
echo *********************************************************************************
echo.

CHOICE /C DRA
if "%errorlevel%"=="1" goto :UNINSTALL_PROGRAMS
if "%errorlevel%"=="2" goto :RESTORE_USER_INIT
if "%errorlevel%"=="3" goto :MENU

::*********************************************************************************
:INSTALL
title En attente de confirmation...
color 17
set /P c=Voulez-vous installer ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS)
if /I "%c%" EQU "N" (goto :MENU)

:PROGRAMS
title Installation des programmes...
color 9F
echo.
echo Voulez-vous installer les programmes requis ?
echo.
echo Vous avez besoin de Curl installé pour pour cette étape de l’installation
set /P c=Vous avez besoin d'une connexion internet active pour cette étape de l'installation.[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS_INSTALL)
if /I "%c%" EQU "N" (goto :ABORT)

:PROGRAMS_INSTALL
if exist "C:\Windows\system32\curl.exe" (echo Curl est installé sur votre système. L’installation peut se poursuivre.
goto :BASICTHEMER5) else (echo Curl n’est pas pas installé sur votre système. Veuillez installer Curl)
echo.
echo https://curl.se/windows/
echo https://devstory.net/11617/installer-curl-sur-windows
echo.
pause
goto :PROGRAMS
::ajouter l'installation automatique de Curl

:BASICTHEMER5
pause
title Installation de BasicThemer5...
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")

echo(
echo     Le téléchargement de "uxsms.exe" est en progression ...
echo.

curl "https://github.com/arukateru/BasicThemer5/releases/download/1/uxsms.exe" -L --output "C:\TSS\uxsms.exe"

if not exist "%userprofile%\TSS\Basic" (mkdir "%userprofile%\TSS\Basic")

if exist C:\TSS\uxsms.exe (move "C:\TSS\Basic\uxsms.exe" "%userprofile%\TSS\Basic") else (echo BasicThemer5 n’est pas dans le dossier du script d’installation en cours d’exécution. Veuillez réassayer.
goto :RBT5)
echo.
echo Suppresion du dossier temporaire...
echo.
rmdir /s /q C:\TSS\Basic
if exist "%userprofile%\TSS\Basic\uxsms.exe" (echo BasicThemer5 a été correctement installé
goto :SBT5) else (echo BasicThemer5 n’a pas été installé correctement. Veuillez réessayer.
goto :RBT5)
:RBT5
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :BASICTHEMER5)
if /I "%c%" EQU "N" (goto :MENU)
:SBT5
title En attente de confirmation...
pause

:CLASSICTHEMETRAY
title Installation de ClassicThemeTray...
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     Le téléchargement de "ClassicThemeTray.exe" est en progression ...
echo.

curl "https://github.com/spitfirex86/ClassicThemeTray/releases/download/v1.1.0/ClassicThemeTray.exe" -L --output "C:\TSS\ClassicThemeTray.exe"

if not exist "%userprofile%\TSS\Classic" (mkdir "%userprofile%\TSS\Classic")

if exist C:\TSS\classicthemetray.exe (move "C:\TSS\classicthemetray.exe" "%userprofile%\TSS\Classic") else (echo Classicthemetray n’est pas dans le dossier du script d’installation en cours d’exécution. Veuillez réassayer.
goto :RCTT)

if exist "%userprofile%\TSS\Classic\ClassicThemeTray.exe" (echo ClassicThemeTray a été correctement installé
goto :SCTT) else (echo ClassicThemeTray n’a pas été installé correctement. Veuillez réessayer.
goto :RCTT)
:RCTT
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTHEMETRAY)
if /I "%c%" EQU "N" (goto :MENU)
:SCTT
pause
title En attente de confirmation...

:WCTC
title Installation de WinClassicThemeConfig...
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     Le téléchargement de "Themes_W10.exe" est en progression ...
echo.

curl "https://ncloud5.zaclys.com/index.php/s/J7mCiwboseac2g9/download/Themes_W10.exe" -L --output "C:\TSS\Themes_W10.exe"

if not exist "%userprofile%\TSS\CTC" (mkdir "%userprofile%\TSS\CTC")

if exist C:\TSS\Themes_W10.exe (move "C:\TSS\Themes_W10.exe" "%userprofile%\TSS\CTC") else (echo WinClassicThemeConfig n’est pas dans le dossier du script d’installation en cours d’exécution. Veuillez réassayer.
goto :RWCTC)

if exist "%userprofile%\TSS\CTC\Themes_W10.exe" (echo WinClassicThemeConfig a été correctement installé
goto :SWCTC) else (echo WinClassicThemeConfig n’a pas été installé correctement. Veuillez réessayer.
goto :RWCTC)
:RWCTC
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WCTC)
if /I "%c%" EQU "N" (goto :MENU)
:SWCTC
pause
title En attente de confirmation...

:WINAEROTHEMESWITCHER
title Installation de WinaeroThemeSwitcher...
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")

echo(
echo     Le téléchargement de "WinaeroThemeSwitcher.zip" est en progression ...
echo.

curl "https://web.archive.org/web/20170331093348/http://winaero.com/e107_files/downloads/WinaeroThemeSwitcher.zip" --output "C:\TSS\WinaeroThemeSwitcher.zip"

if not exist "%userprofile%\TSS\WTS" (mkdir "%userprofile%\TSS\WTS")

if exist C:\TSS\WinaeroThemeSwitcher.zip (powershell.exe Expand-Archive -Path C:\TSS\WinaeroThemeSwitcher.zip -DestinationPath "C:\TSS\WTS"
move "C:\TSS\WTS\Winaero EULA.txt" "%userprofile%\TSS\WTS"
move "C:\TSS\WTS\Windows 8\ThemeSwitcher.exe" "%userprofile%\TSS\WTS") else (echo WinearoThemeSwitcher n’est pas dans le dossier du script d’installation en cours d’exécution. Veuillez réassayer.
goto :RWTS)
echo.
echo Suppresion du dossier temporaire...
echo.
rmdir /s /q C:\TSS\WTS

if exist "%userprofile%\TSS\WTS\ThemeSwitcher.exe" (echo WinaeroThemeSwitcher a été correctement installé
goto :SWTS) else (echo WinaeroThemeSwitcher n’a pas été installé correctement. Veuillez réessayer.
goto :RWTS)
:RWTS
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WINAEROTHEMESWITCHER)
if /I "%c%" EQU "N" (goto :MENU)
:SWTS
title En attente de confirmation...
pause

:CLASSICTASKMGR
title Installation de ClassicTaskManager...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     Le téléchargement de "tm_cfg_win8_win10.zip" est en progression ...
echo.
curl "https://web.archive.org/web/20220123013838/https://win7games.com/download/tm_cfg_win8_win10.zip" --output "C:\TSS\tm_cfg_win8_win10.zip"
if exist C:\TSS\tm_cfg_win8_win10.zip (powershell.exe Expand-Archive -Path C:\TSS\tm_cfg_win8_win10.zip -DestinationPath "C:\TSS"
start C:\TSS\tm_cfg_win8-win10.exe) else (echo Le Gestionnaire des tâches classique n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RCTM)
echo.
echo     Veuillez installer le gestionnaire des tâches classique
echo.
echo ----------------------------------------------------------------------------------------------------------------------------
echo Si l’installation du gestionnaire des tâches classique c’est correctement déroulée, vous pouvez continuer l’installation.
echo ----------------------------------------------------------------------------------------------------------------------------
echo.
if exist "C:\Program Files\ClassicTaskmgr\tm.exe" (echo le Gestionnaire des tâches classique a été correctement installé
goto :SCTM) else (echo le Gestionnaire des tâches classique n’a pas été installé correctement. Veuillez réessayer.
goto :RCTM)
:RCTM
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTASKMGR)
if /I "%c%" EQU "N" (goto :MENU)
:SCTM
echo.
echo     Les programmes requis ont été correctement installés
echo.
echo     Le script d’installation va maintenant installer les tâches planifiées.
echo.
set /P c=Voulez-vous Continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks)
if /I "%c%" EQU "N" (goto :ABORT)

:Windhawks
title Installation de Windhawks...
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     Le téléchargement de "windhawk_setup.exe" est en progression ...
echo.

curl "https://ramensoftware.com/downloads/windhawk_setup.exe" -L --output "C:\TSS\windhawk_setup.exe"
if exist C:\TSS\windhawk_setup.exe (start C:\TSS\windhawk_setup.exe) else (echo Windhawks n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RWindhawks)
echo.
echo     Veuillez installer Windhawks
echo.
echo -------------------------------------------------------------------------------------------------
echo Si l’installation de Windhawks s’est correctement déroulée, vous pouvez continuer l’installation.
echo -------------------------------------------------------------------------------------------------
echo.

if not exist "%userprofile%\TSS\CTC" (mkdir "%userprofile%\TSS\CTC")

if exist C:\TSS\windhawk_setup.exe (move "C:\TSS\windhawk_setup.exe" "%userprofile%\TSS\CTC") else (echo Windhawks n’est pas dans le dossier du script d’installation en cours d’exécution. Veuillez réassayer.
goto :RWindhawks)

if exist "C:\Program Files\Windhawk\windhawk.exe" (echo Windhawk a été correctement installé
goto :SWindhawks) else (echo Windhawk n’a pas été installé correctement. Veuillez réessayer.
goto :RWindhawks)

:RWindhawks
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks)
if /I "%c%" EQU "N" (goto :MENU)

set /P c=Voulez-vous Continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :SCHDTASKS)
if /I "%c%" EQU "N" (goto :ABORT)

::*********************************************************************************
:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
exit /b
::*********************************************************************************

:SCHDTASKS
title Installation des tâches planifiés...
schtasks /create /tn "basic" /xml "basic.xml"
schtasks /create /tn "classic" /xml "classic.xml"
schtasks /create /tn "classic2" /xml "classic2.xml"
schtasks /create /tn "apps" /xml "apps.xml"

echo     Si aucune erreur n’a été constatée lors de la création des tâches, vous pouvez continuer.
echo.
title En attente de confimation...
set /P c=Voulez-vous Continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :USERINITSAVE)
if /I "%c%" EQU "N" (goto :ABORT)

:USERINITSAVE
title Sauvegarde de la sous-clef userinit...
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v userinit') do @echo %%A > "userinit.txt"
echo Valeur userinit sauvegardée dans le fichier userinit.txt. Ne déplacez et ne rennomez pas ce fichier. Ce fichier doit être situé dans le même répertoire que le script INSTALL.EXE  et que le USERINIT_VALUE_RESTORE.EXE.
echo Pour restaurer la valeur en cas de problème, rendez-vous au menu principal de ce scripts d’installation
echo                                                                               -- désinstaller (D)
echo                                                                                  -- restaurer la sous-clef userinit (R)
echo                                                             ou dans le script USERINIT_VALUE_RESTORE.exe
goto :USERINIT_REG_KEY

::*********************************************************************************
:RESTORE_USER_INIT
title en atente de confirmation...
color 4F
set /P c=Voulez-vous restaurer la valeur userinit ?[Y\N]?
if /I "%c%" EQU "Y" (goto :RESTORE_USER_INIT_2)
if /I "%c%" EQU "N" (goto :UNINSTALL)
:RESTORE_USER_INIT_2
title restauration de la sous-clef userinit...
FOR /F %%i in ('type userinit.txt') do REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d ""%%i""
echo Restauration effectuée
pause
goto :MENU
::*********************************************************************************

::*********************************************************************************
:USERINIT_REG_KEY
title En attente de confimation...
echo.
echo     Le programme d’installation va maintenant modifier la sous-clef userinit.
echo.
set /P c=Voulez-vous continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :USERINIT_REG_KEY_2)
if /I "%c%" EQU "N" (goto :ABORT)
:USERINIT_REG_KEY_2
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d """"""
echo Valeur userinit modifiée. Pour restaurer la valeur en cas de problème, rendez-vous au menu principal de ce scripts d’installation
echo                                                                                                            -- désinstaller (D)
echo                                                                                                               -- restaurer la sous-clef userinit (R)
echo                                                                                          ou dans le script USERINIT_VALUE_RESTORE.EXE
::*********************************************************************************

pause
:DEFAULT_COLOR_SAVE
title Sauvegarde de la clé Defaultcolors\Standard...
echo.
echo     Sauvegarde de la clef Defaultcolors\Standard...
echo.
REG SAVE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" DefaultColors-Standard.hiv
echo Clef DefaultColors\Standard sauvegardée dans le fichier DefaultColors-Standard.hiv. Ne déplacez et ne rennomez pas ce fichier. Ce fichier doit être situé dans le même répertoire que le script d’installation.
echo Pour restaurer la clef en cas de problème, rendez-vous au menu principal de ce scripts d’installation
echo                                                                               -- désinstaller (D)
echo                                                                                  -- restaurer la clef DefaultColor (R)
pause
::finir la méthode de restauration de la clef DefaultColors\Standard
:STANDARD_REG_KEY
title Suppresion de la clé Defaultcolors\Standard...
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard"
echo Clef Defaultcolors\Standard supprimer
pause
:TSS_PROGRAMS_MOVE
title Déplacement des scripts...
set /P c=Votre système contient-il plusieurs sessions utilisateur ? Si oui, tapez Y. Sinon, tapez N[Y\N]?
if /I "%c%" EQU "Y" (goto :MOVE_AN)
if /I "%c%" EQU "N" (goto :DIRM)
:MOVE_AN
xcopy "%cd%" "C:\TSS" /E /I
:DIRM
echo.
echo     Déplacement des scripts...
echo.
ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
ren "%userprofile%\tss\basic\uxsms.exe" uxsms_old.exe
move "%cd%\Explorer_Restart" "%userprofile%\TSS\Explorer_Restart"
move "%cd%\INSTALL" "%userprofile%\INSTALL"
move "%cd%\Installation_Test_Scripts" "%userprofile%\TSS\Installation_Test_Scripts"
move "%cd%\Switcher_Scripts" "%userprofile%\TSS\Switcher_Scripts"
move "%cd%\Themes" "%userprofile%\TSS\Themes"
move "%cd%\Themes_Auto" "%userprofile%\TSS\Themes_Auto"
move "basic.xml" "%userprofile%\TSS\INSTALL\basic.xml"
move "classic.xml" "%userprofile%\TSS\INSTALL\classic.xml"
move "classic2.xml" "%userprofile%\TSS\INSTALL\classic2.xml"
move "apps.xml" "%userprofile%\TSS\INSTALL\apps.xml"
move "userinit.txt" "%userprofile%\TSS\INSTALL\userinit.txt"
move "disable-dwm-extended-frames.c" "%userprofile%\TSS\INSTALL\disable-dwm-extended-frames.c"
move "DefaultColors-Standard.hiv" "%userprofile%\TSS\INSTALL\DefaultColors-Standard.hiv"
move "USERINIT_VALUE_RESTORE.exe" "%userprofile%\TSS\INSTALL\USERINIT_VALUE_RESTORE.exe"
::move "OPTIONAL_TOOLS.exe" "%userprofile%\TSS\INSTALL\OPTIONAL_TOOLS.exe"

::title Création des liens symboliques...
::echo.
::echo     Création des liens symboliques...
::echo.
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le thème Basic" "%userprofile%\TSS\SwitcherScripts\Classic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le thème Classique" "%userprofile%\TSS\SwitcherScripts\Basic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le thème style-DWM" "%userprofile%\TSS\SwitcherScripts\DWM_Styled_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le thème style-DWM" "%userprofile%\TSS\SwitcherScripts\Auto_Classic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le thème style-DWM" "%userprofile%\TSS\SwitcherScripts\Auto_Basic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le thème style-DWM" "%userprofile%\TSS\SwitcherScripts\Auto_DWM_Styled_FR.exe"

::finir

title L'installation des scripts s'est correctement déroulée
echo.
echo     L’installation des scripts s’est correctement déroulée
echo.
pause
echo.
echo Pour installer ThemeSwitcherScripts pour un ou pour tout les autres profiles utilisateurs, rendez-vous dans chaques sessions concernés, et exécutez le script C:\TSS\INSTALL_ANOTHER_USERS.exe.
echo Cela est recommandé.
echo.
::echo Pour installer les outils additionels, exécutez le script OPTIONAL_TOOLS.exe. Cette installation est fortement recommandée.
::echo Si vous ne les installez pas, vous ne pourrez pas bénéficier de toute les fonctionnalités des thèmes créés avec ThemeSwitcherScripts.
echo.
goto :END

::********************************************************************************************************************************************************************************************************
:PROGRAMS_INSTALL_R
title Menu de réparation de ThemeSwitcherScripts
color 47
echo **************************************************************
echo *                  Réparation des programmes                 *
echo *                                                            *
echo *          Appuyer sur B pour réparer BasicThemer5,          *
echo *             C pour réparer ClassicThemeTray,               *
echo *           W pour réparer WinaeroThemeSwitcher,             *
echo *    T pour réparer Le gestionnaire des tâches classique,    *
echo *          S pour réparer les tâches planifiées,             *
echo *   R pour réparer la modification de la valeur userinit,    *
::echo *          P pour réparer les scripts de basulement          *
::echo *            L pour réparer les liens symboliques            *          
echo *             A pour revenir à l’étape précédente            *
echo **************************************************************
echo.

CHOICE /C BCWTSRA
if "%errorlevel%"=="1" goto :BASICTHEMER5_R
if "%errorlevel%"=="2" goto :CLASSICTHEMETRAY_R
if "%errorlevel%"=="3" goto :WINAEROTHEMESWITCHER_R
if "%errorlevel%"=="4" goto :CLASSICTASKMGR_R
if "%errorlevel%"=="5" goto :SCHDTASKS_R
if "%errorlevel%"=="6" goto :USERINIT_REG_KEY_R
::if "%errorlevel%"=="7" goto :SCRIPTS_R
::if "%errorlevel%"=="8" goto :MKLINK_R
if "%errorlevel%"=="9" goto :MENU

:BASICTHEMER5_R
title En attente de confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     Le téléchargement de "uxsms.exe" est en progression ...
echo.
title Installation de BasicThemer5...
curl "https://github.com/arukateru/BasicThemer5/releases/download/1/uxsms.exe" -L --output "C:\TSS\uxsms.exe"

if not exist "%userprofile%\TSS\Basic" (mkdir "%userprofile%\TSS\Basic")

if exist C:\TSS\uxsms.exe (move "C:\TSS\Basic\uxsms.exe" "%userprofile%\TSS\Basic") else (echo BasicThemer2 n’est pas dans le dossier du script d’installation en cours d’exécution. Veuillez réassayer.
goto :RBT5_R)
echo.
echo Suppresion du dossier temporaire...
echo.
rmdir /s /q C:\TSS\Basic

if exist "%userprofile%\TSS\Basic\uxsms.exe" (echo BasicThemer5 à été correctement réparé
goto :SBT5_R) else (goto :QBT5_R)

:QBT5_R
if exist "%userprofile%\TSS\Basic\uxsms_old.exe" (echo BasicThemer5 à été correctement réparé
goto :SBT5_R) else (echo BasicThemer5 n’a pas été réparé correctement. Veuillez réessayer.
goto :RBT5_R)

:RBT5_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :BASICTHEMER5_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SBT5_R 
pause
goto :PROGRAMS_INSTALL_R

:CLASSICTHEMETRAY_R
title En attente de confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     Le téléchargement de "ClassicThemeTray.exe" est en progression ...
echo.
title Installation de ClassicThemeTray...
curl "https://github.com/spitfirex86/ClassicThemeTray/releases/download/v1.1.0/ClassicThemeTray.exe" -L --output "C:\TSS\ClassicThemeTray.exe"

if not exist "%userprofile%\TSS\Classic" (mkdir "%userprofile%\TSS\Classic")

if exist C:\TSS\classicthemetray.exe (move "C:\TSS\classicthemetray.exe" "%userprofile%\TSS\Classic") else (echo Classicthemetray n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RCTT_R)

if exist "%userprofile%\TSS\Classic\ClassicThemeTray.exe" (echo ClassicThemeTray à été correctement réparé
goto :SCTT_R) else (goto :QCTT_R)

:QCTT_R
if exist "%userprofile%\TSS\Classic\ClassicThemeTray_old.exe" (echo ClassicThemeTray à été correctement réparé
goto :SCTT_R) else (echo ClassicThemeTray n’a pas été réparé correctement. Veuillez réessayer.
goto :RCTT_R)

:RCTT_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTHEMETRAY_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SCCT_R 
pause
goto :PROGRAMS_INSTALL_R

:WINAEROTHEMESWITCHER_R
title En attente de confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")

echo(
echo     Le téléchargement de "WinaeroThemeSwitcher.zip" est en progression ...
echo.
title Installation de WinaeroThemeSwitcher...
curl "https://web.archive.org/web/20170331093348/http://winaero.com/e107_files/downloads/WinaeroThemeSwitcher.zip" --output "C:\TSS\WinaeroThemeSwitcher.zip"

if not exist "%userprofile%\TSS\WTS" (mkdir "%userprofile%\TSS\WTS")

if exist C:\TSS\WinaeroThemeSwitcher.zip (powershell.exe Expand-Archive -Path C:\TSS\WinaeroThemeSwitcher.zip -DestinationPath "C:\TSS\WTS"
move "C:\TSS\WTS\Winaero EULA.txt" "%userprofile%\TSS\WTS"
move "C:\TSS\WTS\Windows 8\ThemeSwitcher.exe" "%userprofile%\TSS\WTS") else (echo WinearoThemeSwitcher n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RWTS_R)
echo.
echo Suppresion du dossier temporaire...
echo.
rmdir /s /q C:\TSS\WTS
if exist "%userprofile%\TSS\WTS\ThemeSwitcher.exe" (echo WinaeroThemeSwitcher a été correctement réparé
goto :SWTS_R) else (echo WinaeroThemeSwitcher n’a pas été réparé correctement. Veuillez réessayer.
goto :RWTS_R)
:RWTS_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WINAEROTHEMESWITCHER_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SWTS_R
pause
goto :PROGRAMS_INSTALL_R

:CLASSICTASKMGR_R
title En attente de confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     Le téléchargement de "tm_cfg_win8_win10.zip" est en progression ...
echo.
title Installation de ClassicTaskManager...
curl "https://web.archive.org/web/20220123013838/https://win7games.com/download/tm_cfg_win8_win10.zip" --output "C:\TSS\tm_cfg_win8_win10.zip"
if exist C:\TSS\tm_cfg_win8_win10.zip (powershell.exe Expand-Archive -Path C:\TSS\tm_cfg_win8_win10.zip -DestinationPath "C:\TSS"
start C:\TSS\tm_cfg_win8-win10.exe) else (echo Le Gestionnaire des tâches classique n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RCTM_R)
echo.
echo     Veuillez installer le gestionnaire des tâches classique
echo.
if exist "C:\Program Files\ClassicTaskmgr\tm.exe" (echo le Gestionnaire des tâches classique a été correctement réparé
goto :SCTM_R) else (echo le Gestionnaire des tâches classique n’a pas été réparé correctement. Veuillez réessayer.
goto :RCTM_R)
:RCTM_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTASKMGR_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_RMENU)
:SCTM_R
pause
goto :PROGRAMS_INSTALL_R

:SCHDTASKS_R
title Réparation des tâches planifiés...
schtasks /create /tn "basic" /xml "basic.xml"
schtasks /create /tn "classic" /xml "classic.xml"
schtasks /create /tn "classic2" /xml "classic2.xml"
schtasks /create /tn "apps" /xml "apps.xml"

echo     Si aucune erreur n’a été constatée lors de la création des tâches, vous pouvez continuer.
echo.
pause
goto :REPAIR

:USERINIT_REG_KEY_R
title En attente de confimation...
echo.
echo             Le programme d’installation va maintenant modifier la valeur userinit.
echo.
echo     ATTENTION : LA VALEUR USERINIT NE SERA PAS SAUVEGARDÉE, CAR IL S’AGIT D’UNE RÉPARATION.
echo.        N’UTILISEZ CELA QUE SI VOUS AVEZ DÉJA INSTALLÉ THEMESWITCHERSCRIPTS PAR LE PASSÉ.
echo.
set /P c=Voulez-vous continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :USERINITREGKEY2)
if /I "%c%" EQU "N" (goto :ABORT)
:USERINITREGKEY2
title Modificationde la valeur userinit...
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d """"""
echo Sous-clef userinit modifiée.
pause
goto :REPAIR
::Créer :SCRIPTS_R et :MKLINK_R

::*****************************************************************************************************************************************************************************************************
:UNINSTALL_PROGRAMS
title En attente de confirmation...
set /P c=Voulez-vous désinstaller ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :UNINSTALL_USER_INIT)
if /I "%c%" EQU "N" (goto :UNINSTALL)

:UNINSTALL_USER_INIT
title en atente de confirmation...
color 4F
set /P c=Voulez-vous restaurer la sous-clef userinit originale ?[Y\N]?
if /I "%c%" EQU "Y" (goto :UNINSTALL_USER_INIT_2)
if /I "%c%" EQU "N" (goto :UNINSTALL_PROGRAMS)
:UNINSTALL_USER_INIT_2
title restauration de la sous-clef userinit...
FOR /F %%i in ('type userinit.txt') do REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d ""%%i""
echo      Restauration effectuée
pause
title Suppression des tâches planifiées...
schtasks /delete /tn "basic"
schtasks /delete /tn "classic"
schtasks /delete /tn "classic2"
schtasks /delete /tn "apps"
title Suppression des programmes...
rmdir /s /q "%userprofile%\TSS\Explorer_Restart"
rmdir /s /q "%userprofile%\TSS\Installation_Test_Scripts"
rmdir /s /q "%userprofile%\TSS\Switcher_Scripts"
rmdir /s /q "%userprofile%\TSS\Themes"
rmdir /s /q "%userprofile%\TSS\Themes_Auto"
del "%userprofile%\TSS\INSTALL\Apps.xml"
del "%userprofile%\TSS\INSTALL\Basic.xml"
del "%userprofile%\TSS\INSTALL\Classic.xml"
del "%userprofile%\TSS\INSTALL\Classic2.xml"

title Restauration de la clé DefaultColors\Standard...
REG RESTORE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" DefaultColors-Standard.hiv
del "%userprofile%\TSS\INSTALL\DefaultColors-Standard.hiv"
title Désinstallation terminée
echo.
echo      Désinstallation terminée.
echo.
echo.     Pour désinstaller les fichiers et les programmes tiers des autres compte utilisateurs, exécutez le script INSTALL_ANOTHER_USERS.exe dans les comptes concernés.
echo.     Cela est recommandé, car les fichiers et programmes des autres comptes utilisateur sont à présent inutile.
echo.
pause
goto :END_2

::***********************************************************************************************************************************************************************************************************
:ABORT
title Installation annulée
color 0A
echo Installation annulée
pause
goto :END_2

:END
title Installation terminée
color 2E
pause
start Move_Install_Script.exe
goto :END_2

:END_2
