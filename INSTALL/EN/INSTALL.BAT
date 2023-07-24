@echo off
chcp 65001 > nul

:MENU
title ThemeSwitcherScripts Setup Menu
color 0F
echo **************************************************************************************
echo *                Welcome in the ThemeSwitcherScripts install program                 *
echo *                                                                                    *
echo * Press I to install TSS, R to repair TSS, D to uninstall TSS, A to exit the program *
echo **************************************************************************************
echo.

CHOICE /C IRUA
if "%errorlevel%"=="1" goto :INSTALL
if "%errorlevel%"=="2" goto :REPAIR
if "%errorlevel%"=="3" goto :UNINSTALL
if "%errorlevel%"=="4" goto :ABORT
echo.

:REPAIR
title ThemeSwitcherScripts Repair Menu
color 47
echo *******************************************
echo *     Repairing ThemeSwitcherScripts      *
echo *                                         *
echo *      Press P to repair programs,        *
echo *      T to repair scheduled tasks,       *
echo *     R to repair the userinit key,       *
echo *    A to return to the previous step     *
echo *******************************************
echo.

CHOICE /C PTRA
if "%errorlevel%"=="1" goto :PROGRAMS_INSTALL_R
if "%errorlevel%"=="2" goto :SCHDTASKS_R
if "%errorlevel%"=="3" goto :USERINIT_REG_KEY_R
if "%errorlevel%"=="4" goto :MENU

:UNINSTALL
title ThemeSwitcherScripts Uninstall Menu
color 3E
echo *******************************************************************
echo *                 Uninstalling ThemeSwitcherScripts               *
echo *                                                                 *
echo *                 Press D to uninstall everything,                *
echo * R to restore the userinit subkey to its pre-installation state, *
echo *                A to return to the previous step                 *
echo *******************************************************************
echo.

CHOICE /C DRA
if "%errorlevel%"=="1" goto :UNINSTALL_PROGRAMS
if "%errorlevel%"=="2" goto :RESTORE_USER_INIT
if "%errorlevel%"=="3" goto :MENU

::*********************************************************************************
:INSTALL
title Waiting for confirmation...
color 17
set /P c=Do you want to install ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS)
if /I "%c%" EQU "N" (goto :MENU)

:PROGRAMS
title Installing programs...
color 9F
echo.
echo Do you want to install the required programs ?
echo.
echo You need Curl installed for this installation step
set /P c=You need an active internet connection for this installation step.[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS_INSTALL)
if /I "%c%" EQU "N" (goto :ABORT)

:PROGRAMS_INSTALL
if exist "C:\Windows\system32\curl.exe" (echo Curl is installed on your system. Installation can continue.
goto :BASICTHEMER5) else (echo Curl is not installed on your system. Please install Curl)
echo.
echo https://curl.se/windows/
echo https://devstory.net/11617/installer-curl-sur-windows
echo.
pause
goto :PROGRAMS
::ajouter l'installation automatique de Curl

:BASICTHEMER5
pause
title Installation of BasicThemer5...
if exist "%userprofile%\TSS\Basic\uxsms.exe" (goto :CLASSICTHEMETRAY)
if exist "%userprofile%\TSS\Basic\uxsms_old.exe" (goto :CLASSICTHEMETRAY)
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")

