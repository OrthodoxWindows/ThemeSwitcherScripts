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

To be able to use these scripts, you must have installed in each user profile :

- ThemeSwitcher (https://winaero.com/winaero-theme-switcher/), in the directory: _%userprofile%\TSS\ThemeSwitcher\ThemeSwitcher.exe_
- ClassicThemeTray (https://github.com/spitfirex86/ClassicThemeTray), in the directory : _%userprofile%\TSS\Classic\ClassicThemeTray.exe_
- BasicThemer2 (https://github.com/Ingan121/BasicThemer2), in the directory : _%userprofile%\TSS\Basic\BasicThemer2.exe_

In addition, you must have completed the first 6 steps of this tutorial: https://github.com/valinet/ExplorerPatcher/discussions/167.

Finally, you must have created a scheduled task named _BasicTheme_, with the user logon as the trigger, and the command _C:\BasicTheme\BasicThemer2.exe_ as the action. The box _Only start the task if the computer is connected to the power source_ must be unchecked, the box _Run with maximum permissions_ must be checked, and the button _Run only if the user is logged on_ must be be selected.

Support for custom visual styles:
Theme Switcher Scripts supports custom visual styles with a system patched with Tools like UXThemePatcher or UXStyle. However, Theme SwitcherScript currently does not support SecureUXTheme (https://github.com/namazso/SecureUxTheme/issues/108).

Multi-user support:
Currently, Theme SwitcherScripts does not support having classic themes across multiple user sessions.
The problem comes from the unsuitability of the scheduled tasks for a multi-user system. For Basic theme, it's not a big deal, because BasicThemer2 can start after explorer.exe (BasicThemer2 changes windows on the fly), but it's more complicated for Classic theme, because ClassicThemeTray has to start before explorer.exe (otherwise, explorer.exe will not start with the classic theme).
It is important to add the files to the user folder with the %userprofile% environment variable, as this allows multi-user support for the basic theme, and soon for the classic theme.

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

- ThemeSwitcher (https://winaero.com/winaero-theme-switcher/), dans le répertoire : _%userprofile%\TSS\ThemeSwitcher\ThemeSwitcher.exe_
- ClassicThemeTray (https://github.com/spitfirex86/ClassicThemeTray), dans le répertoire : _%userprofile%\TSS\ClassicThemeTray.exe_
- BasicThemer2 (https://github.com/Ingan121/BasicThemer2), dans le répertoire : _%userprofile%\TSS\Basic\BasicThemer2.exe_

De plus, vous devez avoir réalisé les 6 premières étape de ce tutoriel : https://github.com/valinet/ExplorerPatcher/discussions/167.

Enfin, vous devez avoir créé une tâche planifié nommée _BasicTheme_, avec comme déclencheur l'ouverture de session d'un utilisateur, et comme action la commande _%userprofile%\TSS\Basic\BasicThemer2.exe_. La case _Ne démarrer la tâche que si l'ordinateur est relié au secteur_ doit être décochée, la case _Exécuter avec les autorisations maximales_ doit être cochée, et le bouton _N'exécuter que si l'utilisateur est connecté_ doit être sélectionner.

Support des styles visuels personnalisées :
Theme Switcher Scripts supporte les styles visuels personnalisés avec un système patché avec des Outils comme UXThemePatcher ou UXStyle. Par contre, Theme SwitcherScript ne supporte pour le moment pas SecureUXTheme (https://github.com/namazso/SecureUxTheme/issues/108).

Support Multi-utilisateur :
Pour l'instant, Theme SwitcherScripts ne supporte pas la présence du thèmes classique sur plusieurs sessions utilisateurs.
Le problème vient de l'inadaptation des tâches planifiés pour un système multi-utilisateur. Pour le thème Basic, ce n'est pas très grave, car BasicThemer2 peut démarrer après explorer.exe (BasicThemer2 modifie les fenêtres à la volée), mais cela est plus compliqué pour le thème classique, car ClassicThemeTray doit démarrer avant explorer.exe (sinon, explorer.exe ne démarre pas avec le thème classique).
Il est important d'ajouter les fichier dans le dossier utilisateur avec la variable d'envirronement %userprofile%, car cela permet le support multi-utilisateur pour le thème basic, et prochainement pour le thème classique.
