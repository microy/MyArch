#!/bin/bash
# /etc/X11/xinit/xinitrc.d/90-qt5ct.sh

# Enable qt5ct by default unless another PLATFORMTHEME option is set
# or KDE is running.
if [ -z "$QT_QPA_PLATFORMTHEME" ] && [ "$XDG_CURRENT_DESKTOP" != "KDE" ]
then
        export QT_QPA_PLATFORMTHEME=qt5ct
		export QT_ACCESSIBILITY=1
fi