echo(
echo     The download of "uxsms.exe" is in progress ...
echo.

curl "https://github.com/arukateru/BasicThemer5/releases/download/1/uxsms.exe" -L --output "C:\TSS\uxsms.exe"

if not exist "%userprofile%\TSS\Basic" (mkdir "%userprofile%\TSS\Basic")

if exist C:\TSS\uxsms.exe (move "C:\TSS\uxsms.exe" "%userprofile%\TSS\Basic") else (echo BasicThemer5 is not in the running install script folder. Please try again.
goto :RBT5)

if exist "%userprofile%\TSS\Basic\uxsms.exe" (echo BasicThemer5 has been successfully installed
goto :SBT5) else (echo BasicThemer5 was not installed correctly. Please try Again.
goto :RBT5)
:RBT5
set /P c=Do you want to try again ?[Y\N]?
if /I "%c%" EQU "Y" (goto :BASICTHEMER5)
if /I "%c%" EQU "N" (goto :MENU)
:SBT5
title Waiting for confirmation...
pause

:CLASSICTHEMETRAY
title Installation of ClassicThemeTray...
if exist "%userprofile%\TSS\Classic\ClassicThemeTray.exe" (goto :WCTC)
if exist "%userprofile%\TSS\Classic\ClassicThemeTray_old.exe" (goto :WCTC)
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     The download of "ClassicThemeTray.exe" is in progress ...
echo.

curl "https://github.com/spitfirex86/ClassicThemeTray/releases/download/v1.1.0/ClassicThemeTray.exe" -L --output "C:\TSS\ClassicThemeTray.exe"

if not exist "%userprofile%\TSS\Classic" (mkdir "%userprofile%\TSS\Classic")

if exist C:\TSS\classicthemetray.exe (move "C:\TSS\classicthemetray.exe" "%userprofile%\TSS\Classic") else (echo Classicthemetray is not in the running install script folder. Please try again.
goto :RCTT)

if exist "%userprofile%\TSS\Classic\ClassicThemeTray.exe" (echo ClassicThemeTray was successfully installed
goto :SCTT) else (echo ClassicThemeTray was not installed correctly. Please try Again.
goto :RCTT)
:RCTT
set /P c=Do you want to try again ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTHEMETRAY)
if /I "%c%" EQU "N" (goto :MENU)
:SCTT
pause
title Waiting for confirmation...

:WCTC
title Installation of WinClassicThemeConfig...
if exist "%userprofile%\TSS\CTC\Themes_W10.exe" (goto :WINAEROTHEMESWITCHER)
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     The download of "Themes_W10.exe" is in progress ...
echo.

curl "https://ncloud5.zaclys.com/index.php/s/J7mCiwboseac2g9/download/Themes_W10.exe" -L --output "C:\TSS\Themes_W10.exe"

if not exist "%userprofile%\TSS\CTC" (mkdir "%userprofile%\TSS\CTC")

if exist C:\TSS\Themes_W10.exe (move "C:\TSS\Themes_W10.exe" "%userprofile%\TSS\CTC") else (echo WinClassicThemeConfig is not in the running install script folder. Please try again.
goto :RWCTC)

REG IMPORT "%cd%\Themes\Schemes\Brick.reg"
REG IMPORT "%cd%\Themes\Schemes\Desert.reg"
REG IMPORT "%cd%\Themes\Schemes\Eggplant.reg"
REG IMPORT "%cd%\Themes\Schemes\High Contrast #1.reg"
REG IMPORT "%cd%\\Schemes\High Contrast #2.reg"
REG IMPORT "%cd%\\Schemes\High Contrast Black.reg"
REG IMPORT "%cd%\\Schemes\High Contrast White.reg"
REG IMPORT "%cd%\Themes\Schemes\Lilac.reg"
REG IMPORT "%cd%\Themes\Schemes\Maple.reg"
REG IMPORT "%cd%\\Schemes\Marine (high color).reg"
REG IMPORT "%cd%\Themes\Schemes\Plum (high color).reg"
REG IMPORT "%cd%\Themes\Schemes\Pumpkin.reg"
REG IMPORT "%cd%\Themes\Schemes\Rainy Day.reg"
REG IMPORT "%cd%\\Schemes\Red, White, and Blue (VGA).reg"
REG IMPORT "%cd%\\Schemes\Rose.reg"
REG IMPORT "%cd%\\Schemes\Slate.reg"
REG IMPORT "%cd%\\Schemes\Spruce.reg"
REG IMPORT "%cd%\\Schemes\Storm (VGA).reg"
REG IMPORT "%cd%\Themes\Schemes\Teal (VGA).reg"
REG IMPORT "%cd%\Themes\Schemes\Wheat.reg"
REG IMPORT "%cd%\Themes\Schemes\Win10 - Aero.reg"
REG IMPORT "%cd%\Themes\Schemes\Win10 - Aerolite.reg"
REG IMPORT "%cd%\Themes\Schemes\Win10 - High Contrast #1.reg"
REG IMPORT "%cd%\Themes\Schemes\Win10 - High Contrast #2.reg"
REG IMPORT "%cd%\Themes\Schemes\Win10 - High Contrast Black.reg"
REG IMPORT "%cd%\Themes\Schemes\Win10 - High Contrast White.reg"
REG IMPORT "%cd%\Themes\Schemes\Windows Classic.reg"
REG IMPORT "%cd%\Themes\Schemes\Windows Standard.reg"

