# ThemeSwitcherScripts

![cmd_dVFuaVIWbk](https://user-images.githubusercontent.com/100134023/177014021-419b31c8-3530-4850-bdc6-c7009c575cad.png)

EN:

Collection of batch scripts to change the appearance of the Windows 8+ user interface. An extension of the .theme ini files.

To be able to use these scripts, you must have installed:

- ThemeSwitcher (https://winaero.com/winaero-theme-switcher/), in the directory: _C:\ThemeSwitcher\Windows 8\ThemeSwitcher.exe_
- ClassicThemeTray (https://github.com/spitfirex86/ClassicThemeTray), in the directory : _C:\Classic\ClassicThemeTray.exe_
- BasicThemer2 (https://github.com/Ingan121/BasicThemer2), in the directory : _C:\Basic\BasicThemer2.exe_

In addition, you must have completed the first 6 steps of this tutorial: https://github.com/valinet/ExplorerPatcher/discussions/167.

Finally, you must have created a scheduled task named _BasicTheme_, with the user logon as the trigger, and the command _C:\BasicTheme\BasicThemer2.exe_ as the action. The box _Only start the task if the computer is connected to the power source_ must be unchecked, the box _Run with maximum permissions_ must be checked, and the button _Run only if the user is logged on_ must be be selected.

Support for custom visual styles:
Theme Switcher Scripts supports custom visual styles with a system patched with Tools like UXThemePatcher or UXStyle. However, Theme SwitcherScript currently does not support SecureUXTheme.

Multi-user support:
Currently, Theme SwitcherScripts does not support having different themes across multiple user sessions.
The problem comes from the unsuitability of the scheduled tasks for a multi-user system. For Basic theme, it's not a big deal, because BasicThemer2 can start after explorer.exe (BasicThemer2 changes windows on the fly), but it's more complicated for Classic theme, because ClassicThemeTray has to start before explorer.exe ( otherwise, explorer.exe will not start with the classic theme).

FR:

Collection de scripts de commandes Windows pour changer de manière groupée l'apparence de l'interface utilisateur des Windows ultérieurs à Windows 7. Il s'agit en quelque sorte d'une extension des fichier ini de configuration avec l'extension .theme.

Pour pouvoir utiliser ces scripts, vous devez avoir installer :

- ThemeSwitcher (https://winaero.com/winaero-theme-switcher/), dans le répertoire : _C:\ThemeSwitcher\Windows 8\ThemeSwitcher.exe_
- ClassicThemeTray (https://github.com/spitfirex86/ClassicThemeTray), dans le répertoire : _C:\Classic\ClassicThemeTray.exe_
- BasicThemer2 (https://github.com/Ingan121/BasicThemer2), dans le répertoire : _C:\Basic\BasicThemer2.exe_

De plus, vous devez avoir réalisé les 6 premières étape de ce tutoriel : https://github.com/valinet/ExplorerPatcher/discussions/167.

Enfin, vous devez avoir créé une tâche planifié nommée _BasicTheme_, avec comme déclencheur l'ouverture de session d'un utilisateur, et comme action la commande _C:\BasicTheme\BasicThemer2.exe_. La case _Ne démarrer la tâche que si l'ordinateur est relié au secteur_ doit être décochée, la case _Exécuter avec les autorisations maximales_ doit être cochée, et le bouton _N'exécuter que si l'utilisateur est connecté_ doit être sélectionner.

Support des styles visuels personnalisées :
Theme Switcher Scripts supporte les styles visuels personnalisés avec un système patché avec des Outils comme UXThemePatcher ou UXStyle. Par contre, Theme SwitcherScript ne supporte pour le moment pas SecureUXTheme.

Support Multi-utilisateur :
Pour l'instant, Theme SwitcherScripts ne supporte pas la présence de thèmes différend sur plusieurs sessions utilisateurs.
Le problème vient de l'inadaptation des tâches planifiés pour un système multi-utilisateur. Pour le thème Basic, ce n'est pas très grave, car BasicThemer2 peut démarrer après explorer.exe (BasicThemer2 modifie les fenêtres à la volée), mais cela est plus compliqué pour le thème classique, car ClassicThemeTray doit démarrer avant explorer.exe (sinon, explorer.exe ne démarre pas avec le thème classique).
