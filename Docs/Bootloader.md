# Arch Linux - Chargeur de démarrage

https://wiki.archlinux.org/title/Arch_boot_process
https://wiki.archlinux.org/title/Systemd-boot
https://wiki.archlinux.org/title/GRUB

## Systemd Boot

### Installation :
```
bootctl install
```

### Configuration
Modifier le fichier : `/boot/loader/loader.conf`
```
default arch.conf
timeout 0
```
Trouver les UUID des partitions :
```
lsblk -f
```
Créer le fichier : `/boot/loader/entries/arch.conf`
```
title Arch Linux
linux /vmlinuz-linux-lts
initrd /intel-ucode.img
initrd /initramfs-linux-lts.img
options root=/dev/sda3 rw quiet
options root=UUID=fc473f56-759d-4d66-8d53-9378645e7682 rw quiet
```

Créer le fichier : `/boot/loader/entries/arch-fallback.conf`
```
title Arch Linux
linux /vmlinuz-linux-lts
initrd /intel-ucode.img
initrd /initramfs-linux-lts-fallback.img
options root=/dev/sda3 rw
options root=UUID=fc473f56-759d-4d66-8d53-9378645e7682 rw
```

## Grub

### Installation
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
```

### Configuration
```
grub-mkconfig -o /boot/grub/grub.cfg
```