if exist "%userprofile%\TSS\CTC\Themes_W10.exe" (echo WinClassicThemeConfig was successfully installed
goto :SWCTC) else (echo WinClassicThemeConfig was not installed correctly. Please try Again.
goto :RWCTC)
:RWCTC
set /P c=Do you want to try again ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WCTC)
if /I "%c%" EQU "N" (goto :MENU)
:SWCTC
pause
title Waiting for confirmation...

:WINAEROTHEMESWITCHER
title Installation of WinaeroThemeSwitcher...
if exist "%userprofile%\TSS\WTS\ThemeSwitcher.exe" (goto :CLASSICTASKMGR)
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")

echo(
echo     The download of "WinaeroThemeSwitcher.zip" is in progress ...
echo.

curl "https://web.archive.org/web/20170331093348/http://winaero.com/e107_files/downloads/WinaeroThemeSwitcher.zip" --output "C:\TSS\WinaeroThemeSwitcher.zip"

if not exist "%userprofile%\TSS\WTS" (mkdir "%userprofile%\TSS\WTS")

if exist C:\TSS\WinaeroThemeSwitcher.zip (powershell.exe Expand-Archive -Path C:\TSS\WinaeroThemeSwitcher.zip -DestinationPath "C:\TSS\WTS"
move "C:\TSS\WTS\Winaero EULA.txt" "%userprofile%\TSS\WTS"
move "C:\TSS\WTS\Windows 8\ThemeSwitcher.exe" "%userprofile%\TSS\WTS") else (echo WinearoThemeSwitcher is not in the running install script folder. Please try again.
goto :RWTS)
echo.
echo Deleting the temporary folder...
echo.
rmdir /s /q C:\TSS\WTS

if exist "%userprofile%\TSS\WTS\ThemeSwitcher.exe" (echo WinaeroThemeSwitcher was successfully installed
goto :SWTS) else (echo WinaeroThemeSwitcher was not installed correctly. Please try Again.
goto :RWTS)
:RWTS
set /P c=Do you want to try again ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WINAEROTHEMESWITCHER)
if /I "%c%" EQU "N" (goto :MENU)
:SWTS
title Waiting for confirmation...
pause

:CLASSICTASKMGR
title Installation of ClassicTaskManager...
if exist "C:\Program Files\ClassicTaskmgr\tm.exe" (goto :Windhawks)
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     The download of "tm_cfg_win8_win10.zip" is in progress ...
echo.
curl "https://web.archive.org/web/20220123013838/https://win7games.com/download/tm_cfg_win8_win10.zip" --output "C:\TSS\tm_cfg_win8_win10.zip"
if exist C:\TSS\tm_cfg_win8_win10.zip (powershell.exe Expand-Archive -Path C:\TSS\tm_cfg_win8_win10.zip -DestinationPath "C:\TSS"
start C:\TSS\tm_cfg_win8-win10.exe) else (echo The Classic Task Manager is not in the running install script folder. Please try again.
goto :RCTM)
echo.
echo     Please install classic task manager
echo.
echo --------------------------------------------------------------------------------------------------
echo If the installation of the classic task manager was successful, you can continue the installation.
echo --------------------------------------------------------------------------------------------------
echo.
set /P c=Do you want to continue the installation ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTASKMGR2)
if /I "%c%" EQU "N" (goto :MENU)
:CLASSICTASKMGR2
if exist "C:\Program Files\ClassicTaskmgr\tm.exe" (echo The Classic Task Manager was successfully installed
goto :Windhawks) else (echo le Gestionnaire des tâches classique was not installed correctly. Please try Again.
goto :RCTM)
:RCTM
set /P c=Do you want to try again?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTASKMGR)
if /I "%c%" EQU "N" (goto :MENU)
:SCTM

