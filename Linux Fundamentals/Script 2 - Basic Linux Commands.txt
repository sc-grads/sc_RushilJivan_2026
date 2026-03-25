root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# pwd
/home/Linux_Fundamentals
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# PWD
PWD: command not found
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# Pwd
Command 'Pwd' not found, did you mean:
  command 'xwd' from deb x11-apps (7.7+11)
  command 'pwd' from deb coreutils (9.4-2ubuntu2)
Try: apt install <deb name>
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# cd /etc
root@LAPTOP-66HI94H2:/etc# pwd
/etc
root@LAPTOP-66HI94H2:/etc# cd
root@LAPTOP-66HI94H2:~# pwd
/root
root@LAPTOP-66HI94H2:~# ls
root@LAPTOP-66HI94H2:~# ls -l
total 0
root@LAPTOP-66HI94H2:~# cd /etc
root@LAPTOP-66HI94H2:/etc# ls
PackageKit              dbus-1          hostname        manpath.config       rc0.d          sudo_logsrvd.conf
X11                     dconf           hosts           mime.types           rc1.d          sudoers
adduser.conf            debconf.conf    init.d          mke2fs.conf          rc2.d          sudoers.d
alternatives            debian_version  inputrc         modprobe.d           rc3.d          supercat
apparmor                default         iproute2        modules              rc4.d          sysctl.conf
apparmor.d              deluser.conf    issue           modules-load.d       rc5.d          sysctl.d
apport                  depmod.d        issue.net       mtab                 rc6.d          systemd
apt                     dhcp            kernel          nanorc               rcS.d          terminfo
bash.bashrc             dhcpcd.conf     landscape       netconfig            resolv.conf    timezone
bash_completion         dpkg            ld.so.cache     netplan              rmt            tmpfiles.d
bash_completion.d       e2scrub.conf    ld.so.conf      networkd-dispatcher  rpc            ubuntu-advantage
bindresvport.blacklist  environment     ld.so.conf.d    networks             rsyslog.conf   ucf.conf
binfmt.d                environment.d   ldap            newt                 rsyslog.d      udev
byobu                   ethertypes      legal           nsswitch.conf        security       update-manager
ca-certificates         fonts           libaudit.conf   opt                  selinux        update-motd.d
ca-certificates.conf    fstab           locale.alias    os-release           sensors.d      vconsole.conf
cloud                   fuse.conf       locale.conf     pam.conf             sensors3.conf  vim
console-setup           gai.conf        locale.gen      pam.d                services       vtrgb
credstore               glvnd           localtime       passwd               sgml           vulkan
credstore.encrypted     gnutls          logcheck        perl                 shadow         wgetrc
cron.d                  gprofng.rc      login.defs      pm                   shells         wsl.conf
cron.daily              groff           logrotate.conf  polkit-1             skel           xattr.conf
cron.hourly             group           logrotate.d     profile              ssh            xdg
cron.monthly            gshadow         lsb-release     profile.d            ssl            xml
cron.weekly             gss             machine-id      protocols            subgid         zsh_command_not_found
cron.yearly             gtk-3.0         magic           python3              subuid
crontab                 host.conf       magic.mime      python3.12           sudo.conf
root@LAPTOP-66HI94H2:/etc# ls -l
total 764
drwxr-xr-x 2 root root       4096 Jan  6  2025 PackageKit
drwxr-xr-x 7 root root       4096 Jan  6  2025 X11
-rw-r--r-- 1 root root       3444 Jul  5  2023 adduser.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 alternatives
drwxr-xr-x 2 root root       4096 Jan  6  2025 apparmor
drwxr-xr-x 9 root root       4096 Jan  6  2025 apparmor.d
drwxr-xr-x 3 root root       4096 Jan  6  2025 apport
drwxr-xr-x 8 root root       4096 Jan  6  2025 apt
-rw-r--r-- 1 root root       2319 Mar 31  2024 bash.bashrc
-rw-r--r-- 1 root root         45 Jan 25  2020 bash_completion
drwxr-xr-x 2 root root       4096 Jan  6  2025 bash_completion.d
-rw-r--r-- 1 root root        367 Aug  2  2022 bindresvport.blacklist
drwxr-xr-x 2 root root       4096 Apr 19  2024 binfmt.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 byobu
drwxr-xr-x 3 root root       4096 Jan  6  2025 ca-certificates
-rw-r--r-- 1 root root       6288 Jan  6  2025 ca-certificates.conf
drwxr-xr-x 5 root root       4096 Jan  6  2025 cloud
drwxr-xr-x 2 root root       4096 Jan  6  2025 console-setup
drwx------ 2 root root       4096 Apr 19  2024 credstore
drwx------ 2 root root       4096 Apr 19  2024 credstore.encrypted
drwxr-xr-x 2 root root       4096 Jan  6  2025 cron.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 cron.daily
drwxr-xr-x 2 root root       4096 Jan  6  2025 cron.hourly
drwxr-xr-x 2 root root       4096 Jan  6  2025 cron.monthly
drwxr-xr-x 2 root root       4096 Jan  6  2025 cron.weekly
drwxr-xr-x 2 root root       4096 Jan  6  2025 cron.yearly
-rw-r--r-- 1 root root       1136 Mar 31  2024 crontab
drwxr-xr-x 4 root root       4096 Jan  6  2025 dbus-1
drwxr-xr-x 3 root root       4096 Jan  6  2025 dconf
-rw-r--r-- 1 root root       2967 Apr 12  2024 debconf.conf
-rw-r--r-- 1 root root         11 Apr 22  2024 debian_version
drwxr-xr-x 2 root root       4096 Jan  6  2025 default
-rw-r--r-- 1 root root       1706 Jul  5  2023 deluser.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 depmod.d
drwxr-xr-x 3 root root       4096 Jan  6  2025 dhcp
-rw-r--r-- 1 root root       1429 Mar 31  2024 dhcpcd.conf
drwxr-xr-x 4 root root       4096 Jan  6  2025 dpkg
-rw-r--r-- 1 root root        685 Apr  8  2024 e2scrub.conf
-rw-r--r-- 1 root root        106 Jan  6  2025 environment
drwxr-xr-x 2 root root       4096 Jan  6  2025 environment.d
-rw-r--r-- 1 root root       1853 Oct 18  2022 ethertypes
drwxr-xr-x 4 root root       4096 Jan  6  2025 fonts
-rw-r--r-- 1 root root         37 Jan  6  2025 fstab
-rw-r--r-- 1 root root        694 Apr  8  2024 fuse.conf
-rw-r--r-- 1 root root       2584 Jan 31  2024 gai.conf
drwxr-xr-x 3 root root       4096 Jan  6  2025 glvnd
drwxr-xr-x 2 root root       4096 Jan  6  2025 gnutls
-rw-r--r-- 1 root root       3986 Aug  7  2024 gprofng.rc
drwxr-xr-x 2 root root       4096 Jan  6  2025 groff
-rw-r--r-- 1 root root        713 Jan  6  2025 group
-rw-r----- 1 root shadow      602 Jan  6  2025 gshadow
drwxr-xr-x 3 root root       4096 Jan  6  2025 gss
drwxr-xr-x 2 root root       4096 Jan  6  2025 gtk-3.0
-rw-r--r-- 1 root root         92 Apr 22  2024 host.conf
-rw-r--r-- 1 root root         16 Mar 25 08:47 hostname
-rw-r--r-- 1 root root        427 Mar 25 08:47 hosts
drwxr-xr-x 2 root root       4096 Jan  6  2025 init.d
-rw-r--r-- 1 root root       1875 Mar 31  2024 inputrc
drwxr-xr-x 4 root root       4096 Jan  6  2025 iproute2
-rw-r--r-- 1 root root         26 Aug 23  2024 issue
-rw-r--r-- 1 root root         19 Aug 23  2024 issue.net
drwxr-xr-x 4 root root       4096 Jan  6  2025 kernel
drwxrwxr-x 2 root landscape  4096 Jan  6  2025 landscape
-rw-r--r-- 1 root root      17607 Mar 25 08:47 ld.so.cache
-rw-r--r-- 1 root root         34 Aug  2  2022 ld.so.conf
drwxr-xr-x 2 root root       4096 Mar 24 10:45 ld.so.conf.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 ldap
-rw-r--r-- 1 root root        267 Apr 22  2024 legal
-rw-r--r-- 1 root root        191 Mar 31  2024 libaudit.conf
-rw-r--r-- 1 root root       2996 Mar 30  2024 locale.alias
-rw-r--r-- 1 root root         13 Jan  6  2025 locale.conf
-rw-r--r-- 1 root root       9565 Jan  6  2025 locale.gen
lrwxrwxrwx 1 root root         39 Mar 25 08:47 localtime -> /usr/share/zoneinfo/Africa/Johannesburg
drwxr-xr-x 3 root root       4096 Jan  6  2025 logcheck
-rw-r--r-- 1 root root      12345 Feb 22  2024 login.defs
-rw-r--r-- 1 root root        586 Apr  8  2024 logrotate.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 logrotate.d
-rw-r--r-- 1 root root        104 Aug 23  2024 lsb-release
-r--r--r-- 1 root root         33 Mar 24 10:45 machine-id
-rw-r--r-- 1 root root        111 Mar 31  2024 magic
-rw-r--r-- 1 root root        111 Mar 31  2024 magic.mime
-rw-r--r-- 1 root root       5230 Apr  8  2024 manpath.config
-rw-r--r-- 1 root root      75113 Jul 12  2023 mime.types
-rw-r--r-- 1 root root        744 Apr  8  2024 mke2fs.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 modprobe.d
-rw-r--r-- 1 root root        212 Jan  6  2025 modules
drwxr-xr-x 2 root root       4096 Jan  6  2025 modules-load.d
lrwxrwxrwx 1 root root         19 Jan  6  2025 mtab -> ../proc/self/mounts
-rw-r--r-- 1 root root      11424 May 23  2023 nanorc
-rw-r--r-- 1 root root        767 Mar 31  2024 netconfig
drwxr-xr-x 2 root root       4096 Apr 18  2024 netplan
drwxr-xr-x 8 root root       4096 Jan  6  2025 networkd-dispatcher
-rw-r--r-- 1 root root         91 Apr 22  2024 networks
drwxr-xr-x 2 root root       4096 Jan  6  2025 newt
-rw-r--r-- 1 root root        526 Jan  6  2025 nsswitch.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 opt
lrwxrwxrwx 1 root root         21 Aug 23  2024 os-release -> ../usr/lib/os-release
-rw-r--r-- 1 root root        552 Oct 13  2022 pam.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 pam.d
-rw-r--r-- 1 root root       1380 Jan  6  2025 passwd
drwxr-xr-x 3 root root       4096 Jan  6  2025 perl
drwxr-xr-x 3 root root       4096 Jan  6  2025 pm
drwxr-xr-x 3 root root       4096 Jan  6  2025 polkit-1
-rw-r--r-- 1 root root        582 Apr 22  2024 profile
drwxr-xr-x 2 root root       4096 Jan  6  2025 profile.d
-rw-r--r-- 1 root root       3144 Oct 18  2022 protocols
drwxr-xr-x 2 root root       4096 Jan  6  2025 python3
drwxr-xr-x 2 root root       4096 Jan  6  2025 python3.12
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc0.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc1.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc2.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc3.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc4.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc5.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rc6.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 rcS.d
lrwxrwxrwx 1 root root         20 Mar 25 08:45 resolv.conf -> /mnt/wsl/resolv.conf
lrwxrwxrwx 1 root root         13 Apr  8  2024 rmt -> /usr/sbin/rmt
-rw-r--r-- 1 root root        911 Oct 18  2022 rpc
-rw-r--r-- 1 root root       1213 Mar 22  2024 rsyslog.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 rsyslog.d
drwxr-xr-x 4 root root       4096 Jan  6  2025 security
drwxr-xr-x 2 root root       4096 Jan  6  2025 selinux
drwxr-xr-x 2 root root       4096 Jan  6  2025 sensors.d
-rw-r--r-- 1 root root      10593 Mar 31  2024 sensors3.conf
-rw-r--r-- 1 root root      12813 Mar 28  2021 services
drwxr-xr-x 2 root root       4096 Jan  6  2025 sgml
-rw-r----- 1 root shadow      702 Jan  6  2025 shadow
-rw-r--r-- 1 root root        132 Jan  6  2025 shells
drwxr-xr-x 2 root root       4096 Jan  6  2025 skel
drwxr-xr-x 3 root root       4096 Jan  6  2025 ssh
drwxr-xr-x 4 root root       4096 Jan  6  2025 ssl
-rw-r--r-- 1 root root          0 Jan  6  2025 subgid
-rw-r--r-- 1 root root          0 Jan  6  2025 subuid
-rw-r--r-- 1 root root       4343 Apr  8  2024 sudo.conf
-rw-r--r-- 1 root root       9804 Apr  8  2024 sudo_logsrvd.conf
-r--r----- 1 root root       1800 Jan 29  2024 sudoers
drwxr-xr-x 2 root root       4096 Jan  6  2025 sudoers.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 supercat
-rw-r--r-- 1 root root       2209 Mar 24  2024 sysctl.conf
drwxr-xr-x 2 root root       4096 Jan  6  2025 sysctl.d
drwxr-xr-x 6 root root       4096 Jan  6  2025 systemd
drwxr-xr-x 2 root root       4096 Jan  6  2025 terminfo
-rw-r--r-- 1 root root         20 Mar 25 08:47 timezone
drwxr-xr-x 2 root root       4096 Apr 19  2024 tmpfiles.d
drwxr-xr-x 2 root root       4096 Jan  6  2025 ubuntu-advantage
-rw-r--r-- 1 root root       1260 Jan 27  2023 ucf.conf
drwxr-xr-x 4 root root       4096 Jan  6  2025 udev
drwxr-xr-x 3 root root       4096 Jan  6  2025 update-manager
drwxr-xr-x 2 root root       4096 Jan  6  2025 update-motd.d
lrwxrwxrwx 1 root root         16 Jan  6  2025 vconsole.conf -> default/keyboard
drwxr-xr-x 2 root root       4096 Jan  6  2025 vim
lrwxrwxrwx 1 root root         23 Feb 26  2024 vtrgb -> /etc/alternatives/vtrgb
drwxr-xr-x 5 root root       4096 Jan  6  2025 vulkan
-rw-r--r-- 1 root root       4942 Jun 19  2024 wgetrc
-rw-r--r-- 1 root root         20 Jan  6  2025 wsl.conf
-rw-r--r-- 1 root root        681 Apr  8  2024 xattr.conf
drwxr-xr-x 5 root root       4096 Jan  6  2025 xdg
drwxr-xr-x 2 root root       4096 Jan  6  2025 xml
-rw-r--r-- 1 root root        460 Jan 20  2023 zsh_command_not_found
root@LAPTOP-66HI94H2:/etc# ls -l shells
-rw-r--r-- 1 root root 132 Jan  6  2025 shells
root@LAPTOP-66HI94H2:/etc# cat shells
# /etc/shells: valid login shells
/bin/sh
/usr/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/usr/bin/dash
/usr/bin/tmux
root@LAPTOP-66HI94H2:/etc# man ls
root@LAPTOP-66HI94H2:/etc#
