@echo off
chcp 65001 > nul

title Installation de Th�meSwitcherScripts pour les autres utilisateurs
color 2E
echo.
echo    **********************************************************************************************************************
echo    *                                                                                                                    *
echo    *            Voulez-vous installez Th�meSwitcherScripts sur la session utilisateur actuelement ouverte ?             *
echo    *                                                                                                                    *
echo    *            Il faut avoir au pr�alable install� Th�meSwitcherScripts pour un autre utilisateur de ce PC             *
echo    * Si Th�meSwitcherScript n�est install� pour aucun utilisateur de ce PC, fermez ce programme et ex�cutez INSTALL.EXE *
echo    *                                                                                                                    *
echo    **********************************************************************************************************************
echo.
set /P c=Voulez vous continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS)
if /I "%c%" EQU "N" (goto :ABORT)

:PROGRAMS
title Installation des programmes...
color 9F
� ho?
echo Voulez-vous installer les programmes requis ?
echo.
echo Vous avez besoin de Curl install� pour pour cette �tape de l�installation
set /P c=Vous avez besoin d'une connexion internet active pour cette �tape de l'installation.[Y\N]?
if /I "%c%" EQU "Y" (goto :PROGRAMS_INSTALL)
if /I "%c%" EQU "N" (goto :ABORT)

:PROGRAMS_INSTALL
if exist "C:\Windows\system32\curl.exe" (echo Curl est install� sur votre syst�me. L�installation peut se poursuivre.
goto :BASICTHEMER2) else (echo Curl n�est pas pas install� sur votre syst�me. Veuillez installer Curl)
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
echo     Le t�l�chargement de "uxsms.exe" est en progression ...
echo.

curl "https://github.com/arukateru/BasicThemer5/releases/download/1/uxsms.exe" -L --output "C:\TSS\uxsms.exe"

if not exist "%userprofile%\TSS\Basic" (mkdir "%userprofile%\TSS\Basic")

if exist C:\TSS\uxsms.exe (move "C:\TSS\Basic\uxsms.exe" "%userprofile%\TSS\Basic") else (echo BasicThemer5 n�est pas dans le dossier du script d�installation en cours d�ex�cution. Veuillez r�assayer.
goto :RBT5)
echo.
echo Suppresion du dossier temporaire...
echo.
rmdir /s /q C:\TSS\Basic
if exist "%userprofile%\TSS\Basic\uxsms.exe" (echo BasicThemer5 a �t� correctement install�
goto :SBT5) else (echo BasicThemer5 n�a pas �t� install� correctement. Veuillez r�essayer.
goto :RBT5)
:RBT5
set /P c=Voulez vous r�essayer ?[Y\N]?
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
echo     Le t�l�chargement de "ClassicThemeTray.exe" est en progression ...
echo.

curl "https://github.com/spitfirex86/ClassicThemeTray/releases/download/v1.1.0/ClassicThemeTray.exe" -L --output "C:\TSS\ClassicThemeTray.exe"

if not exist "%userprofile%\TSS\Classic" (mkdir "%userprofile%\TSS\Classic")

if exist C:\TSS\classicthemetray.exe (move "C:\TSS\classicthemetray.exe" "%userprofile%\TSS\Classic") else (echo Classicthemetray n�est pas dans le dossier du script d�installation en cours d�ex�cution. Veuillez r�assayer.
goto :RCTT)

if exist "%userprofile%\TSS\Classic\ClassicThemeTray.exe" (echo ClassicThemeTray a �t� correctement install�
goto :SCTT) else (echo ClassicThemeTray n�a pas �t� install� correctement. Veuillez r�essayer.
goto :RCTT)
:RCTT
set /P c=Voulez vous r�essayer ?[Y\N]?
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
echo     Le t�l�chargement de "Themes_W10.exe" est en progression ...
echo.

curl "https://ncloud5.zaclys.com/index.php/s/J7mCiwboseac2g9/download/Themes_W10.exe" -L --output "C:\TSS\Themes_W10.exe"

if not exist "%userprofile%\TSS\CTC" (mkdir "%userprofile%\TSS\CTC")

if exist C:\TSS\Themes_W10.exe (move "C:\TSS\Themes_W10.exe" "%userprofile%\TSS\CTC") else (echo WinClassicThemeConfig n�est pas dans le dossier du script d�installation en cours d�ex�cution. Veuillez r�assayer.
goto :RWCTC)

if exist "%userprofile%\TSS\CTC\Themes_W10.exe" (echo WinClassicThemeConfig a �t� correctement install�
goto :SWCTC) else (echo WinClassicThemeConfig n�a pas �t� install� correctement. Veuillez r�essayer.
goto :RWCTC)
:RWCTC
set /P c=Voulez vous r�essayer ?[Y\N]?
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
echo     Le t�l�chargement de "WinaeroThemeSwitcher.zip" est en progression ...
echo.

curl "https://web.archive.org/web/20170331093348/http://winaero.com/e107_files/downloads/WinaeroThemeSwitcher.zip" --output "C:\TSS\WinaeroThemeSwitcher.zip"

if not exist "%userprofile%\TSS\WTS" (mkdir "%userprofile%\TSS\WTS")

if exist C:\TSS\WinaeroThemeSwitcher.zip (powershell.exe Expand-Archive -Path C:\TSS\WinaeroThemeSwitcher.zip -DestinationPath "C:\TSS\WTS"
move "C:\TSS\WTS\Winaero EULA.txt" "%userprofile%\TSS\WTS"
move "C:\TSS\WTS\Windows 8\ThemeSwitcher.exe" "%userprofile%\TSS\WTS") else (echo WinearoThemeSwitcher n�est pas dans le dossier du script d�installation en cours d�ex�cution. Veuillez r�assayer.
goto :RWTS)
echo.
echo Suppresion du dossier temporaire...
echo.
rmdir /s /q C:\TSS\WTS