:Windhawks
title Installation of Windhawks...
if exist "C:\Program Files\Windhawk\windhawk.exe" (goto :SWindhawks)
echo.
echo Windhawks is a relatively large program, check the capacity of your hard disk before starting the installation
echo You are not required to install Windhawks, but it is recommended,
echo as the classic and basic themes may not display correctly without changes made by mods available in Windhawks
echo.
set /P c=Do you want to install Windhawks ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks1)
if /I "%c%" EQU "N" (goto :SWindhawks)

:Windhawks1
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo      The download of "windhawk_setup.exe" is in progress ...
echo.

curl "https://ramensoftware.com/downloads/windhawk_setup.exe" -L --output "C:\TSS\windhawk_setup.exe"
if exist C:\TSS\windhawk_setup.exe (start C:\TSS\windhawk_setup.exe) else (echo Windhawks is not in the running install script folder. Please try again.
goto :RWindhawks)
echo.
echo     Please install Windhawks
echo.
echo -----------------------------------------------------------------------------------
echo If the installation of Windhawks was successful, you can continue the installation.
echo -----------------------------------------------------------------------------------
echo.

set /P c=Do you want to continue the installation ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks2)
if /I "%c%" EQU "N" (goto :MENU)

:Windhawks2
if exist "C:\Program Files\Windhawk\windhawk.exe" (echo Windhawk was successfully installed
goto :SWindhawks) else (echo Windhawk was not installed correctly. Please try Again.
goto :RWindhawks)

:RWindhawks
set /P c=Do you want to try again ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks)
if /I "%c%" EQU "N" (goto :MENU)

:SWindhawks
echo.
echo     The required programs have been successfully installed
echo.
echo     The installation script will now install the scheduled tasks.
echo.
set /P c=Do you want to continue ?[Y\N]?
if /I "%c%" EQU "Y" (goto :SCHDTASKS)
if /I "%c%" EQU "N" (goto :ABORT)

::*********************************************************************************
:::Download <url> <File>
::Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
::exit /b
::*********************************************************************************

:SCHDTASKS
title Installing scheduled tasks...
schtasks /create /tn "basic" /xml "basic.xml"
schtasks /create /tn "classic" /xml "classic.xml"
schtasks /create /tn "classic2" /xml "classic2.xml"
schtasks /create /tn "apps" /xml "apps.xml"

echo     If no errors were found while creating the tasks, you can continue.
echo.
title Waiting for confirmation...
set /P c=Do you want to continue ?[Y\N]?
if /I "%c%" EQU "Y" (goto :USERINITSAVE)
if /I "%c%" EQU "N" (goto :ABORT)

:USERINITSAVE
title Save userinit value...
for /f "tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v userinit') do @echo %%A > "userinit.txt"
echo.
echo *****************************************************************************************************************
echo * Userinit value saved in userinit.txt file. Do not move or rename this file.                                   *
echo * This file must be located in the same directory as the INSTALL.EXE script and the USERINIT_VALUE_RESTORE.EXE. *
echo * To restore the value in case of problem, go to the main menu of this installation scripts                     *
echo *                                                                         -- uninstall (U)                      *
echo *                                                                              -- restore userinit value (R)    *
echo *                                                                  or in the script USERINIT_VALUE_RESTORE.exe  *
echo.*****************************************************************************************************************
echo.
goto :USERINIT_REG_KEY

::*********************************************************************************
:RESTORE_USER_INIT
title Waiting for confirmation...
color 4F
set /P c=Do you want to restore userinit value ?[Y\N]?
if /I "%c%" EQU "Y" (goto :RESTORE_USER_INIT_2)
if /I "%c%" EQU "N" (goto :UNINSTALL)
:RESTORE_USER_INIT_2
title Restore userinit value...
FOR /F %%i in ('type userinit.txt') do REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d ""%%i""
echo Restauration effectuée
pause
goto :MENU
::*********************************************************************************

