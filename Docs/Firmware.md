# Arch Linux - Firmware

https://wiki.archlinux.org/title/Fwupd


## Installation du paquet gérant les firmwares :
```
pacman -S fwupd
```

## Affichage du matériel supporté :
```
fwupdmgr get-devices
```

## Téléchargement des derniers informations sur les firmware :
```
fwupdmgr refresh
```

## Affichage du matériel pouvant être mis à jour :
```
fwupdmgr get-updates
```

## Installation des mises à jour :
```
fwupdmgr update
```