if exist "%userprofile%\TSS\WTS\ThemeSwitcher.exe" (echo WinaeroThemeSwitcher a �t� correctement install�
goto :SWTS) else (echo WinaeroThemeSwitcher n�a pas �t� install� correctement. Veuillez r�essayer.
goto :RWTS)
:RWTS
set /P c=Voulez vous r�essayer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :WINAEROTHEMESWITCHER)
if /I "%c%" EQU "N" (goto :MENU)
:SWTS
title En attente de confirmation...
pause

:CLASSICTASKMGR
title V�rification de l'installation de ClassicTaskManager...
if exist "C:\Program Files\ClassicTaskmgr\tm.exe" (echo le Gestionnaire des t�ches classique a �t� correctement install�
goto :SCTM) else (echo le Gestionnaire des t�ches classique n�a pas �t� install� correctement. Veuillez ex�cuter le script INSTALL.EXE sur la sessio utilisateur o� � �t� install� en premier ThemeSwitcherScripts.
goto :ABORT)
:SCTM
echo.
echo     Les programmes requis ont �t� correctement install�s
echo.
echo     Le script d�installation va maintenant installer les t�ches planifi�es.
echo.
set /P c=Voulez-vous Continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :Windhawks)
if /I "%c%" EQU "N" (goto :ABORT)

:Windhawks
title Installation de Windhawks...
if not exist "C:\TSS" (mkdir "C:\TSS")
if not exist "%userprofile%\TSS" (mkdir "%userprofile%\TSS")
echo(
echo     Le t�l�chargement de "windhawk_setup.exe" est en progression ...
echo.

curl "https://ramensoftware.com/downloads/windhawk_setup.exe" -L --output "C:\TSS\windhawk_setup.exe"
if exist C:\TSS\windhawk_setup.exe (start C:\TSS\windhawk_setup.exe) else (echo Windhawks n�est pas dans le dossier du script d�installation en cours d�ex�cution. Veuiller r�assayer.
goto :RWindhawks)
echo.
echo     Veuillez installer Windhawks
echo.
echo -------------------------------------------------------------------------------------------------
echo Si l�installation de Windhawks s�est correctement d�roul�e, vous pouvez continuer l�installation.
echo -------------------------------------------------------------------------------------------------
echo.

if not exist "%userprofile%\TSS\CTC" (mkdir "%userprofile%\TSS\CTC")

if exist C:\TSS\windhawk_setup.exe (move "C:\TSS\windhawk_setup.exe" "%userprofile%\TSS\CTC") else (echo Windhawks n�est pas dans le dossier du script d�installation en cours d�ex�cution. Veuillez r�assayer.
goto :RWindhawks)

if exist "C:\Program Files\Windhawk\windhawk.exe" (echo Windhawk a �t� correctement install�
goto :SWindhawks) else (echo Windhawk n�a pas �t� install� correctement. Veuillez r�essayer.
goto :RWindhawks)

:RWindhawks
set /P c=Voulez vous r�essayer ?[Y\N]?
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
title Installation des t�ches planifi�s...
schtasks /create /tn "basic" /xml "basic.xml"
schtasks /create /tn "classic" /xml "classic.xml"
schtasks /create /tn "classic2" /xml "classic2.xml"
schtasks /create /tn "apps" /xml "apps.xml"

echo.
echo     Si aucune erreur n�a �t� constat�e lors de la cr�ation des t�ches, vous pouvez continuer.
echo.
title En attente de confimation...
set /P c=Voulez-vous Continuer ?[Y\N]?
if /I "%c%" EQU "Y" (goto :TSS_PROGRAMS_MOVE)
if /I "%c%" EQU "N" (goto :ABORT)

:TSS_PROGRAMS_MOVE
title D�placement des scripts...
echo.
echo     D�placement des scripts...
echo.
ren "%userprofile%\TSS\classic\classicthemetray.exe" classicthemetray_old.exe
ren "%userprofile%\TSS\basic\uxsms.exe" uxsms_old.exe
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
move "INSTALL_ANOTHER_USERS.exe" "C:\TSS\INSTALL_ANOTHER_USERS.exe"
move "USERINIT_VALUE_RESTORE.exe" "%userprofile%\TSS\INSTALL\USERINIT_VALUE_RESTORE.exe"
::move "OPTIONAL_TOOLS.exe" "%userprofile%\TSS\INSTALL\OPTIONAL_TOOLS.exe"

title L'installation des scripts s'est correctement d�roul�e
echo.
echo     L�installation des scripts s�est correctement d�roul�e
echo.
pause
goto :END

::title Cr�ation des liens symboliques...
::echo.
::echo     Cr�ation des liens symboliques...
::echo.
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le th�me Basic" "%userprofile%\TSS\SwitcherScripts\Classic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le th�me Classique" "%userprofile%\TSS\SwitcherScripts\Basic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le th�me style-DWM" "%userprofile%\TSS\SwitcherScripts\DWM_Styled_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le th�me style-DWM" "%userprofile%\TSS\SwitcherScripts\Auto_Classic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le th�me style-DWM" "%userprofile%\TSS\SwitcherScripts\Auto_Basic_FR.exe"
::mklink "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Outils ThemeSwitcherScripts\Activer le th�me style-DWM" "%userprofile%\TSS\SwitcherScripts\Auto_DWM_Styled_FR.exe"

::finir

:ABORT
goto :END
:END