::*********************************************************************************
:USERINIT_REG_KEY
title Waiting for confirmation...
echo.
echo     The installer will now modify the userinit value.
echo.
set /P c=Do you want to continue ?[Y\N]?
if /I "%c%" EQU "Y" (goto :USERINIT_REG_KEY_2)
if /I "%c%" EQU "N" (goto :ABORT)
:USERINIT_REG_KEY_2
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d """"""
echo.
echo Changed userinit value. To restore the value in the event of a problem,
echo go to the main menu of this installation scripts
echo                                          -- uninstall (U)
echo                                             -- restore userinit value (R)
echo                                    or in the script USERINIT_VALUE_RESTORE.EXE
echo.
::*********************************************************************************

pause
:DEFAULT_COLOR_SAVE
title Saving the DefaultColors\Standard key...
echo.
echo     Saving the DefaultColors\Standard key...
echo.
REG SAVE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" DefaultColors-Standard.hiv
echo DefaultColors\Standard key saved in DefaultColors-Standard.hiv file. Do not move or rename this file. This file must be located in the same directory as the installation script.
echo To restore the key in case of problem, go to the main menu of this installation scripts
echo                                                                               -- uninstall (U)
echo                                                                                  -- restaurer la clef DefaultColor (D)
pause
::finir la méthode de restauration de la clef DefaultColors\Standard
:STANDARD_REG_KEY
title Delete the Defaultcolors\Standard key...
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard"
echo Clef Defaultcolors\Standard supprimer
pause
:TSS_PROGRAMS_MOVE
title Moving scripts...
set /P c=Does your system contain multiple user sessions? If yes, type Y. Otherwise, type N[Y\N]?
if /I "%c%" EQU "Y" (goto :MOVE_AN)
if /I "%c%" EQU "N" (goto :DIRM)
:MOVE_AN
xcopy "%cd%" "C:\TSS" /E /I
:DIRM
echo.
echo     Moving scripts...
echo.
ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
ren "%userprofile%\tss\basic\uxsms.exe" uxsms_old.exe
mkdir "%userprofile%\TSS\INSTALL"
move "%cd%\Themes_Files\aerolite.theme" "C:\windows\ressources\themes\aerolite.theme"
move "%cd%\Themes_Files\aerolite2.theme" "C:\windows\ressources\themes\aerolite2.theme"
move "%cd%\Themes_Files\windowsclassic.theme" "C:\windows\ressources\themes\windowsclassic.theme"
move "%cd%\Themes_Files\windowsstandard.theme" "C:\windows\ressources\themes\windowsstandard.theme"
move "%cd%\Themes_Files\hc1classic.theme" "C:\windows\ressources\Ease of Access Themes\hc1classic.theme"
move "%cd%\Themes_Files\hc2classic.theme" "C:\windows\ressources\Ease of Access Themes\hc2classic.theme"
move "%cd%\Themes_Files\hcblackclassic.theme" "C:\windows\ressources\Ease of Access Themes\hcblack.theme"
move "%cd%\Themes_Files\hcwhiteclassic.theme" "C:\windows\ressources\Ease of Access Themes\hcwhiteclassic.theme"
move "%cd%\Explorer_Restart" "%userprofile%\TSS\Explorer_Restart"
move "%cd%\Installation_Test_Scripts" "%userprofile%\TSS\Installation_Test_Scripts"
move "%cd%\Switcher_Scripts" "%userprofile%\TSS\Switcher_Scripts"
move "%cd%\Themes" "%userprofile%\TSS\Themes"
move "%cd%\Themes_Auto" "%userprofile%\TSS\Themes_Auto"
move "%cd%\Themes_Files" "%userprofile%\TSS\Themes_Files"
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

title The installation of the scripts was successful
echo.
echo     The installation of the scripts was successful
echo.
pause
echo.
echo To install ThemeSwitcherScripts for one or all other user profiles, go to each session concerned, and run the script C:\TSS\INSTALL_ANOTHER_USERS.exe.
echo This is recommended.
echo.
::echo Pour installer les outils additionels, exécutez le script OPTIONAL_TOOLS.exe. Cette installation est fortement recommandée.
::echo Si vous ne les installez pas, vous ne pourrez pas bénéficier de toute les fonctionnalités des thèmes créés avec ThemeSwitcherScripts.
echo.
goto :END

