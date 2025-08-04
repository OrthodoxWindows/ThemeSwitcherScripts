# ThemeSwitcherScripts

![cmd_dVFuaVIWbk](https://user-images.githubusercontent.com/100134023/177014021-419b31c8-3530-4850-bdc6-c7009c575cad.png)

EN:

**Why this project :**

Windows allows a great capacity for customization; only, few of these functions are supported natively. The purpose of ThemeSwitcherScript and to be able to allow the user to patch his system with the addition of many customization tools at once, then to be able to apply themes natively supporting several customization tools.
Finally, ThemeSwitcherScripts should facilitate the automation of Windows themes, which is currently impossible.

For creators, this means writing scripts on a defined template, which allows the user to apply their theme/visual style very easily. The goal is to remove the confusion between customization tools, and potentially some misunderstandings created by this confusion.

Supported tools are :
- Switching to Basic and Classic themes, using the ClassicThemeTray and BasicThemer5 tools. Credit to Spitfire_x86 and Alcatel.
- Change of theme (for classic elements) via WinClassicThemeConfig. Credit to Franco Tortoriello.
- The change of .theme file (supported natively by Windows), with the WinaeroThemeSwitcher tool. Credit to Sergey Tkachenko.
- Automatic Windhawks mod toggle DISABLE-DWM-EXTENDED-FRAMES., useful for Basic and Classic themes. Credit to Taniko Yamamoto for the mods, and of course to Ramen Software, the creator of Windhawks.

In the future, the following tools will be supported:
- WinPaletter, to allow more advanced theme switching
- Toggle other Windhawk mods
- The toggle of some Explorer customization tools
- The switching of certain registry keys

A guide for theme makers, and maybe an ordering system to come.
For now, only Windows 10 themes are included by default. Windows 11 themes will be included in the future.

**Installation :**

1. Check your installation. ThemeSwitcherScripts can work on all versions of Windows 10 and 11, but currently works best in the latest versions of Windows 10. If you are using an older version of Windows 10, you will need to install Curl first. Curl is included by default from Windows 10 1803/Windows Server 2019.
2. Run INSTALL.EXE, and follow the instructions.
3. If your system contains several users, execute C:\TSS\INSTALL_ANOTHERS_USER.EXE after the installation for the 1st user, in the concerned session.
4. Install Windhawks mods "Disable DWM Extended Frames", "Non Immersive Taskbar Context Menu" and "Disable Immersive Context Menus". "Disable DWM Extended Frames" is not included in the Windhawks store, so you have to install it by clicking on "Create a new mod" in Windhawks, then copy and paste the text from the "DISABLE-DWM-EXTENDED-FRAMES.C" file into the editor. Next, compile the mod.
6. Enjoy !

**Limitations :**

- ThemeSwitcherScript supports multi-user systems, but with one limitation: avoid using multiple user sessions simultaneously. This exposes you to a black screen on login, and it disrupts Windhawks, which runs in single-user mode. Additionally, it is important that all user accounts have administrative privileges. ThemeSwitcherScript is therefore currently not usable on public posts such as cybercafés or media libraries. This may be fixed in the future.
- The Basic and Classic themes are no longer officially supported by Microsoft, the display of certain programs may not be correct. For explorer display issues, there are ways to fix them, don't hesitate to ask me about it.
- If you use custom visual styles (.msstyle), use a patcher like [UltraUxThemePatcher](https://mhoefs.eu/software_uxtheme.php?lang=en), or SecureUxTheme

**The current version is a pre-release, I cannot guarantee stability, use is at your own risk !**

FR:

**Pourquoi ce projet :**

Windows permet une très grande capacité de personnalisation ; seulement, peu de ces fonctions sont prise en charge nativement. Le but de ThemeSwitcherScript et de pouvoir permettre à l'utilisateur de patcher son système avec l'ajout de nombreux outils de personnalisations d'un seul coup, puis de pouvoir appliquer des thèmes prenant nativement en charge plusieurs outils de personnalisations.
Enfin, ThemeSwitcherScripts devrait faciliter l'automation des thèmes Windows, qui est actuellement impossible.

Pour les créateurs, cela signifie écrire des scripts sur un modèle défini, qui permettent à l'utilisateur d'appliquer sont thème/style visuel très facilement. Le but est d'enlever la confusion entre les outils de personnalisation, et potentiellement certaine incompréhensions créée par cette confusion.

Les outils prise en charge sont :
- Le basculement vers les thèmes Basique et Classique, à l'aide des outils ClassicThemeTray et BasicThemer5. Crédit à  Spitfire_x86 et à Alcatel.
- Le changement de thème (pour les éléemnts classiques) via WinClassicThemeConfig. Crédit à Franco Tortoriello.
- Le changement de fichier .theme (pris en charge nativement par Windows), avec l'outils WinaeroThemeSwitcher. Crédit à Sergey Tkachenko.
- Le basculement automatique du mod Windhawks DISABLE-DWM-EXTENDED-FRAMES., utile pour les thèmes Basique et Classique. Crédit à Taniko Yamamoto pour le mods, et bien sûr à  Ramen Software, le céateur de Windhawks.

A l'avenir, les outils suivant seron pris en charge :
- WinPaletter, pour permettre un changement de thème plus avancé
- Le basculement d'autres mods Windhawk
- Le basculement de certains outils de peronnalisation de l'Explorateur
- Le basculement de certaines clefs de registre

Un guide pour les créateurs de thèmes, et peut-être un système de commande à prévu.
Pour l'instant, seul les thèmes de Windows 10 sont inclus par défaut. Les thèmes de Windows 11 seront inclus à l'avenir.

**Installation :**

1. Vérifiez votre installation. ThemeSwitcherScripts peut fonctionner sur toute les versions de Windows 10 et 11, mais fonctionne pour l'instant mieux dans les dernières versions de Windows 10. Si vous utilisez une version ancienne de Windows 10, il faudras installer Curl auparavant. Curl est inclu par défaut à partir de Windows 10 1803/Windows Server 2019.
2. Exécutez INSTALL.EXE, et suivez les instructions.
3. Si votre système contient plusieurs utilisateurs, exécutez C:\TSS\INSTALL_ANOTHERS_USER.EXE après l'instalaltion pour le 1er utilisateur, dans la session concerné.
4. Installez les mods Windhawks "Disable DWM Extended Frames", "Non Immersive Taskbar Context Menu" et "Disable Immersive Context Menus". "Disable DWM Extended Frames" n'est pas inclu dans la boutique Windhawks, il faut donc l'installer un cliquant sur "Créer un nouveau mod" dans Windhawks, puis en copier-coller le texte du fichier "DISABLE-DWM-EXTENDED-FRAMES.C" dans l'éditeur. Enuite, il faut compiler le mod.
6. Profitez !

**Limitation :**

- ThemeSwitcherScript supporte les systèmes multi-utilisateur, mais avec une limitation : il faut éviter d'utiliser plusieurs sessions utilisateur simultanément. Cela vous expose à un écran noir à l'ouverture de session, et cela perturbre Windhawks, qui fonctionne en mode mono-utilisateur. De plus, il est important que tout les comptes utilisateurs possèdent les privilèges d'administration. ThemeSwitcherScript n'est donc pour l'instant pas utilisable sur des posts publique tels que les cybercafés ou les médiathèques. Cela sera peut-être corrigé à l'avenir.
- Les thèmes Basique et Classique ne sont plus supporté officielement par Microsoft, l'affichage de certains programme risque de ne pas être bon. Pour les problèmes d'affichage de l'explorateur, il existe des moyens de les corriger, n'ésitez pas à me poser des questions à ce sujet.
- Si vous utilisez des styles visuels personnalisés (.msstyle), utiliser un patcher comme [UltraUxThemePatcher](https://mhoefs.eu/software_uxtheme.php?lang=en), ou SecureUXTheme.

**La version actuelle est une préversion, je ne peut pas garentir la stabilité, l'utilisation est a vos risques et périls !**
