# ThemeSwitcherScripts

![cmd_dVFuaVIWbk](https://user-images.githubusercontent.com/100134023/177014021-419b31c8-3530-4850-bdc6-c7009c575cad.png)

EN:

Collection of batch scripts to change the appearance of the Windows 10 1809+ (Windows 8+ in the future) user interface. An extension of the .theme ini files.

Why this project:

Windows allows a great capacity for customization; only, few of these functions are supported natively. The purpose of ThemeSwitcherScript and to be able to allow the user to patch his system with the addition of many customization tools at once, then to be able to apply themes natively supporting several customization tools.
Finally, ThemeSwitcherScripts should facilitate the automation of Windows themes, which is currently impossible.

For creators, this means writing scripts on a defined template, which allows the user to apply their theme/visual style very easily. The goal is to remove the confusion between customization tools, and potentially some misunderstandings created by this confusion.

Supported tools are, or will be added soon:
- All libre/freeware visual style customization tools
- Many taskbar customization tools
- Many file explorer customization tools

To be able to use these scripts, you must have followed these steps :

So here is the way to add multi-user support to ThemeSwitcherScript. That is, the ability to simultaneously run, for example, the DWM-styled theme (default theme) on User A, the Basic theme on User B, and the Classic theme on User C.

Thanks to @anixx for the original idea of the classic theme by scheduled tasks ( winclassic.boards.net/thread/990/windows-classic-theme-on-1903 ).

1. move _uxsms.exe_ to _%userprofile%\TSS\basic_
2. move _classicthemetray.exe_ to _%userprofile%\TSS\classic_
3. Repeat copying _uxsms.exe_ to _%userprofile%\TSS\basic_ and _classicthemetray.exe_ to _%userprofile%\TSS\classic_ for all other user accounts
4. Import on the task scheduler the files : Apps.xml, Basic.xml, Classic.xml and Classic2.xml
5. Import this registry file ( __/!\ WARNING, it is important to save the previous key before modifying /!\__ ) :

Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]
"Userinit"=""

6. Use the scripts contained in ThemeSwitcherScript second release : github.com/OrthodoxWindows/ThemeSwitcherScripts/releases/tag/Release-1.1

It works on my system, but nothing tells me that it will work on other systems. It is therefore important to test it by taking maximum precautions. Please let me know if it works or not. When I'm sure it works, I could write an automatic installation script.

For the moment, it is impossible to install ThemeSwitcherScripts on part of the user accounts. It must be installed on all visible accounts (invisible accounts do not count).

WARNING : The _BUILTIN\Users_ group depends on the system language ; for example, on my system, the group is named _BUILTIN\Utilisateurs_.

To add support for .theme files, you need to copy winaero themeswitcher to _%userprofile%\TSS\themeswitcher\_. Choose the version for Windows 8 (and not for Windows 7). https://winaero.com/winaero-theme-switcher/

Support for custom visual styles:
Theme Switcher Scripts supports custom visual styles with a system patched with Tools like UXThemePatcher or UXStyle. However, Theme SwitcherScript currently does not support SecureUXTheme (https://github.com/namazso/SecureUxTheme/issues/108).

Multi-user support:
__It is important to add the files to the user folder with the %userprofile% environment variable, as this allows multi-user support.__ That is, the ability to simultaneously run, for example, the DWM-styled theme (defaut visual style) on User A, the Basic theme on User B, and the Classic theme on User C.
For the moment, it is impossible to install ThemeSwitcherScripts on part of the user accounts. It must be installed on all visible accounts (invisible accounts do not count).

FR:

Pourquoi ce projet :

Windows permet une très grande capacité de personnalisation ; seulement, peu de ces fonctions sont prise en charge nativement. Le but de ThemeSwitcherScript et de pouvoir permettre à l'utilisateur de patcher son système avec l'ajout de nombreux outils de personnalisations d'un seul coup, puis de pouvoir appliquer des thèmes prenant nativement en charge plusieurs outils de personnalisations.
Enfin, ThemeSwitcherScripts devrait faciliter l'automation des thèmes Windows, qui est actuellement impossible.

Pour les créateurs, cela signifie écrire des scripts sur un modèle défini, qui permettent à l'utilisateur d'appliquer sont thème/style visuel très facilement. Le but est d'enlever la confusion entre les outils de personnalisation, et potentiellement certaine incompréhensions créée par cette confusion.

Les outils prise en charge sont, ou seront ajouter prochainement :
- Tout le outils libres/freeware de personnalisation du style visuel
- De nombreux outils de personnalisation de la barre des tâches
- De nombreux outils de personnalisation de l'explorateur de fichiers

Collection de scripts de commandes Windows pour changer de manière groupée l'apparence de l'interface utilisateur des Windows ultérieurs à Windows 10 1803 (ultérieur à Windows 7 dans le future). Il s'agit en quelque sorte d'une extension des fichier de configuration ini avec l'extension .theme.

Pour pouvoir utiliser ces scripts, vous devez avoir installer dans chaque profile utilisateur :

1. déplacez _uxsms.exe_ dans _%userprofile%\TSS\basic_
2. déplacez _classicthemetray.exe_ dans _%userprofile%\TSS\classic_
3. Répétez la copie de _uxsms.exe_ dans _%userprofile%\TSS\basic_ et de _classicthemetray.exe_ dans _%userprofile%\TSS\classic_ pour tout les autres comptes utilisateurs
4. Importez dans le planificateur de tâches les fichiers Apps.xml, Basic.xml, Classic.xml et Classic2.xml
5. Importez ce fichier de registre ( __/!\ ATTENTION, il est important de sauvegarder la clef précédente avant d'importer le fichier /!\__ ) 

Windows Registry Editor Version 5.00
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]
"Userinit"=""

6. Utilisez les scripts contenus dans la version 1.1 de ThemeSwitcherScript : https://github.com/OrthodoxWindows/ThemeSwitcherScripts/releases/tag/Release-1.1

Cela fonctionne sur mon système, mais rien ne me fait dire que cela fonctionnera sur les autres systèmes. Il est donc important de le tester en prenant un maximum de précautions. N'hésitez pas à m'informer si cela fonctionne ou ne fonctionne pas. Quant je serais sûr que cela fonctionne, je pourais écrire un script d'installation automatique.

Pour ajouter la prise en charge des fichiers .theme, vous devez copier winaero themeswitcher dans _%userprofile%\TSS\themeswitcher\_. Choisisez bien la version pour Windows 8 (et non pas pour Windows 7). https://winaero.com/winaero-theme-switcher/

Support des styles visuels personnalisées :
Theme Switcher Scripts supporte les styles visuels personnalisés avec un système patché avec des outils comme UXThemePatcher ou UXStyle. Par contre, Theme SwitcherScript ne supporte pour le moment pas SecureUXTheme (https://github.com/namazso/SecureUxTheme/issues/108).

Support Multi-utilisateur :
__Il est important d'ajouter les fichier dans le dossier utilisateur avec la variable d'envirronement %userprofile%, car cela permet le support multi-utilisateur.__ Cela ajoute la capacité d'exécuter simultanément, par exemple, le thème DWM-styled (style visuel par défaut) sur l'utilisateur A, le thème Basic sur l'utilisateur B et le thème Classic sur l'utilisateur C.
Pour le moment, il est impossible d'installer ThemeSwitcherScripts sur une partie des comptes utilisateurs. Il faut l'installer sur tout les comptes visible (et non pas les comptes invisibles).