::********************************************************************************************************************************************************************************************************
:PROGRAMS_INSTALL_R
title ThemeSwitcherScripts Repair Menu
color 47
echo **********************************************************
echo *                  Repairing programs                    *
echo *                                                        *
echo *          Press B to repair BasicThemer5,               *
echo *               C to repair ClassicThemeTray,            *
echo *            W to repair WinClassicThemeConfig,          * 
echo *           T to repair WinaeroThemeSwitcher,            *
echo *    M to repair Le gestionnaire des tâches classique,   *
echo *          S to repair les tâches planifiées,            *
echo *   R to repair la modification de la valeur userinit,   *
::echo *          P to repair les scripts de basulement         *
::echo *            L to repair les liens symboliques           *          
echo *             A to return to the previous step           *
echo **********************************************************
echo.

CHOICE /C BCWTMSRA
if "%errorlevel%"=="1" goto :BASICTHEMER5_R
if "%errorlevel%"=="2" goto :CLASSICTHEMETRAY_R
if "%errorlevel%"=="3" goto :WCTC_R
if "%errorlevel%"=="4" goto :WINAEROTHEMESWITCHER_R
if "%errorlevel%"=="5" goto :CLASSICTASKMGR_R
if "%errorlevel%"=="6" goto :SCHDTASKS_R
if "%errorlevel%"=="7" goto :USERINIT_REG_KEY_R
if "%errorlevel%"=="8" goto :MENU

:BASICTHEMER5_R
title Waiting for confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     The download of "uxsms.exe" is in progress ...
echo.
title Installation of BasicThemer5...
curl "https://github.com/arukateru/BasicThemer5/releases/download/1/uxsms.exe" -L --output "C:\TSS\uxsms.exe"

if not exist "%userprofile%\TSS\Basic" (mkdir "%userprofile%\TSS\Basic")

if exist C:\TSS\uxsms.exe (move "C:\TSS\uxsms.exe" "%userprofile%\TSS\Basic") else (echo BasicThemer2 is not in the running install script folder. Please try again.
goto :RBT5_R)

if exist "%userprofile%\TSS\Basic\uxsms.exe" (echo BasicThemer5 has been successfully fixed
goto :SBT5_R) else (goto :QBT5_R)

:QBT5_R
if exist "%userprofile%\TSS\Basic\uxsms_old.exe" (echo BasicThemer5 has been successfully fixed
goto :SBT5_R) else (echo BasicThemer5 was not repaired properly. Please try Again.
goto :RBT5_R)

:RBT5_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :BASICTHEMER5_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SBT5_R 
pause
goto :PROGRAMS_INSTALL_R

:CLASSICTHEMETRAY_R
title Waiting for confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     The download of "ClassicThemeTray.exe" is in progress ...
echo.
title Installation of ClassicThemeTray...
curl "https://github.com/spitfirex86/ClassicThemeTray/releases/download/v1.1.0/ClassicThemeTray.exe" -L --output "C:\TSS\ClassicThemeTray.exe"

if not exist "%userprofile%\TSS\Classic" (mkdir "%userprofile%\TSS\Classic")

if exist C:\TSS\classicthemetray.exe (move "C:\TSS\classicthemetray.exe" "%userprofile%\TSS\Classic") else (echo Classicthemetray n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RCTT_R)

if exist "%userprofile%\TSS\Classic\ClassicThemeTray.exe" (echo ClassicThemeTray has been successfully fixed
goto :SCTT_R) else (goto :QCTT_R)

:QCTT_R
if exist "%userprofile%\TSS\Classic\ClassicThemeTray_old.exe" (echo ClassicThemeTray has been successfully fixed
goto :SCTT_R) else (echo ClassicThemeTray was not repaired properly. Please try Again.
goto :RCTT_R)

:RCTT_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTHEMETRAY_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SCCT_R 
pause
goto :PROGRAMS_INSTALL_R

