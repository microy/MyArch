# Arch Linux - Nvidia

https://wiki.archlinux.org/title/NVIDIA
https://wiki.archlinux.org/title/Vulkan
https://wiki.archlinux.org/title/GPGPU


## Installation des packages :
```
pacman -S nvidia-lts nvidia-settings nvidia-utils vulkan-icd-loader opencl-nvidia ocl-icd
```


## Activation du mode settings

Fichier `/boot/loader/entries/arch.conf` :
```
options root=.... rw quiet splash nvidia_drm.modeset=1
```


## Hook pour les mises à jours :
Créer le fichier : `/etc/pacman.d/hooks/nvidia.hook`
```
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia-lts
Target=linux-lts

[Action]
Description=Update NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```
