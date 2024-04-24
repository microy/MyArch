# Installation de Arch Linux

https://wiki.archlinux.org/title/installation_guide
https://wiki.archlinux.org/title/Installation_guide_(Fran%C3%A7ais)

## Installation

### Configuration du clavier

```
loadkeys fr
```

### Configuration de l'horloge

```
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
```

### Partitionnement du disque

```
fdisk -l
fdisk /dev/disque

mkfs.fat -F 32 /dev/efi_system_partition
mkswap /dev/swap_partition
mkfs.ext4 /dev/root_partition
mkfs.ext4 /dev/home_partition
```

### Montage des partitions

```
mount /dev/root_partition /mnt
mount /dev/home_partition /mnt/home
mount --mkdir /dev/efi_system_partition /mnt/boot
swapon /dev/swap_partition
```

### Installation des packages essentiels

```
pacstrap -K /mnt base linux-lts linux-firmware networkmanager sudo nano bash-completion
```

## Configuration du système

### Génération du fichier fstab

```
# Avec UUID
genfstab -U /mnt >> /mnt/etc/fstab
# Avec label
genfstab -L /mnt >> /mnt/etc/fstab
```

### Change root du nouveau système

```
arch-chroot /mnt
```

### Configuration de l'horloge

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
```

### Configuration de la langue

```
locatectl set-keymap fr
localectl set-x11-keymap fr
localectl set-locale fr_FR.UTF-8 
locale-gen
```

```
sed -i 's/^#fr_FR.UTF-8/fr_FR.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'KEYMAP=fr' > /etc/vconsole.conf
```

### Configuration du réseau

```
echo 'hostname' /etc/hostname
systemctl enable NetworkManager.service
```

### Initramfs

```
mkinitcpio -P
```

### Configuration du password root

```
passwd
```

### Configuration d'un utilisateur sudo

```
useradd -m -G wheel,uucp username
passwd username
echo '%wheel ALL=(ALL:ALL) ALL' > /etc/sudoers.d/wheel
chmod -c 0440 /etc/sudoers.d/wheel
```

### Installation du chargeur de démarrage

#### Systemd Boot

Installation du bootloader :
```
bootctl install
```

Modifier le fichier : /boot/loader/loader.conf
```
default arch.conf
timeout 0
```

Créer le fichier : /boot/loader/entries/arch.conf
```
title Arch Linux
linux /vmlinuz-linux-lts
# initrd /intel-ucode.img
initrd /initramfs-linux-lts.img
options root=/dev/sda3 rw quiet
options root=UUID=fc473f56-759d-4d66-8d53-9378645e7682 rw quiet
```

Créer le fichier : /boot/loader/entries/arch-fallback.conf
```
title Arch Linux
linux /vmlinuz-linux-lts
# initrd /intel-ucode.img
initrd /initramfs-linux-lts-fallback.img
options root=/dev/sda3 rw
options root=UUID=fc473f56-759d-4d66-8d53-9378645e7682 rw
```

#### Grub

```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg
```



### Redémarrage

```
exit
umount -R /mnt
reboot
```