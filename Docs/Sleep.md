# Sleep and hibernate

https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Tips_and_Tricks


Disable sleep completely

When using a device as e.g a server, suspending/hibernating might not be needed or it could even be undesired. Each sleep state can be disabled through systemd-sleep.conf(5):

Fichier `/etc/systemd/sleep.conf.d/disable-sleep.conf` :
```
[Sleep]
AllowSuspend=no
AllowHibernation=no
AllowHybridSleep=no
AllowSuspendThenHibernate=no
```
