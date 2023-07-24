@echo off
chcp 65001 > nul

title Installation de ThèmeSwitcherScripts pour les autres utilisateurs
color 2E
echo.
echo    **********************************************************************************************************************
echo    *                                                                                                                    *
echo    *            Voulez-vous installer ThèmeSwitcherScripts sur la session utilisateur actuelement ouverte ?             *
echo    *                                                                                                                    *
echo    *            Il faut avoir au préalable installé ThèmeSwitcherScripts pour un autre utilisateur de ce PC             *
echo    * Si ThèmeSwitcherScript n’est installé pour aucun utilisateur de ce PC, fermez ce programme et exécutez INSTALL.EXE *
echo    *                                                                                                                    *
echo    **********************************************************************************************************************
echo.
set /P c=Do you want to continue ?[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS)
if /I "%c%" EQU "N" (goto :ABORT)

:PROGRAMS
title Installing programs...
color 9F
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
title Installation of BasicThemer5...
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
title Waiting for confirmation...
pause

:WCTC
title Installation of WinClassicThemeConfig...
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
goto :SWCTC) else (echo  WinClassicThemeConfig was not installed correctly. Please try Again.
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
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")

echo(
echo    The download of "WinaeroThemeSwitcher.zip" is in progress ...
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
echo(
echo     The download of "tm_cfg_win8_win10.zip" is in progress ...
echo.
curl "https://web.archive.org/web/20220123013838/https://win7games.com/download/tm_cfg_win8_win10.zip" -L --output "C:\TSS\tm_cfg_win8_win10.zip"
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
set /P c=Do you want to try again ?[Y\N]?
if /I "%c%" EQU "Y" (goto :CLASSICTASKMGR)
if /I "%c%" EQU "N" (goto :MENU)
:SCTM

:Windhawks
title Installation of Windhawks...
if exist "C:\Program Files\Windhawk\windhawk.exe" (goto :TSS_PROGRAMS_MOVE)
echo.
echo Windhawks is a relatively large program, check the capacity of your hard disk before starting the installation
echo You are not required to install Windhawks, but it is recommended,
echo as the classic and basic themes may not display correctly without changes made by mods available in Windhawks
echo.
set /P c=Do you want to install Windhawks ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks1)
if /I "%c%" EQU "N" (goto :SWindhawks)

:Windhawks1
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo    The download of "windhawk_setup.exe" is in progress ...
echo.
curl "https://ramensoftware.com/downloads/windhawk_setup.exe" -L --output "C:\TSS\windhawk_setup.exe"
if exist C:\TSS\windhawk_setup.exe (start C:\TSS\windhawk_setup.exe) else (echo Windhawks n’est pas dans le dossier du script d’installation en cours d’exécution. Veuiller réassayer.
goto :RWindhawks)
echo.
echo     Veuillez installer Windhawks
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
set /P c=Do you want to complete the installation of ThemeSwitcherScripts ?[Y\N]?
if /I "%c%" EQU "Y" (goto :TSS_PROGRAMS_MOVE)
if /I "%c%" EQU "N" (goto :ABORT)

::*********************************************************************************
:::Download <url> <File>
::Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
::exit /b
::*********************************************************************************

:TSS_PROGRAMS_MOVE
title Moving scripts...
echo.
echo     Moving scripts...
echo.
ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
ren "%userprofile%\TSS\basic\uxsms.exe" uxsms_old.exe
mkdir "%userprofile%\TSS\INSTALL"
del "%cd%\INSTALL.EXE"
del "%cd%\MOVE_INSTALL_SCRIPT.EXE"
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
xcopy "INSTALL_ANOTHER_USERS.exe" "C:\TSS\INSTALL_ANOTHER_USERS.exe"
move "USERINIT_VALUE_RESTORE.exe" "%userprofile%\TSS\INSTALL\USERINIT_VALUE_RESTORE.exe"
::move "OPTIONAL_TOOLS.exe" "%userprofile%\TSS\INSTALL\OPTIONAL_TOOLS.exe"

title The installation of the scripts was successful
echo.
echo     The installation of the scripts was successful
echo.
pause
goto :END

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

:ABORT
echo Installation canceled
goto :END
:END
