# Pacman

https://wiki.archlinux.org/title/pacman
https://wiki.archlinux.org/title/Pacman/Tips_and_tricks
https://wiki.archlinux.org/title/Pacman/Pacnew_and_Pacsave

## Installation
```
pacman -S pacman-contrib
# Enable pacman cache cleanup service
systemctl enable --now paccache.timer
```

## Configuration
Modifier le fichier : `/etc/pacman.conf`
```
# Active la coloration
sed -i 's/#Color/Color/' /etc/pacman.conf
# Active les téléchargements parallèles
sed -i 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
```

## Mettre à jour le système
```
pacman -Syu paquet
```

## Installer un paquet
```
pacman -S paquet

pacman {-S --sync} [options ] [paquet(s)]
  -c, --clean              supprime les paquets obsolètes du cache (-cc pour tous)
  -d, --nodeps             ignore les versions des dépendances
                           (-dd pour ignorer complètement toute dépendance)
  -g, --groups             affiche tous les éléments d’un groupe de paquets
                           (-gg pour voir tous les groupes et leurs membres)
  -i, --info               affiche les informations d’un paquet (-ii pour les informations détaillées)
  -l, --list <dépôt>       liste tous les paquets d’un dépôt
  -p, --print              affiche les cibles au lieu d’effectuer les opérations
  -q, --quiet              affiche moins d’informations
  -r, --root <chemin>      définit la racine où installer
  -s, --search <regex>     recherche la chaîne correspondante dans les dépôts distants
  -u, --sysupgrade         met à jour tous les paquets installés
                           (-uu permet de restaurer des versions antérieures)
  -v, --verbose            affiche plus de détails
  -w, --downloadonly       ne fait que télécharger les paquets, sans rien installer
  -y, --refresh            met à jour les bases de données depuis le serveur
                           (-yy pour forcer une mise à jour des données à jour)


```

## Supprimer un paquet
```
pacman {-R --remove} [options ] <paquet(s)>
	-c, --cascade			supprime les paquets ainsi que tous ceux qui  n dépendent
	-n, --nosave			supprime les fichiers de configuration
	-s, --recursive			supprime les dépendances inutiles
							(-ss inclut les dépendances installées explicitement)
	-u, --unneeded			supprime les paquets inutiles
	-v, --verbose			affiche plus de détails

pacman -R paquet
pacman -Rs paquet
# Suppression avec les dépendances
pacman -Rc paquet
# Suppression du paquet avec les dépendances et les fichiers de configuration
pacman -Rn paquet
```

## Chercher un paquet
```
pacman -Ss paquet
pacman -Qs paquet
```

## List all explicitly installed packages
```
pacman -Qe

Keeping a list of all explicitly installed packages can be useful to backup a system or quicken the installation of a new one:

pacman -Qqe > pkglist.txt
```

## Removing unused packages (orphans)
```
pacman -Qqd | pacman -Rsu --print -
pacman -Qdtq | pacman -Rns -
pacman -Rs $(pacman -Qtdq)
```

## Afficher les dépendances d'un paquet
```
pacman -Qi paquet
```

## dry run

Pacman always lists packages to be installed or removed, and asks for permission before taking any action.

To get a list in a processable format, and to prevent the actions of -S, -U and -R, you can use
```
pacman {-p --print}
```

### Install packages from a list

To install packages from a previously saved list of packages, while not reinstalling previously installed packages that are already up-to-date, run:
```
pacman -S --needed - < pkglist.txt
pacman -S --needed $(grep -v ^\# pkglist.txt)


```

