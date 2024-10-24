#! /bin/bash

# Décorations de fenêtres (Breeze)
kwriteconfig6 --file breezerc --group Common --key OutlineCloseButton true
kwriteconfig6 --file breezerc --group Common --key OutlineIntensity OutlineHigh
kwriteconfig6 --file breezerc --group Common --key ShadowSize ShadowMedium

# Dolphin
kwriteconfig6 --file dolphinrc --group General --key RememberOpenedTabs false
kwriteconfig6 --file dolphinrc --group General --key ShowFullPathInTitlebar true

# Kwin
kwriteconfig6 --file kwinrc --group Desktops --key Number 2
kwriteconfig6 --file kwinrc --group Desktops --key Rows 1

# KSplash
kwriteconfig6 --file ksplashrc --group KSplash --key Engine none
kwriteconfig6 --file ksplashrc --group KSplash --key Theme none

# Kscreenlocker
kwriteconfig6 --file kscreenlockerrc --group Greeter --key WallpaperPlugin org.kde.color
kwriteconfig6 --file kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.color --group General --key Color 46,52,54

# Kdeglobals
kwriteconfig6 --file kdeglobals --group KDE --key AnimationDurationFactor 0
kwriteconfig6 --file kdeglobals --group KDE --key LookAndFeelPackage org.kde.breezetwilight.desktop
kwriteconfig6 --file kdeglobals --group KScreen --key ScaleFactor 1.25
kwriteconfig6 --file kdeglobals --group Sounds --key Enable false
kwriteconfig6 --file kdeglobals --group WM --key activeBackground 71,80,87

# Keyboard
kwriteconfig6 --file kxkbrc --group Layout --key Model pc105
kwriteconfig6 --file kcminputrc --group Keyboard --key NumLock 0

# Fonts
kwriteconfig6 --file kcmfonts --group General --key forceFontDPI 

