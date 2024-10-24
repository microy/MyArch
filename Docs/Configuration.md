# Configuration Arch Linux

## Horloge

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
```

```
timedatectl set-ntp true
```

```
mkdir /etc/systemd/timesyncd.conf.d/ 
nano /etc/systemd/timesyncd.conf.d/ub.conf

[Time]
NTP=ntp.u-bourgogne.fr
FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org


systemctl restart systemd-timesyncd.service
systemctl status systemd-timesyncd.service 
```

## Utilisateur

Création d'un utilisateur :
```
useradd -m -G wheel,uucp username
passwd username
```

## Firmware

https://wiki.archlinux.org/title/Fwupd

Installation du paquet gérant les firmwares :
```
pacman -S fwupd
```

Affiche le matériel supporté :
```
fwupdmgr get-devices
```

Télécharge les derniers informations sur les firmware :
```
fwupdmgr refresh
```

Affiche le matériel pouvant être mis à jour :
```
fwupdmgr get-updates
```

Installe les mises ç jour :
```
fwupdmgr update
```


## Sudo

Active le groupe wheel pour sudo :
```
echo '%wheel ALL=(ALL:ALL) ALL' > /etc/sudoers.d/wheel
chmod -c 0440 /etc/sudoers.d/wheel
```

Garde les variables d'environnement SSH :
```
echo 'Defaults env_keep += "SSH_TTY"' > /etc/sudoers.d/ssh
chmod -c 0440 /etc/sudoers.d/ssh
```

## Pacman

```
pacman-contrib
```

Fichier /etc/pacman.conf

```
sed -i 's/#Color/Color/' /etc/pacman.conf
sed -i 's/#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
```

## Security

Faillock :
https://wiki.archlinux.org/title/Security#Lock_out_user_after_three_failed_login_attempts

```
deny = 0
```


## Desktop

### Cinnamon

Installation :
```
pacman -S lightdm lightdm-slick-greeter numlockx pipewire pipewire-pulse xdg-user-dirs xdg-user-dirs-gtk gnome-keyring gnome-terminal cinnamon cinnamon-translations nemo-fileroller blueberry system-config-printer ttf-ubuntu-font-family 
```

### Lightdm

Fichier /etc/lightdm/lightdm.conf :
```
[Seat:*]
greeter-session=lightdm-slick-greeter
```

Fichier /etc/lightdm/slick-greeter.conf :
```
[Greeter]
content-align=center
draw-user-backgrounds=false
```

Active ligthdm :
```
systemctl enable lightdm
```

### Nvidia

https://wiki.archlinux.org/title/NVIDIA

Installation des packages :
```
pacman -S nvidia-lts nvidia-xconfig nvidia-settings
```

Configuration :
```
nvidia-xconfig
```

Hook pour les mises à jours :
```
nano /etc/pacman.d/hooks/nvidia.hook
```

### Logiciels
```
firefox vlc gimp thunderbird thunderbird-i18n-fr flameshot libreoffice-still libreoffice-still-fr unison wireshark chromium code hunspell-fr hyphen-fr mythes-fr virtualbox nextcloud-client
```

Modification des groupes utilisateurs
```
gpasswd -a mroy vboxusers
gpasswd -a mroy wireshark
```

### Imrpimantes
```
pacman -S cups cups-pdf foomatic-db-ppds foomatic-db-gutenprint-ppds foomatic-db-nonfree-ppds
systemctl enable -now cups
```

### SSH
```
systemctl enable --now sshd
```

## Services
```
systemctl enable --now reflector.timer
systemctl enable --now fstrim.timer
systemctl enable --now paccache.timer
systemctl enable --now systemd-resolved.service
systemctl enable --now systemd-timesyncd.service
systemctl enable --now bluetooth.service
systemctl enable --now cups.service
systemctl enable --now sshd.service
systemctl enable --now sddm.service
systemctl enable --now systemd-boot-update.service
```