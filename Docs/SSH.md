# SSH

https://wiki.archlinux.org/title/OpenSSH

## Installation
```
pacman -S openssh
```

## Configuration

Fichier `/etc/ssh/sshd_config.d/20-root.conf` :
```
PermitRootLogin no
```

## Service
```
systemctl try-restart sshd
```