#! /bin/bash

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo 'fr_FR.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=fr_FR.UTF-8' > /etc/locale.conf
echo 'KEYMAP=fr' > /etc/vconsole.conf

echo 'hostname' > /etc/hostname
systemctl enable NetworkManager.service

mkinitcpio -P

bootctl install

passwd

useradd -m -G wheel,uucp username
passwd username

echo '%wheel ALL=(ALL:ALL) ALL' > /etc/sudoers.d/wheel
chmod -c 0440 /etc/sudoers.d/wheel

echo 'Defaults env_keep += "SSH_TTY"' > /etc/sudoers.d/ssh
chmod -c 0440 /etc/sudoers.d/ssh

