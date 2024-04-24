# Arch Linux - Sudo

https://wiki.archlinux.org/title/sudo

## Installation
```
pacman -S sudo
```

## Configuration du groupe wheel
Donner les droits administrateurs au group wheel :
```
echo '%wheel ALL=(ALL:ALL) ALL' > /etc/sudoers.d/wheel
chmod --changes 0440 /etc/sudoers.d/wheel
```
Ajouter un utilisateur au groupe wheel :
```
gpasswd --add username wheel
```

## Conservation des variables SSH
Conservation de la variable d'environnement SSH_TTY :
```
echo 'Defaults env_keep += "SSH_TTY"' > /etc/sudoers.d/ssh
chmod --changes 0440 /etc/sudoers.d/ssh
```