:WCTC_R
title Installation of WinClassicThemeConfig...
if exist "%userprofile%\TSS\CTC\Themes_W10.exe" (goto :PROGRAMS_INSTALL_R)
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     The download of "Themes_W10.exe" is in progress ...
echo.

curl "https://ncloud5.zaclys.com/index.php/s/J7mCiwboseac2g9/download/Themes_W10.exe" -L --output "C:\TSS\Themes_W10.exe"

if not exist "%userprofile%\TSS\CTC" (mkdir "%userprofile%\TSS\CTC")

if exist C:\TSS\Themes_W10.exe (move "C:\TSS\Themes_W10.exe" "%userprofile%\TSS\CTC") else (echo WinClassicThemeConfig is not in the running install script folder. Please try again.
goto :RWCTC_R)

if exist "%userprofile%\TSS\CTC\Themes_W10.exe" (echo WinClassicThemeConfig has been successfully fixed
goto :SWCTC_R) else (echo WinClassicThemeConfig was not repaired properly. Please try Again.
goto :RWCTC_R)
:RWCTC_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WCTC_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SWCTC_R
title Waiting for confirmation...
pause
goto :PROGRAMS_INSTALL_R

:WINAEROTHEMESWITCHER_R
title Waiting for confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")

echo(
echo     The download of "WinaeroThemeSwitcher.zip" is in progress ...
echo.
title Installation of WinaeroThemeSwitcher...
curl "https://web.archive.org/web/20170331093348/http://winaero.com/e107_files/downloads/WinaeroThemeSwitcher.zip" --output "C:\TSS\WinaeroThemeSwitcher.zip"

if not exist "%userprofile%\TSS\WTS" (mkdir "%userprofile%\TSS\WTS")

if exist C:\TSS\WinaeroThemeSwitcher.zip (powershell.exe Expand-Archive -Path C:\TSS\WinaeroThemeSwitcher.zip -DestinationPath "C:\TSS\WTS"
move "C:\TSS\WTS\Winaero EULA.txt" "%userprofile%\TSS\WTS"
move "C:\TSS\WTS\Windows 8\ThemeSwitcher.exe" "%userprofile%\TSS\WTS") else (echo WinearoThemeSwitcher n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RWTS_R)
echo.
echo Deleting the temporary folder...
echo.
rmdir /s /q C:\TSS\WTS
if exist "%userprofile%\TSS\WTS\ThemeSwitcher.exe" (echo WinaeroThemeSwitcher has been successfully fixed
goto :SWTS_R) else (echo WinaeroThemeSwitcher was not repaired properly. Please try Again.
goto :RWTS_R)
:RWTS_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WINAEROTHEMESWITCHER_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_R)
:SWTS_R
pause
goto :PROGRAMS_INSTALL_R

:CLASSICTASKMGR_R
title Waiting for confirmation...
if not exist "C:\TSS" (mkdir "C:\TSS")
echo(
echo     The download of "tm_cfg_win8_win10.zip" is in progress ...
echo.
title Installation of ClassicTaskManager...
curl "https://web.archive.org/web/20220123013838/https://win7games.com/download/tm_cfg_win8_win10.zip" --output "C:\TSS\tm_cfg_win8_win10.zip"
if exist C:\TSS\tm_cfg_win8_win10.zip (powershell.exe Expand-Archive -Path C:\TSS\tm_cfg_win8_win10.zip -DestinationPath "C:\TSS"
start C:\TSS\tm_cfg_win8-win10.exe) else (echo The Classic Task Manager n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RCTM_R)
echo.
echo     Please install the Classic Task Manager
echo.
if exist "C:\Program Files\ClassicTaskmgr\tm.exe" (echo The Classic Task Manager has been successfully fixed
goto :SCTM_R) else (echo The CLassic Task Manager was not repaired properly. Please try Again.
goto :RCTM_R)
:RCTM_R
set /P c=Voulez vous réessayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTASKMGR_R)
if /I "%c%" EQU "N" (goto :PROGRAMS_INSTALL_RMENU)
:SCTM_R
pause
goto :PROGRAMS_INSTALL_R

