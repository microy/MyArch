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
kwriteconfig6 --file kscreenlockerrc ---group Greeter --group Wallpaper --group org.kde.color --group General --key Color 46,52,54

# Kdeglobal
kwriteconfig6 --file kdeglobals --group KDE --key AnimationDurationFactor 0
kwriteconfig6 --file kdeglobals --group Sounds --key Enable false

# Keyboard
kwriteconfig6 --file kxkbrc --group Layout --key Model pc105