:SCHDTASKS_R
title Repair of scheduled tasks...
schtasks /create /tn "basic" /xml "basic.xml"
schtasks /create /tn "classic" /xml "classic.xml"
schtasks /create /tn "classic2" /xml "classic2.xml"
schtasks /create /tn "apps" /xml "apps.xml"

echo     If no errors were found while creating the tasks, you can continue.
echo.
pause
goto :REPAIR

:USERINIT_REG_KEY_R
title Waiting for confirmation...
echo.
echo             The installer will now modify the userinit value.
echo.
echo     WARNING : THE USERINIT VALUE WILL NOT BE SAVED BECAUSE THIS IS A REPAIR.
echo.        ONLY USE THIS IF YOU HAVE INSTALLED THEMESWITCHERSCRIPTS BEFORE.
echo.
set /P c=Do you want to continue ?[Y\N]?
if /I "%c%" EQU "Y" (goto :USERINITREGKEY2)
if /I "%c%" EQU "N" (goto :ABORT)
:USERINITREGKEY2
title Modify the userinit value...
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d """"""
echo Sous-clef userinit modifiée.
pause
goto :REPAIR
::Créer :SCRIPTS_R et :MKLINK_R

::*****************************************************************************************************************************************************************************************************
:UNINSTALL_PROGRAMS
title Waiting for confirmation...
set /P c=Do you want to uninstall ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :UNINSTALL_USER_INIT)
if /I "%c%" EQU "N" (goto :UNINSTALL)

:UNINSTALL_USER_INIT
title Waiting for confirmation...
color 4F
set /P c=Do you want to restore the original userinit value ?[Y\N]?
if /I "%c%" EQU "Y" (goto :UNINSTALL_USER_INIT_2)
if /I "%c%" EQU "N" (goto :UNINSTALL_PROGRAMS)
:UNINSTALL_USER_INIT_2
title Restoring the userinit value...
FOR /F %%i in ('type userinit.txt') do REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d ""%%i""
echo      Restoration performed
pause
title Deleting scheduled tasks...
schtasks /delete /tn "basic"
schtasks /delete /tn "classic"
schtasks /delete /tn "classic2"
schtasks /delete /tn "apps"
title Deleting programs...
rmdir /s /q "%userprofile%\TSS\Explorer_Restart"
rmdir /s /q "%userprofile%\TSS\Installation_Test_Scripts"
rmdir /s /q "%userprofile%\TSS\Switcher_Scripts"
rmdir /s /q "%userprofile%\TSS\Themes"
rmdir /s /q "%userprofile%\TSS\Themes_Auto"
rmdir /s /q "%userprofile%\TSS\Themes_Files"
rmdir /s /q "%userprofile%\TSS\Basic"
rmdir /s /q "%userprofile%\TSS\Classic"
rmdir /s /q "%userprofile%\TSS\CTC"
rmdir /s /q "%userprofile%\TSS\WTS"
del "%userprofile%\TSS\INSTALL\Apps.xml"
del "%userprofile%\TSS\INSTALL\Basic.xml"
del "%userprofile%\TSS\INSTALL\Classic.xml"
del "%userprofile%\TSS\INSTALL\Classic2.xml"
del "%userprofile%\TSS\INSTALL\USERINIT_VALUE_RESTORE.exe"
del "%userprofile%\TSS\INSTALL\disable-dwm-extended-frames.c"
del "%userprofile%\TSS\INSTALL\userinit.txt"

title Restoring the DefaultColors\Standard key...
REG RESTORE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" DefaultColors-Standard.hiv
del "%userprofile%\TSS\INSTALL\DefaultColors-Standard.hiv"
title Uninstallation complete
echo.
echo      Uninstallation complete.
echo.
echo.     To uninstall third-party files and programs from other user accounts, run the INSTALL_ANOTHER_USERS.exe script in the relevant accounts.
echo.     This is recommended because files and programs from other user accounts are now useless.
echo.
pause
goto :END_2

::***********************************************************************************************************************************************************************************************************
:ABORT
title Installation canceled
color 0A
echo Installation canceled
pause
goto :END_2

:END
title Installation completed
color 2E
pause
start Move_Install_Script.exe
goto :END_2

:END_2
