root@LAPTOP-66HI94H2:/home# pwd
/home
root@LAPTOP-66HI94H2:/home# ls -la
total 12
drwxr-xr-x  3 root root 4096 Mar 25 09:45 .
drwxr-xr-x 27 root root 4096 Mar 25 09:43 ..
drwxr-xr-x  2 root root 4096 Mar 25 09:55 Linux_Fundamentals
root@LAPTOP-66HI94H2:/home# pwd
/home
root@LAPTOP-66HI94H2:/home# cd ..
root@LAPTOP-66HI94H2:/# pwd
/
root@LAPTOP-66HI94H2:/# cd ..
root@LAPTOP-66HI94H2:/# pwd
/
root@LAPTOP-66HI94H2:/# ls -la
total 2824
drwxr-xr-x  27 root root    4096 Mar 25 09:43 .
drwxr-xr-x  27 root root    4096 Mar 25 09:43 ..
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x  87 root root    4096 Mar 25 10:23 etc
drwxr-xr-x   3 root root    4096 Mar 25 09:45 home
-rwxr-xr-x   1 root root 2781568 Dec 12 03:58 init
lrwxrwxrwx   1 root root       7 Apr 22  2024 lib -> usr/lib
drwxr-xr-x   2 root root    4096 Apr  8  2024 lib.usr-is-merged
lrwxrwxrwx   1 root root       9 Apr 22  2024 lib64 -> usr/lib64
drwx------   2 root root   16384 Mar 24 10:45 lost+found
drwxr-xr-x   2 root root    4096 Jan  6  2025 media
drwxr-xr-x   5 root root    4096 Mar 24 10:45 mnt
drwxr-xr-x   2 root root    4096 Jan  6  2025 opt
dr-xr-xr-x 276 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 08:50 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# cd home/
root@LAPTOP-66HI94H2:/home# cd .
root@LAPTOP-66HI94H2:/home# pwd
/home
root@LAPTOP-66HI94H2:/home# cd ..
root@LAPTOP-66HI94H2:/# pwd
/
root@LAPTOP-66HI94H2:/# cd /home
root@LAPTOP-66HI94H2:/home# cd /var/tmp
root@LAPTOP-66HI94H2:/var/tmp# pwd
/var/tmp
root@LAPTOP-66HI94H2:/var/tmp# echo $OLDPWD
/home
root@LAPTOP-66HI94H2:/var/tmp# cd -
/home
root@LAPTOP-66HI94H2:/home# echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/ngrok:/mnt/c/ProgramData/chocolatey/bin:/mnt/c/Program Files/Java/jdk-24/bin:/mnt/c/Users/IviweMakinana/AppData/Local/Programs/Python/Python313/:/mnt/c/Users/IviweMakinana/AppData/Local/Programs/Python/Python313/Scripts/:/mnt/c/Program Files/Git/cmd:/mnt/c/Users/Rushil Jivan/anaconda3:/mnt/c/Users/Rushil Jivan/anaconda3/Library/mingw-w64/bin:/mnt/c/Users/Rushil Jivan/anaconda3/Library/usr/bin:/mnt/c/Users/Rushil Jivan/anaconda3/Library/bin:/mnt/c/Users/Rushil Jivan/anaconda3/Scripts:/mnt/c/Users/Rushil Jivan/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/Rushil Jivan/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/Rushil Jivan/AppData/Local/GitHubDesktop/bin:/snap/bin
root@LAPTOP-66HI94H2:/home# which cat
/usr/bin/cat
root@LAPTOP-66HI94H2:/home# cat test
cat: test: No such file or directory
root@LAPTOP-66HI94H2:/home# cat test.txt
cat: test.txt: No such file or directory
root@LAPTOP-66HI94H2:/home# cat sales.data
cat: sales.data: No such file or directory
root@LAPTOP-66HI94H2:/home# cd usr/bin.cat
-bash: cd: usr/bin.cat: No such file or directory
root@LAPTOP-66HI94H2:/home# cd usr/bin/cat
-bash: cd: usr/bin/cat: No such file or directory
root@LAPTOP-66HI94H2:/home# cd /usr/bin/cat
-bash: cd: /usr/bin/cat: Not a directory
root@LAPTOP-66HI94H2:/home# cd/usr
-bash: cd/usr: No such file or directory
root@LAPTOP-66HI94H2:/home# cd
root@LAPTOP-66HI94H2:~# cd /usr/bin/cat
-bash: cd: /usr/bin/cat: Not a directory
root@LAPTOP-66HI94H2:~# cd ..
root@LAPTOP-66HI94H2:/# cd /usr/bin/cat
-bash: cd: /usr/bin/cat: Not a directory
root@LAPTOP-66HI94H2:/# ls -l
total 2816
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x  87 root root    4096 Mar 25 10:23 etc
drwxr-xr-x   3 root root    4096 Mar 25 09:45 home
-rwxr-xr-x   1 root root 2781568 Dec 12 03:58 init
lrwxrwxrwx   1 root root       7 Apr 22  2024 lib -> usr/lib
drwxr-xr-x   2 root root    4096 Apr  8  2024 lib.usr-is-merged
lrwxrwxrwx   1 root root       9 Apr 22  2024 lib64 -> usr/lib64
drwx------   2 root root   16384 Mar 24 10:45 lost+found
drwxr-xr-x   2 root root    4096 Jan  6  2025 media
drwxr-xr-x   5 root root    4096 Mar 24 10:45 mnt
drwxr-xr-x   2 root root    4096 Jan  6  2025 opt
dr-xr-xr-x 276 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 08:50 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# cd usr
root@LAPTOP-66HI94H2:/usr# cd bin
root@LAPTOP-66HI94H2:/usr/bin# cd cat
-bash: cd: cat: Not a directory
root@LAPTOP-66HI94H2:/usr/bin# ls -l
total 97424
lrwxrwxrwx 1 root root           4 Feb 10  2024  NF -> col1
lrwxrwxrwx 1 root root           1 Apr  8  2024  X11 -> .
-rwxr-xr-x 1 root root       55744 Apr  5  2024 '['
-rwxr-xr-x 1 root root       18744 Jul 18  2024  aa-enabled
-rwxr-xr-x 1 root root       18744 Jul 18  2024  aa-exec
-rwxr-xr-x 1 root root       18736 Jul 18  2024  aa-features-abi
-rwxr-xr-x 1 root root       16422 Aug 15  2024  add-apt-repository
-rwxr-xr-x 1 root root       14720 Aug  9  2024  addpart
lrwxrwxrwx 1 root root          26 Aug  7  2024  addr2line -> x86_64-linux-gnu-addr2line
-rwxr-xr-x 1 root root        2322 Apr 18  2024  apport-bug
-rwxr-xr-x 1 root root       13625 Oct 26  2024  apport-cli
lrwxrwxrwx 1 root root          10 Oct 26  2024  apport-collect -> apport-bug
-rwxr-xr-x 1 root root        3790 Oct 26  2024  apport-unpack
-rwxr-xr-x 1 root root      141544 Apr  8  2024  appstreamcli
lrwxrwxrwx 1 root root           6 Apr  8  2024  apropos -> whatis
-rwxr-xr-x 1 root root       18824 Mar 31  2024  apt
lrwxrwxrwx 1 root root          18 Aug 15  2024  apt-add-repository -> add-apt-repository
-rwxr-xr-x 1 root root       88544 Mar 31  2024  apt-cache
-rwxr-xr-x 1 root root       27104 Mar 31  2024  apt-cdrom
-rwxr-xr-x 1 root root       31120 Mar 31  2024  apt-config
-rwxr-xr-x 1 root root       23008 Mar 31  2024  apt-extracttemplates
-rwxr-xr-x 1 root root      227816 Mar 31  2024  apt-ftparchive
-rwxr-xr-x 1 root root       51680 Mar 31  2024  apt-get
-rwxr-xr-x 1 root root       28664 Mar 31  2024  apt-key
-rwxr-xr-x 1 root root       55776 Mar 31  2024  apt-mark
-rwxr-xr-x 1 root root       51608 Mar 31  2024  apt-sortpkgs
lrwxrwxrwx 1 root root          19 Aug  7  2024  ar -> x86_64-linux-gnu-ar
-rwxr-xr-x 1 root root       35336 Apr  5  2024  arch
lrwxrwxrwx 1 root root          19 Aug  7  2024  as -> x86_64-linux-gnu-as
-rwxr-xr-x 1 root root         984 Jan  2  2024  automat-visualize3
lrwxrwxrwx 1 root root          21 Apr  8  2024  awk -> /etc/alternatives/awk
-rwxr-xr-x 1 root root       55816 Apr  5  2024  b2sum
-rwxr-xr-x 1 root root       39432 Apr  5  2024  base32
-rwxr-xr-x 1 root root       39432 Apr  5  2024  base64
-rwxr-xr-x 1 root root       35336 Apr  5  2024  basename
-rwxr-xr-x 1 root root       47624 Apr  5  2024  basenc
-rwxr-xr-x 1 root root     1446024 Mar 31  2024  bash
-rwxr-xr-x 1 root root        6988 Mar 31  2024  bashbug
-rwxr-xr-x 1 root root       93000 Apr  8  2024  bc
-rwxr-xr-x 1 root root      125240 Aug 28  2024  broadwayd
-rwxr-xr-x 1 root root       96864 Aug  8  2024  busctl
-rwxr-xr-x 1 root root        8703 Feb 10  2024  byobu
-rwxr-xr-x 1 root root         996 Feb 10  2024  byobu-config
-rwxr-xr-x 1 root root        4774 Feb 10  2024  byobu-ctrl-a
-rwxr-xr-x 1 root root        1295 Feb 10  2024  byobu-disable
-rwxr-xr-x 1 root root        1341 Feb 10  2024  byobu-disable-prompt
-rwxr-xr-x 1 root root        1182 Feb 10  2024  byobu-enable
-rwxr-xr-x 1 root root        1453 Feb 10  2024  byobu-enable-prompt
-rwxr-xr-x 1 root root        1421 Feb 10  2024  byobu-export
-rwxr-xr-x 1 root root        7209 Feb 10  2024  byobu-janitor
-rwxr-xr-x 1 root root        1506 Feb 10  2024  byobu-keybindings
-rwxr-xr-x 1 root root        3329 Feb 10  2024  byobu-launch
-rwxr-xr-x 1 root root        1910 Feb 10  2024  byobu-launcher
-rwxr-xr-x 1 root root        2529 Feb 10  2024  byobu-launcher-install
-rwxr-xr-x 1 root root        1561 Feb 10  2024  byobu-launcher-uninstall
-rwxr-xr-x 1 root root        3348 Feb 10  2024  byobu-layout
-rwxr-xr-x 1 root root        1156 Feb 10  2024  byobu-prompt
-rwxr-xr-x 1 root root        1410 Feb 10  2024  byobu-quiet
-rwxr-xr-x 1 root root        3298 Feb 10  2024  byobu-reconnect-sockets
lrwxrwxrwx 1 root root           5 Feb 10  2024  byobu-screen -> byobu
-rwxr-xr-x 1 root root        1452 Feb 10  2024  byobu-select-backend
-rwxr-xr-x 1 root root        5180 Feb 10  2024  byobu-select-profile
-rwxr-xr-x 1 root root        1012 Feb 10  2024  byobu-select-session
-rwxr-xr-x 1 root root        1697 Feb 10  2024  byobu-shell
-rwxr-xr-x 1 root root        1306 Feb 10  2024  byobu-silent
-rwxr-xr-x 1 root root        6015 Feb 10  2024  byobu-status
-rwxr-xr-x 1 root root        1207 Feb 10  2024  byobu-status-detail
lrwxrwxrwx 1 root root           5 Feb 10  2024  byobu-tmux -> byobu
-rwxr-xr-x 1 root root        4667 Feb 10  2024  byobu-ugraph
-rwxr-xr-x 1 root root       11996 Feb 10  2024  byobu-ulevel
lrwxrwxrwx 1 root root          24 Aug  7  2024  c++filt -> x86_64-linux-gnu-c++filt
-rwxr-xr-x 1 root root        6841 Aug 20  2024  c_rehash
lrwxrwxrwx 1 root root           3 Apr  8  2024  captoinfo -> tic
-rwxr-xr-x 1 root root       39384 Apr  5  2024  cat
-rwxr-xr-x 1 root root       31504 Apr  8  2024  catman
-rwxr-xr-x 1 root root         224 Aug 27  2024  cftp3
-rwxr-sr-x 1 root shadow     72184 May 30  2024  chage
lrwxrwxrwx 1 root root          10 Aug 20  2023  chardet -> chardetect
-rwxr-xr-x 1 root root         221 Aug 20  2023  chardetect
-rwxr-xr-x 1 root root       14656 Apr 29  2024  chattr
-rwxr-xr-x 1 root root       59912 Apr  5  2024  chcon
-rwsr-xr-x 1 root root       72792 May 30  2024  chfn
-rwxr-xr-x 1 root root       59912 Apr  5  2024  chgrp
-rwxr-xr-x 1 root root       55816 Apr  5  2024  chmod
-rwxr-xr-x 1 root root       22912 Aug  9  2024  choom
-rwxr-xr-x 1 root root       59912 Apr  5  2024  chown
-rwxr-xr-x 1 root root       31104 Aug  9  2024  chrt
-rwsr-xr-x 1 root root       44760 May 30  2024  chsh
-rwxr-xr-x 1 root root       14712 Mar 31  2024  chvt
-rwxr-xr-x 1 root root      150674 Feb 26  2024  ckbcomp
-rwxr-xr-x 1 root root         227 Aug 27  2024  ckeygen3
-rwxr-xr-x 1 root root      104984 Apr  5  2024  cksum
-rwxr-xr-x 1 root root       14656 Apr  8  2024  clear
-rwxr-xr-x 1 root root       14568 Mar 31  2024  clear_console
-rwxr-xr-x 1 root root         966 Dec  2  2024  cloud-id
-rwxr-xr-x 1 root root         970 Dec  2  2024  cloud-init
-rwxr-xr-x 1 root root        2108 Nov 25  2024  cloud-init-per
-rwxr-xr-x 1 root root       43408 Apr  8  2024  cmp
-rwxr-xr-x 1 root root       14640 Mar 31  2024  codepage
-rwxr-xr-x 1 root root       22920 Aug  9  2024  col
-rwxr-xr-x 1 root root         963 Feb 10  2024  col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col2 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col3 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col4 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col5 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col6 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col7 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col8 -> col1
lrwxrwxrwx 1 root root           4 Feb 10  2024  col9 -> col1
-rwxr-xr-x 1 root root       14728 Aug  9  2024  colcrt
-rwxr-xr-x 1 root root       14728 Aug  9  2024  colrm
-rwxr-xr-x 1 root root       39304 Aug  9  2024  column
-rwxr-xr-x 1 root root       39440 Apr  5  2024  comm
-rwxr-xr-x 1 root root         225 Aug 27  2024  conch3
-rwxr-xr-x 1 root root       15375 Apr  5  2024  corelist
-rwxr-xr-x 1 root root      141848 Apr  5  2024  cp
-rwxr-xr-x 1 root root        8360 Apr  5  2024  cpan
-rwxr-xr-x 1 root root        8381 Apr  5  2024  cpan5.38-x86_64-linux-gnu
-rwxr-sr-x 1 root crontab    39664 Mar 31  2024  crontab
-rwxr-xr-x 1 root root       51720 Apr  5  2024  csplit
-rwxr-xr-x 1 root root         960 Feb 10  2024  ctail
lrwxrwxrwx 1 root root           6 Mar 31  2024  ctstat -> lnstat
-rwxr-xr-x 1 root root      297288 Dec 11  2024  curl
-rwxr-xr-x 1 root root       39432 Apr  5  2024  cut
-rwxr-xr-x 1 root root      328832 Apr  8  2024  cvtsudoers
-rwxr-xr-x 1 root root      129784 Mar 31  2024  dash
-rwxr-xr-x 1 root root      109064 Apr  5  2024  date
-rwxr-xr-x 1 root root       14632 Aug  9  2024  dbus-cleanup-sockets
-rwxr-xr-x 1 root root      236176 Aug  9  2024  dbus-daemon
-rwxr-xr-x 1 root root       30864 Aug  9  2024  dbus-launch
-rwxr-xr-x 1 root root       26928 Aug  9  2024  dbus-monitor
-rwxr-xr-x 1 root root       14640 Aug  9  2024  dbus-run-session
-rwxr-xr-x 1 root root       31016 Aug  9  2024  dbus-send
-rwxr-xr-x 1 root root       14632 Aug  9  2024  dbus-update-activation-environment
-rwxr-xr-x 1 root root       14632 Aug  9  2024  dbus-uuidgen
-rwxr-xr-x 1 root root       72232 Apr  5  2024  dd
-rwxr-xr-x 1 root root       14712 Mar 31  2024  deallocvt
-rwxr-xr-x 1 root root       24358 Dec  6  2023  deb-systemd-helper
-rwxr-xr-x 1 root root        7135 Dec  6  2023  deb-systemd-invoke
-rwxr-xr-x 1 root root        2870 Apr 12  2024  debconf
-rwxr-xr-x 1 root root       11846 Apr 12  2024  debconf-apt-progress
-rwxr-xr-x 1 root root         623 Apr 12  2024  debconf-communicate
-rwxr-xr-x 1 root root        1718 Apr 12  2024  debconf-copydb
-rwxr-xr-x 1 root root         668 Apr 12  2024  debconf-escape
-rwxr-xr-x 1 root root        3216 Apr 12  2024  debconf-set-selections
-rwxr-xr-x 1 root root        1825 Apr 12  2024  debconf-show
-rwxr-xr-x 1 root root       31696 Apr  8  2024  debian-distro-info
-rwxr-xr-x 1 root root       14720 Aug  9  2024  delpart
-rwxr-xr-x 1 root root       89168 Apr  5  2024  df
-rwxr-xr-x 1 root root        4527 Apr 17  2023  dh_bash-completion
-rwxr-xr-x 1 root root        9444 Dec 12  2023  dh_installxmlcatalogs
-rwxr-xr-x 1 root root      137776 Apr  8  2024  diff
-rwxr-xr-x 1 root root       59920 Apr  8  2024  diff3
-rwxr-xr-x 1 root root      142312 Apr  5  2024  dir
-rwxr-xr-x 1 root root       47632 Apr  5  2024  dircolors
-rwxr-xr-x 1 root root      485136 Apr  6  2024  dirmngr
-rwxr-xr-x 1 root root       56240 Apr  6  2024  dirmngr-client
-rwxr-xr-x 1 root root       35208 Apr  5  2024  dirname
lrwxrwxrwx 1 root root          18 Apr  8  2024  distro-info -> ubuntu-distro-info
-rwxr-xr-x 1 root root       70288 Aug  9  2024  dmesg
lrwxrwxrwx 1 root root           8 Apr  8  2024  dnsdomainname -> hostname
-rwxr-xr-x 1 root root       10675 Sep  5  2024  do-release-upgrade
lrwxrwxrwx 1 root root           8 Apr  8  2024  domainname -> hostname
-rwxr-xr-x 1 root root      318176 Jul 17  2024  dpkg
-rwxr-xr-x 1 root root      146000 Jul 17  2024  dpkg-deb
-rwxr-xr-x 1 root root      121416 Jul 17  2024  dpkg-divert
-rwxr-xr-x 1 root root       21205 Jul 17  2024  dpkg-maintscript-helper
-rwxr-xr-x 1 root root      137792 Jul 17  2024  dpkg-query
-rwxr-xr-x 1 root root        4185 Jul 17  2024  dpkg-realpath
-rwxr-xr-x 1 root root      100896 Jul 17  2024  dpkg-split
-rwxr-xr-x 1 root root       51592 Jul 17  2024  dpkg-statoverride
-rwxr-xr-x 1 root root       43552 Jul 17  2024  dpkg-trigger
-rwxr-xr-x 1 root root      100872 Apr  5  2024  du
-rwxr-xr-x 1 root root      166760 Mar 31  2024  dumpkeys
lrwxrwxrwx 1 root root          20 Aug  7  2024  dwp -> x86_64-linux-gnu-dwp
-rwxr-xr-x 1 root root        2806 Apr  8  2024  eatmydata
-rwxr-xr-x 1 root root        8583 Jun  3  2022  ec2metadata
-rwxr-xr-x 1 root root       35208 Apr  5  2024  echo
-rwxr-xr-x 1 root root       59960 Feb 17  2024  ed
lrwxrwxrwx 1 root root          24 Mar 31  2024  editor -> /etc/alternatives/editor
-rwxr-xr-x 1 root root          41 Apr  8  2024  egrep
-rwxr-xr-x 1 root root       43240 Aug  9  2024  eject
lrwxrwxrwx 1 root root          24 Aug  7  2024  elfedit -> x86_64-linux-gnu-elfedit
-rwxr-xr-x 1 root root       41947 Apr  5  2024  enc2xs
-rwxr-xr-x 1 root root        3069 Apr  5  2024  encguess
-rwxr-xr-x 1 root root       48072 Apr  5  2024  env
-rwxr-xr-x 1 root root       35200 Apr  8  2024  envsubst
-rwxr-xr-x 1 root root      192968 Mar 31  2024  eqn
lrwxrwxrwx 1 root root          20 Mar 31  2024  ex -> /etc/alternatives/ex
-rwxr-xr-x 1 root root       35360 Apr  5  2024  expand
-rwxr-sr-x 1 root shadow     27152 May 30  2024  expiry
-rwxr-xr-x 1 root root       43432 Apr  5  2024  expr
-rwxr-xr-x 1 root root       64008 Apr  5  2024  factor
-rwxr-xr-x 1 root root       23168 May 30  2024  faillog
-rwxr-xr-x 1 root root       27008 Aug  9  2024  fallocate
-rwxr-xr-x 1 root root       26936 Apr  5  2024  false
-rwxr-xr-x 1 root root       22912 Mar 31  2024  fc-cache
-rwxr-xr-x 1 root root       18816 Mar 31  2024  fc-cat
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-conflist
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-list
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-match
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-pattern
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-query
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-scan
-rwxr-xr-x 1 root root       14720 Mar 31  2024  fc-validate
-rwxr-xr-x 1 root root       14712 Mar 31  2024  fgconsole
-rwxr-xr-x 1 root root          41 Apr  8  2024  fgrep
-rwxr-xr-x 1 root root       31336 Mar 31  2024  file
-rwxr-xr-x 1 root root      204264 Apr  8  2024  find
-rwxr-xr-x 1 root root       69280 Aug  9  2024  findmnt
-rwxr-xr-x 1 root root       23024 Aug  9  2024  flock
-rwxr-xr-x 1 root root       39432 Apr  5  2024  fmt
-rwxr-xr-x 1 root root       35336 Apr  5  2024  fold
-rwxr-xr-x 1 root root       27008 Sep 26  2024  free
-rwxr-xr-x 1 root root       40288 Mar 31  2024  fuser
lrwxrwxrwx 1 root root          11 Apr  8  2024  fusermount -> fusermount3
-rwsr-xr-x 1 root root       39296 Apr  8  2024  fusermount3
-rwxr-xr-x 1 root root       22920 Nov 13  2024  gapplication
-rwxr-xr-x 1 root root      739840 Mar 31  2024  gawk
-rwxr-xr-x 1 root root        6900 Mar 31  2024  gawkbug
-rwxr-xr-x 1 root root       51592 Nov 13  2024  gdbus
-rwxr-xr-x 1 root root       14672 Jun  3  2024  gdk-pixbuf-csource
-rwxr-xr-x 1 root root       14656 Jun  3  2024  gdk-pixbuf-pixdata
-rwxr-xr-x 1 root root       18832 Jun  3  2024  gdk-pixbuf-thumbnailer
lrwxrwxrwx 1 root root           3 Mar 31  2024  geqn -> eqn
-rwxr-xr-x 1 root root       26992 Aug  8  2024  getconf
-rwxr-xr-x 1 root root       39648 Aug  8  2024  getent
-rwxr-xr-x 1 root root       14712 Mar 31  2024  getkeycodes
-rwxr-xr-x 1 root root       22912 Aug  9  2024  getopt
-rwxr-xr-x 1 root root       35200 Apr  8  2024  gettext
-rwxr-xr-x 1 root root        5188 Apr  8  2024  gettext.sh
lrwxrwxrwx 1 root root          12 Mar 31  2024  ginstall-info -> install-info
-rwxr-xr-x 1 root root      104856 Nov 13  2024  gio
lrwxrwxrwx 1 root root          49 Nov 13  2024  gio-querymodules -> ../lib/x86_64-linux-gnu/glib-2.0/gio-querymodules
-rwxr-xr-x 1 root root     4066200 May 20  2024  git
lrwxrwxrwx 1 root root           3 May 20  2024  git-receive-pack -> git
-rwxr-xr-x 1 root root      639808 May 20  2024  git-shell
lrwxrwxrwx 1 root root           3 May 20  2024  git-upload-archive -> git
lrwxrwxrwx 1 root root           3 May 20  2024  git-upload-pack -> git
lrwxrwxrwx 1 root root          53 Nov 13  2024  glib-compile-schemas -> ../lib/x86_64-linux-gnu/glib-2.0/glib-compile-schemas
lrwxrwxrwx 1 root root          21 Aug  7  2024  gold -> x86_64-linux-gnu-gold
lrwxrwxrwx 1 root root          27 Aug  7  2024  gp-archive -> x86_64-linux-gnu-gp-archive
lrwxrwxrwx 1 root root          31 Aug  7  2024  gp-collect-app -> x86_64-linux-gnu-gp-collect-app
lrwxrwxrwx 1 root root          32 Aug  7  2024  gp-display-html -> x86_64-linux-gnu-gp-display-html
lrwxrwxrwx 1 root root          31 Aug  7  2024  gp-display-src -> x86_64-linux-gnu-gp-display-src
lrwxrwxrwx 1 root root          32 Aug  7  2024  gp-display-text -> x86_64-linux-gnu-gp-display-text
-rwsr-xr-x 1 root root       76248 May 30  2024  gpasswd
-rwxr-xr-x 1 root root     1147800 Apr  6  2024  gpg
-rwxr-xr-x 1 root root      366096 Apr  6  2024  gpg-agent
-rwxr-xr-x 1 root root       89400 Apr  6  2024  gpg-connect-agent
-rwxr-xr-x 1 root root      142712 Apr  6  2024  gpg-wks-client
-rwxr-xr-x 1 root root      118128 Apr  6  2024  gpgconf
-rwxr-xr-x 1 root root       35200 Apr  6  2024  gpgparsemail
-rwxr-xr-x 1 root root      513400 Apr  6  2024  gpgsm
-rwxr-xr-x 1 root root       27256 Apr  6  2024  gpgsplit
-rwxr-xr-x 1 root root       69456 Apr  6  2024  gpgtar
-rwxr-xr-x 1 root root      310416 Apr  6  2024  gpgv
lrwxrwxrwx 1 root root           3 Mar 31  2024  gpic -> pic
lrwxrwxrwx 1 root root          22 Aug  7  2024  gprof -> x86_64-linux-gnu-gprof
lrwxrwxrwx 1 root root          24 Aug  7  2024  gprofng -> x86_64-linux-gnu-gprofng
-rwxr-xr-x 1 root root      186824 Apr  8  2024  grep
-rwxr-xr-x 1 root root       22840 Nov 13  2024  gresource
-rwxr-xr-x 1 root root       96776 Mar 31  2024  groff
-rwxr-xr-x 1 root root       19195 Mar 31  2024  grog
-rwxr-xr-x 1 root root      166456 Mar 31  2024  grops
-rwxr-xr-x 1 root root      121352 Mar 31  2024  grotty
-rwxr-xr-x 1 root root       35336 Apr  5  2024  groups
-rwxr-xr-x 1 root root       29895 Jun  3  2022  growpart
-rwxr-xr-x 1 root root       31032 Nov 13  2024  gsettings
lrwxrwxrwx 1 root root           3 Mar 31  2024  gtbl -> tbl
-rwxr-xr-x 1 root root       35568 Aug 28  2024  gtk-builder-tool
-rwxr-xr-x 1 root root       18856 Aug 28  2024  gtk-encode-symbolic-svg
-rwxr-xr-x 1 root root       18904 Aug 28  2024  gtk-launch
-rwxr-xr-x 1 root root       14648 Aug 28  2024  gtk-query-settings
-rwxr-xr-x 1 root root       39496 Aug 28  2024  gtk-update-icon-cache
-rwxr-xr-x 2 root root        2346 Apr  8  2024  gunzip
-rwxr-xr-x 1 root root        6447 Apr  8  2024  gzexe
-rwxr-xr-x 1 root root       93424 Apr  8  2024  gzip
-rwxr-xr-x 1 root root       29227 Apr  5  2024  h2ph
-rwxr-xr-x 1 root root       60934 Apr  5  2024  h2xs
-rwxr-xr-x 1 root root       47600 Aug  9  2024  hardlink
lrwxrwxrwx 1 root root           7 Aug  9  2024  hd -> hexdump
-rwxr-xr-x 1 root root       43528 Apr  5  2024  head
-rwxr-xr-x 1 root root        2514 Aug 27  2024  helpztags
-rwxr-xr-x 1 root root       47504 Aug  9  2024  hexdump
-rwxr-xr-x 1 root root       35336 Apr  5  2024  hostid
-rwxr-xr-x 1 root root       22760 Apr  8  2024  hostname
-rwxr-xr-x 1 root root       31184 Aug  8  2024  hostnamectl
-rwxr-xr-x 1 root root       11511 Sep 26  2024  hwe-support-status
lrwxrwxrwx 1 root root           7 Aug  9  2024  i386 -> setarch
-rwxr-xr-x 1 root root       68072 Aug  8  2024  iconv
-rwxr-xr-x 1 root root       39432 Apr  5  2024  id
-rwxr-xr-x 1 root root      247536 Mar 31  2024  info
lrwxrwxrwx 1 root root          29 Mar 31  2024  infobrowser -> /etc/alternatives/infobrowser
-rwxr-xr-x 1 root root       67968 Apr  8  2024  infocmp
lrwxrwxrwx 1 root root           3 Apr  8  2024  infotocap -> tic
-rwxr-xr-x 1 root root      145944 Apr  5  2024  install
-rwxr-xr-x 1 root root       48376 Mar 31  2024  install-info
-rwxr-xr-x 1 root root        4373 Apr  5  2024  instmodsh
-rwxr-xr-x 1 root root       18816 Aug  9  2024  ionice
-rwxr-xr-x 1 root root      772856 Mar 31  2024  ip
-rwxr-xr-x 1 root root       22984 Aug  9  2024  ipcmk
-rwxr-xr-x 1 root root       18816 Aug  9  2024  ipcrm
-rwxr-xr-x 1 root root       39296 Aug  9  2024  ipcs
-rwxr-xr-x 1 root root       14824 Mar 31  2024  ischroot
-rwxr-xr-x 1 root root       51760 Apr  5  2024  join
-rwxr-xr-x 1 root root       80800 Aug  8  2024  journalctl
-rwxr-xr-x 1 root root        1004 Aug 21  2023  json-patch-jsondiff
-rwxr-xr-x 1 root root        4992 Apr  5  2024  json_pp
lrwxrwxrwx 1 root root          26 Aug 21  2023  jsondiff -> /etc/alternatives/jsondiff
-rwxr-xr-x 1 root root        3859 Aug 21  2023  jsonpatch
-rwxr-xr-x 1 root root        1838 Jan 24  2020  jsonpointer
-rwxr-xr-x 1 root root         213 Aug 14  2023  jsonschema
-rwxr-xr-x 1 root root       15016 Mar 31  2024  kbd_mode
-rwxr-xr-x 1 root root       18808 Mar 31  2024  kbdinfo
-rwxr-xr-x 1 root root       64336 Apr  6  2024  kbxutil
lrwxrwxrwx 1 root root           7 Jul 29  2022  keep-one-running -> run-one
-rwxr-xr-x 1 root root       55984 Aug  8  2024  kernel-install
-rwxr-xr-x 1 root root       22912 Sep 26  2024  kill
-rwxr-xr-x 1 root root       32096 Mar 31  2024  killall
-rwxr-xr-x 1 root root      174328 Apr 18  2024  kmod
-rwxr-xr-x 1 root root         214 May 28  2024  landscape-broker
-rwxr-xr-x 1 root root         529 May 28  2024  landscape-client
-rwxr-xr-x 1 root root         330 May 28  2024  landscape-config
-rwxr-xr-x 1 root root         215 May 28  2024  landscape-manager
-rwxr-xr-x 1 root root         215 May 28  2024  landscape-monitor
-rwxr-xr-x 1 root root         253 May 28  2024  landscape-package-changer
-rwxr-xr-x 1 root root         254 May 28  2024  landscape-package-reporter
-rwxr-xr-x 1 root root         261 May 28  2024  landscape-release-upgrader
-rwxr-xr-x 1 root root         646 May 28  2024  landscape-sysinfo
-rwxr-xr-x 1 root root       35200 Aug  9  2024  last
lrwxrwxrwx 1 root root           4 Aug  9  2024  lastb -> last
-rwxr-xr-x 1 root root       28456 May 30  2024  lastlog
-rwxr-xr-x 1 root root        7784 Jan 27  2023  lcf
lrwxrwxrwx 1 root root          19 Aug  7  2024  ld -> x86_64-linux-gnu-ld
lrwxrwxrwx 1 root root          23 Aug  7  2024  ld.bfd -> x86_64-linux-gnu-ld.bfd
lrwxrwxrwx 1 root root          24 Aug  7  2024  ld.gold -> x86_64-linux-gnu-ld.gold
lrwxrwxrwx 1 root root          29 Aug  8  2024  ld.so -> ../lib64/ld-linux-x86-64.so.2
-rwxr-xr-x 1 root root        5382 Aug  8  2024  ldd
-rwxr-xr-x 1 root root      194952 Apr 28  2024  less
-rwxr-xr-x 1 root root       14656 Apr 28  2024  lessecho
lrwxrwxrwx 1 root root           8 Apr 28  2024  lessfile -> lesspipe
-rwxr-xr-x 1 root root       24272 Apr 28  2024  lesskey
-rwxr-xr-x 1 root root        9047 Feb 12  2023  lesspipe
-rwxr-xr-x 1 root root      101896 Apr  8  2024  lexgrog
-rwxr-xr-x 1 root root       15778 Apr  5  2024  libnetcfg
-rwxr-xr-x 1 root root       35336 Apr  5  2024  link
lrwxrwxrwx 1 root root           7 Aug  9  2024  linux32 -> setarch
lrwxrwxrwx 1 root root           7 Aug  9  2024  linux64 -> setarch
-rwxr-xr-x 1 root root       55816 Apr  5  2024  ln
-rwxr-xr-x 1 root root       23200 Mar 31  2024  lnstat
-rwxr-xr-x 1 root root      207768 Mar 31  2024  loadkeys
-rwxr-xr-x 1 root root       35288 Mar 31  2024  loadunimap
-rwxr-xr-x 1 root root       50824 Aug  8  2024  locale
-rwxr-xr-x 1 root root       14488 Aug 23  2024  locale-check
-rwxr-xr-x 1 root root       27080 Aug  8  2024  localectl
-rwxr-xr-x 1 root root      326752 Aug  8  2024  localedef
-rwxr-xr-x 1 root root       39904 Aug  9  2024  logger
-rwxr-xr-x 1 root root       53056 May 30  2024  login
-rwxr-xr-x 1 root root       68176 Aug  8  2024  loginctl
-rwxr-xr-x 1 root root       35336 Apr  5  2024  logname
-rwxr-xr-x 1 root root       18824 Aug  9  2024  look
-rwxr-xr-x 1 root root      142312 Apr  5  2024  ls
-rwxr-xr-x 1 root root       14656 Apr 29  2024  lsattr
-rwxr-xr-x 1 root root        2651 Jul  5  2023  lsb_release
-rwxr-xr-x 1 root root      149896 Aug  9  2024  lsblk
-rwxr-xr-x 1 root root      113032 Aug  9  2024  lscpu
-rwxr-xr-x 1 root root      980168 Mar 31  2024  lshw
-rwxr-xr-x 1 root root       51584 Aug  9  2024  lsipc
-rwxr-xr-x 1 root root       31504 Aug  9  2024  lslocks
-rwxr-xr-x 1 root root       51584 Aug  9  2024  lslogins
-rwxr-xr-x 1 root root       39296 Aug  9  2024  lsmem
lrwxrwxrwx 1 root root           4 Apr 18  2024  lsmod -> kmod
-rwxr-xr-x 1 root root       43400 Aug  9  2024  lsns
-rwxr-xr-x 1 root root      175784 Mar 31  2024  lsof
-rwxr-xr-x 1 root root        1081 Apr  4  2023  lspgpot
lrwxrwxrwx 1 root root          23 Aug  9  2024  lzcat -> /etc/alternatives/lzcat
lrwxrwxrwx 1 root root          23 Aug  9  2024  lzcmp -> /etc/alternatives/lzcmp
lrwxrwxrwx 1 root root          24 Aug  9  2024  lzdiff -> /etc/alternatives/lzdiff
lrwxrwxrwx 1 root root          25 Aug  9  2024  lzegrep -> /etc/alternatives/lzegrep
lrwxrwxrwx 1 root root          25 Aug  9  2024  lzfgrep -> /etc/alternatives/lzfgrep
lrwxrwxrwx 1 root root          24 Aug  9  2024  lzgrep -> /etc/alternatives/lzgrep
lrwxrwxrwx 1 root root          24 Aug  9  2024  lzless -> /etc/alternatives/lzless
lrwxrwxrwx 1 root root          22 Aug  9  2024  lzma -> /etc/alternatives/lzma
-rwxr-xr-x 1 root root       14720 Aug  9  2024  lzmainfo
lrwxrwxrwx 1 root root          24 Aug  9  2024  lzmore -> /etc/alternatives/lzmore
-rwxr-xr-x 1 root root         227 Aug 27  2024  mailmail3
-rwxr-xr-x 1 root root      128416 Apr  8  2024  man
-rwxr-xr-x 1 root root       36248 Apr  8  2024  man-recode
-rwxr-xr-x 1 root root      147120 Apr  8  2024  mandb
-rwxr-xr-x 1 root root        1942 Feb 10  2024  manifest
-rwxr-xr-x 1 root root       27424 Apr  8  2024  manpath
-rwxr-xr-x 1 root root       31192 Mar 31  2024  mapscrn
-rwxr-xr-x 1 root root         220 Jun 19  2023  markdown-it
-rwxr-xr-x 1 root root      170768 Apr  8  2024  mawk
-rwxr-xr-x 1 root root       27080 Aug  9  2024  mcookie
-rwxr-xr-x 1 root root       39336 Apr  5  2024  md5sum
lrwxrwxrwx 1 root root           6 Apr  5  2024  md5sum.textutils -> md5sum
-rwxr-xr-x 1 root root        5807 Jun  6  2024  mesa-overlay-control.py
-rwxr-xr-x 1 root root       14720 Aug  9  2024  mesg
-rwxr-xr-x 1 root root        3093 Mar  1  2024  migrate-pubring-from-classic-gpg
-rwxr-xr-x 1 root root       16163 Mar 31  2024  mk_modmap
-rwxr-xr-x 1 root root       76296 Apr  5  2024  mkdir
-rwxr-xr-x 1 root root       43528 Apr  5  2024  mkfifo
-rwxr-xr-x 1 root root       43528 Apr  5  2024  mknod
-rwxr-xr-x 1 root root      293832 Apr  8  2024  mksquashfs
-rwxr-xr-x 1 root root       35336 Apr  5  2024  mktemp
-rwxr-xr-x 1 root root       47496 Aug  9  2024  more
-rwsr-xr-x 1 root root       51584 Aug  9  2024  mount
-rwxr-xr-x 1 root root       18816 Aug  9  2024  mountpoint
-rwxr-xr-x 1 root root      137752 Apr  5  2024  mv
-rwxr-xr-x 1 root root       22912 Aug  9  2024  namei
-rwxr-xr-x 1 root root      279040 Oct 10  2024  nano
lrwxrwxrwx 1 root root          22 Apr  8  2024  nawk -> /etc/alternatives/nawk
lrwxrwxrwx 1 root root          20 Apr  8  2024  nc -> /etc/alternatives/nc
-rwxr-xr-x 1 root root       39560 Apr  8  2024  nc.openbsd
-rwxr-xr-x 1 root root         913 Mar 31  2024  neqn
lrwxrwxrwx 1 root root          24 Apr  8  2024  netcat -> /etc/alternatives/netcat
-rwxr-xr-x 1 root root      125520 Aug  8  2024  networkctl
-rwxr-xr-x 1 root root       20362 Apr 24  2023  networkd-dispatcher
-rwsr-xr-x 1 root root       40664 May 30  2024  newgrp
-rwxr-xr-x 1 root root       35200 Apr  8  2024  ngettext
-rwxr-xr-x 1 root root       35336 Apr  5  2024  nice
lrwxrwxrwx 1 root root           8 Apr  8  2024  nisdomainname -> hostname
-rwxr-xr-x 1 root root       39528 Apr  5  2024  nl
lrwxrwxrwx 1 root root          19 Aug  7  2024  nm -> x86_64-linux-gnu-nm
-rwxr-xr-x 1 root root       35240 Apr  5  2024  nohup
-rwxr-xr-x 1 root root       35336 Apr  5  2024  nproc
-rwxr-xr-x 1 root root        5718 Mar 31  2024  nroff
-rwxr-xr-x 1 root root       31336 Aug  9  2024  nsenter
-rwxr-xr-x 1 root root       31104 Mar 31  2024  nstat
-rwxr-xr-x 1 root root       59944 Apr  5  2024  numfmt
lrwxrwxrwx 1 root root          24 Aug  7  2024  objcopy -> x86_64-linux-gnu-objcopy
lrwxrwxrwx 1 root root          24 Aug  7  2024  objdump -> x86_64-linux-gnu-objdump
-rwxr-xr-x 1 root root       72200 Apr  5  2024  od
-rwxr-xr-x 1 root root        8504 Oct 26  2024  oem-getlogs
-rwxr-xr-x 1 root root     1005368 Aug 20  2024  openssl
-rwxr-xr-x 1 root root       23272 Mar 31  2024  openvt
lrwxrwxrwx 1 root root          23 Apr  9  2024  pager -> /etc/alternatives/pager
-rwxr-xr-x 1 root root       63880 Aug  9  2024  partx
-rwsr-xr-x 1 root root       64152 May 30  2024  passwd
-rwxr-xr-x 1 root root       39336 Apr  5  2024  paste
-rwxr-xr-x 1 root root       16706 Nov 14  2022  pastebinit
-rwxr-xr-x 1 root root      186896 Apr  8  2024  patch
-rwxr-xr-x 1 root root       35336 Apr  5  2024  pathchk
lrwxrwxrwx 1 root root           5 Nov 14  2022  pbget -> pbput
-rwxr-xr-x 1 root root        2569 Nov 14  2022  pbput
lrwxrwxrwx 1 root root           5 Nov 14  2022  pbputs -> pbput
lrwxrwxrwx 1 root root           7 Aug  7  2024  pdb3 -> pdb3.12
lrwxrwxrwx 1 root root          24 Nov  6  2024  pdb3.12 -> ../lib/python3.12/pdb.py
-rwxr-xr-x 1 root root       14640 Mar 31  2024  peekfd
-rwxr-xr-x 2 root root     4019312 Apr  5  2024  perl
-rwxr-xr-x 1 root root       14648 Apr  5  2024  perl5.38-x86_64-linux-gnu
-rwxr-xr-x 2 root root     4019312 Apr  5  2024  perl5.38.2
-rwxr-xr-x 2 root root       45593 Apr  5  2024  perlbug
-rwxr-xr-x 1 root root         125 Apr  5  2024  perldoc
-rwxr-xr-x 1 root root       10867 Apr  5  2024  perlivp
-rwxr-xr-x 2 root root       45593 Apr  5  2024  perlthanks
-rwxr-xr-x 1 root root       35296 Sep 26  2024  pgrep
-rwxr-xr-x 1 root root      200768 Mar 31  2024  pic
lrwxrwxrwx 1 root root          22 Oct 10  2024  pico -> /etc/alternatives/pico
-rwxr-xr-x 1 root root        8360 Apr  5  2024  piconv
lrwxrwxrwx 1 root root          16 Apr  8  2024  pidof -> ../sbin/killall5
-rwxr-xr-x 1 root root       35296 Sep 26  2024  pidwait
lrwxrwxrwx 1 root root          26 Mar 31  2024  pinentry -> /etc/alternatives/pinentry
-rwxr-xr-x 1 root root       60056 Mar 31  2024  pinentry-curses
-rwxr-xr-x 1 root root       89768 Apr  8  2024  ping
lrwxrwxrwx 1 root root           4 Apr  8  2024  ping4 -> ping
lrwxrwxrwx 1 root root           4 Apr  8  2024  ping6 -> ping
-rwxr-xr-x 1 root root       39336 Apr  5  2024  pinky
-rwxr-xr-x 1 root root       18736 Apr  3  2024  pkaction
-rwxr-xr-x 1 root root       22832 Apr  3  2024  pkcheck
-rwxr-xr-x 1 root root       55608 Dec 13  2024  pkcon
lrwxrwxrwx 1 root root           5 Sep 26  2024  pkill -> pgrep
-rwxr-xr-x 1 root root       22840 Dec 13  2024  pkmon
-rwxr-xr-x 1 root root       22832 Apr  3  2024  pkttyagent
-rwxr-xr-x 1 root root        4536 Apr  5  2024  pl2pm
-rwxr-xr-x 1 root root       22976 Aug  8  2024  pldd
-rwxr-xr-x 1 root root       35224 Sep 26  2024  pmap
-rwxr-xr-x 1 root root        4041 Apr  5  2024  pod2html
-rwxr-xr-x 1 root root       18898 Apr  5  2024  pod2man
-rwxr-xr-x 1 root root       13112 Apr  5  2024  pod2text
-rwxr-xr-x 1 root root        4107 Apr  5  2024  pod2usage
-rwxr-xr-x 1 root root        3658 Apr  5  2024  podchecker
-rwxr-xr-x 1 root root       72272 Apr  5  2024  pr
-rwxr-xr-x 1 root root       59880 Mar 31  2024  preconv
-rwxr-xr-x 1 root root       35208 Apr  5  2024  printenv
-rwxr-xr-x 1 root root       55744 Apr  5  2024  printf
-rwxr-xr-x 1 root root       27536 Aug  9  2024  prlimit
lrwxrwxrwx 1 root root          16 Sep  7  2024  pro -> ubuntu-advantage
-rwxr-xr-x 1 root root       13659 Apr  5  2024  prove
-rwxr-xr-x 1 root root       18816 Mar 31  2024  prtstat
-rwxr-xr-x 1 root root      146424 Sep 26  2024  ps
lrwxrwxrwx 1 root root           9 Mar 31  2024  psfaddtable -> psfxtable
lrwxrwxrwx 1 root root           9 Mar 31  2024  psfgettable -> psfxtable
lrwxrwxrwx 1 root root           9 Mar 31  2024  psfstriptable -> psfxtable
-rwxr-xr-x 1 root root       22904 Mar 31  2024  psfxtable
-rwxr-xr-x 1 root root       14640 Mar 31  2024  pslog
-rwxr-xr-x 1 root root       36168 Mar 31  2024  pstree
lrwxrwxrwx 1 root root           6 Mar 31  2024  pstree.x11 -> pstree
-rwxr-xr-x 1 root root        3566 Apr  5  2024  ptar
-rwxr-xr-x 1 root root        2645 Apr  5  2024  ptardiff
-rwxr-xr-x 1 root root        4395 Apr  5  2024  ptargrep
-rwxr-xr-x 1 root root       55848 Apr  5  2024  ptx
-rwxr-xr-x 1 root root        1149 Feb 10  2024  purge-old-kernels
-rwxr-xr-x 1 root root       35336 Apr  5  2024  pwd
-rwxr-xr-x 1 root root       14720 Sep 26  2024  pwdx
-rwxr-xr-x 1 root root        7814 Aug  7  2024  py3clean
-rwxr-xr-x 1 root root       13312 Aug  7  2024  py3compile
lrwxrwxrwx 1 root root          31 Aug  7  2024  py3versions -> ../share/python3/py3versions.py
lrwxrwxrwx 1 root root          25 Nov 24  2023  pybabel -> /etc/alternatives/pybabel
-rwxr-xr-x 1 root root         956 Nov 24  2023  pybabel-python3
lrwxrwxrwx 1 root root           9 Aug  7  2024  pydoc3 -> pydoc3.12
-rwxr-xr-x 1 root root          80 Nov  6  2024  pydoc3.12
lrwxrwxrwx 1 root root          13 Aug  7  2024  pygettext3 -> pygettext3.12
-rwxr-xr-x 1 root root       24224 Nov  6  2024  pygettext3.12
-rwxr-xr-x 1 root root         215 Feb  2  2024  pygmentize
-rwxr-xr-x 1 root root         222 Aug 27  2024  pyhtmlizer3
-rwxr-xr-x 1 root root         975 Nov 24  2023  pyserial-miniterm
-rwxr-xr-x 1 root root         969 Nov 24  2023  pyserial-ports
lrwxrwxrwx 1 root root          10 Aug  7  2024  python3 -> python3.12
-rwxr-xr-x 1 root root     8019136 Nov  6  2024  python3.12
lrwxrwxrwx 1 root root          23 Aug  7  2024  ranlib -> x86_64-linux-gnu-ranlib
lrwxrwxrwx 1 root root           4 Mar 31  2024  rbash -> bash
-rwxr-xr-x 1 root root      104976 Mar 31  2024  rdma
lrwxrwxrwx 1 root root          24 Aug  7  2024  readelf -> x86_64-linux-gnu-readelf
-rwxr-xr-x 1 root root       43432 Apr  5  2024  readlink
-rwxr-xr-x 1 root root       43432 Apr  5  2024  realpath
-rwxr-xr-x 1 root root          89 Feb 17  2024  red
-rwxr-xr-x 1 root root       22912 Aug  9  2024  rename.ul
-rwxr-xr-x 1 root root       14720 Aug  9  2024  renice
lrwxrwxrwx 1 root root           4 Apr  8  2024  reset -> tset
-rwxr-xr-x 1 root root       27096 Mar 31  2024  resizecons
-rwxr-xr-x 1 root root       22912 Aug  9  2024  resizepart
-rwxr-xr-x 1 root root      162480 Aug  8  2024  resolvectl
-rwxr-xr-x 1 root root       14720 Aug  9  2024  rev
-rwxr-xr-x 1 root root          30 Jul 21  2023  rgrep
-rwxr-xr-x 1 root root       59912 Apr  5  2024  rm
-rwxr-xr-x 1 root root       47528 Apr  5  2024  rmdir
lrwxrwxrwx 1 root root           4 Oct 10  2024  rnano -> nano
-rwxr-xr-x 1 root root        1658 Mar 31  2024  routel
-rwxr-xr-x 1 root root       12639 Apr 12  2024  rrsync
-rwxr-xr-x 1 root root      514176 Apr 12  2024  rsync
-rwxr-xr-x 1 root root        5136 Apr 12  2024  rsync-ssl
lrwxrwxrwx 1 root root           6 Mar 31  2024  rtstat -> lnstat
-rwxr-xr-x 1 root root        3592 Jul 29  2022  run-one
lrwxrwxrwx 1 root root           7 Jul 29  2022  run-one-constantly -> run-one
lrwxrwxrwx 1 root root           7 Jul 29  2022  run-one-until-failure -> run-one
lrwxrwxrwx 1 root root           7 Jul 29  2022  run-one-until-success -> run-one
-rwxr-xr-x 1 root root       27464 Mar 31  2024  run-parts
lrwxrwxrwx 1 root root           7 Jul 29  2022  run-this-one -> run-one
-rwxr-xr-x 1 root root       35336 Apr  5  2024  runcon
lrwxrwxrwx 1 root root          23 Mar 31  2024  rview -> /etc/alternatives/rview
lrwxrwxrwx 1 root root          22 Nov  6  2024  rvim -> /etc/alternatives/rvim
-rwxr-xr-x 1 root root       10487 Mar 31  2024  savelog
-rwxr-xr-x 1 root root      684992 May 20  2024  scalar
-rwxr-xr-x 1 root root      137816 Aug  9  2024  scp
-rwxr-xr-x 1 root root       14640 Mar 31  2024  screendump
-rwxr-xr-x 1 root root       55680 Aug  9  2024  script
-rwxr-xr-x 1 root root       43392 Aug  9  2024  scriptlive
-rwxr-xr-x 1 root root       35200 Aug  9  2024  scriptreplay
-rwxr-xr-x 1 root root       51600 Apr  8  2024  sdiff
-rwxr-xr-x 1 root root      113224 Apr  8  2024  sed
-rwxr-xr-x 1 root root        2450 Feb  4  2024  select-editor
-rwxr-xr-x 1 root root        1583 Feb  4  2024  sensible-browser
-rwxr-xr-x 1 root root        1556 Feb  4  2024  sensible-editor
-rwxr-xr-x 1 root root         921 Feb  4  2024  sensible-pager
-rwxr-xr-x 1 root root        1176 Feb  4  2024  sensible-terminal
-rwxr-xr-x 1 root root       51720 Apr  5  2024  seq
-rwxr-xr-x 1 root root       22680 Mar 31  2024  session-migration
-rwxr-xr-x 1 root root       27288 Aug  9  2024  setarch
-rwxr-xr-x 1 root root       55768 Mar 31  2024  setfont
-rwxr-xr-x 1 root root       14712 Mar 31  2024  setkeycodes
-rwxr-xr-x 1 root root       18872 Mar 31  2024  setleds
-rwxr-xr-x 1 root root       14712 Mar 31  2024  setlogcons
-rwxr-xr-x 1 root root       14752 Mar 31  2024  setmetamode
-rwxr-xr-x 1 root root       39304 Aug  9  2024  setpriv
-rwxr-xr-x 1 root root       14720 Aug  9  2024  setsid
-rwxr-xr-x 1 root root       35200 Aug  9  2024  setterm
-rwxr-xr-x 1 root root       41025 Feb 26  2024  setupcon
-rwxr-xr-x 1 root root      154280 Aug  9  2024  sftp
lrwxrwxrwx 1 root root           6 May 30  2024  sg -> newgrp
lrwxrwxrwx 1 root root           4 Mar 31  2024  sh -> dash
-rwxr-xr-x 1 root root       39336 Apr  5  2024  sha1sum
-rwxr-xr-x 1 root root       39336 Apr  5  2024  sha224sum
-rwxr-xr-x 1 root root       39336 Apr  5  2024  sha256sum
-rwxr-xr-x 1 root root       39336 Apr  5  2024  sha384sum
-rwxr-xr-x 1 root root       39336 Apr  5  2024  sha512sum
-rwxr-xr-x 1 root root        9982 Apr  5  2024  shasum
-rwxr-xr-x 1 root root       18808 Mar 31  2024  showconsolefont
-rwxr-xr-x 1 root root       18808 Mar 31  2024  showkey
-rwxr-xr-x 1 root root       55816 Apr  5  2024  shred
-rwxr-xr-x 1 root root       47624 Apr  5  2024  shuf
lrwxrwxrwx 1 root root          21 Aug  7  2024  size -> x86_64-linux-gnu-size
-rwxr-xr-x 1 root root       27048 Sep 26  2024  skill
-rwxr-xr-x 1 root root       22976 Sep 26  2024  slabtop
-rwxr-xr-x 1 root root       35336 Apr  5  2024  sleep
lrwxrwxrwx 1 root root           3 Aug  9  2024  slogin -> ssh
-rwxr-xr-x 1 root root    18653592 Oct 11  2024  snap
lrwxrwxrwx 1 root root          20 Oct 11  2024  snapctl -> ../lib/snapd/snapctl
-rwxr-xr-x 1 root root       39144 Oct 11  2024  snapfuse
lrwxrwxrwx 1 root root           5 Sep 26  2024  snice -> skill
-rwxr-xr-x 1 root root       35304 Mar 31  2024  soelim
-rwxr-xr-x 1 root root      105272 Apr  5  2024  sort
-rwxr-xr-x 1 root root       19449 Apr  5  2024  splain
-rwxr-xr-x 1 root root       56256 Apr  5  2024  split
-rwxr-xr-x 1 root root       14640 Mar 31  2024  splitfont
lrwxrwxrwx 1 root root          10 Apr  8  2024  sqfscat -> unsquashfs
lrwxrwxrwx 1 root root          10 Apr  8  2024  sqfstar -> mksquashfs
-rwxr-xr-x 1 root root      132168 Mar 31  2024  ss
-rwxr-xr-x 1 root root      846888 Aug  9  2024  ssh
-rwxr-xr-x 1 root root      301488 Aug  9  2024  ssh-add
-rwxr-sr-x 1 root _ssh      309688 Aug  9  2024  ssh-agent
-rwxr-xr-x 1 root root        1455 Apr  4  2024  ssh-argv0
-rwxr-xr-x 1 root root       13078 Dec 18  2023  ssh-copy-id
-rwxr-xr-x 1 root root      453056 Aug  9  2024  ssh-keygen
-rwxr-xr-x 1 root root      338368 Aug  9  2024  ssh-keyscan
-rwxr-xr-x 1 root root       88592 Apr  5  2024  stat
-rwxr-xr-x 1 root root       51720 Apr  5  2024  stdbuf
-rwxr-xr-x 1 root root        8061 Apr  5  2024  streamzip
lrwxrwxrwx 1 root root          24 Aug  7  2024  strings -> x86_64-linux-gnu-strings
lrwxrwxrwx 1 root root          22 Aug  7  2024  strip -> x86_64-linux-gnu-strip
-rwxr-xr-x 1 root root       80408 Apr  5  2024  stty
-rwsr-xr-x 1 root root       55680 Aug  9  2024  su
-rwsr-xr-x 1 root root      277936 Apr  8  2024  sudo
lrwxrwxrwx 1 root root           4 Apr  8  2024  sudoedit -> sudo
-rwxr-xr-x 1 root root       98256 Apr  8  2024  sudoreplay
-rwxr-xr-x 1 root root       35240 Apr  5  2024  sum
-rwxr-xr-x 1 root root       35240 Apr  5  2024  sync
-rwxr-xr-x 1 root root     1501304 Aug  8  2024  systemctl
lrwxrwxrwx 1 root root          22 Aug  8  2024  systemd -> ../lib/systemd/systemd
-rwxr-xr-x 1 root root       14792 Aug  8  2024  systemd-ac-power
-rwxr-xr-x 1 root root      203624 Aug  8  2024  systemd-analyze
-rwxr-xr-x 1 root root       19024 Aug  8  2024  systemd-ask-password
-rwxr-xr-x 1 root root       18896 Aug  8  2024  systemd-cat
-rwxr-xr-x 1 root root       23112 Aug  8  2024  systemd-cgls
-rwxr-xr-x 1 root root       39392 Aug  8  2024  systemd-cgtop
lrwxrwxrwx 1 root root          14 Aug  8  2024  systemd-confext -> systemd-sysext
-rwxr-xr-x 1 root root       43744 Aug  8  2024  systemd-creds
-rwxr-xr-x 1 root root       72624 Aug  8  2024  systemd-cryptenroll
-rwxr-xr-x 1 root root       80840 Aug  8  2024  systemd-cryptsetup
-rwxr-xr-x 1 root root       27080 Aug  8  2024  systemd-delta
-rwxr-xr-x 1 root root       18888 Aug  8  2024  systemd-detect-virt
-rwxr-xr-x 1 root root       22984 Aug  8  2024  systemd-escape
-rwxr-xr-x 1 root root       60232 Aug  8  2024  systemd-firstboot
-rwxr-xr-x 1 root root      158456 Aug  8  2024  systemd-hwdb
-rwxr-xr-x 1 root root       22984 Aug  8  2024  systemd-id128
-rwxr-xr-x 1 root root       23008 Aug  8  2024  systemd-inhibit
-rwxr-xr-x 1 root root       19072 Aug  8  2024  systemd-machine-id-setup
-rwxr-xr-x 1 root root       52000 Aug  8  2024  systemd-mount
-rwxr-xr-x 1 root root       27304 Aug  8  2024  systemd-notify
-rwxr-xr-x 1 root root       18888 Aug  8  2024  systemd-path
-rwxr-xr-x 1 root root      199912 Aug  8  2024  systemd-repart
-rwxr-xr-x 1 root root       68392 Aug  8  2024  systemd-run
-rwxr-xr-x 1 root root       31176 Aug  8  2024  systemd-socket-activate
-rwxr-xr-x 1 root root       22992 Aug  8  2024  systemd-stdio-bridge
-rwxr-xr-x 1 root root       55952 Aug  8  2024  systemd-sysext
-rwxr-xr-x 1 root root       68224 Aug  8  2024  systemd-sysusers
-rwxr-xr-x 1 root root      117448 Aug  8  2024  systemd-tmpfiles
-rwxr-xr-x 1 root root       35272 Aug  8  2024  systemd-tty-ask-password-agent
lrwxrwxrwx 1 root root          13 Aug  8  2024  systemd-umount -> systemd-mount
-rwxr-xr-x 1 root root       18744 Apr  8  2024  tabs
-rwxr-xr-x 1 root root       39336 Apr  5  2024  tac
-rwxr-xr-x 1 root root       64032 Apr  5  2024  tail
-rwxr-xr-x 1 root root      432048 Apr  8  2024  tar
-rwxr-xr-x 1 root root       31104 Aug  9  2024  taskset
-rwxr-xr-x 1 root root      137704 Mar 31  2024  tbl
-rwxr-xr-x 1 root root       39432 Apr  5  2024  tee
-rwxr-xr-x 1 root root       14648 Mar 31  2024  tempfile
-rwxr-xr-x 1 root root       47552 Apr  5  2024  test
-rwxr-xr-x 1 root root       92584 Apr  8  2024  tic
-rwxr-xr-x 1 root root       27160 Apr  8  2024  time
-rwxr-xr-x 1 root root       47560 Aug  8  2024  timedatectl
-rwxr-xr-x 1 root root       39880 Apr  5  2024  timeout
-rwxr-xr-x 1 root root         227 Aug 27  2024  tkconch3
-rwxr-xr-x 1 root root       22928 Sep 26  2024  tload
-rwxr-xr-x 1 root root     1102608 Jul 10  2024  tmux
-rwxr-xr-x 1 root root       22840 Apr  8  2024  toe
-rwxr-xr-x 1 root root      134864 Sep 26  2024  top
-rwxr-xr-x 1 root root       96776 Apr  5  2024  touch
-rwxr-xr-x 1 root root       26968 Apr  8  2024  tput
-rwxr-xr-x 1 root root       47624 Apr  5  2024  tr
-rwxr-xr-x 1 root root         219 Aug 27  2024  trial3
-rwxr-xr-x 1 root root      744056 Mar 31  2024  troff
-rwxr-xr-x 1 root root       26936 Apr  5  2024  true
-rwxr-xr-x 1 root root       39432 Apr  5  2024  truncate
-rwxr-xr-x 1 root root       26944 Apr  8  2024  tset
-rwxr-xr-x 1 root root       47624 Apr  5  2024  tsort
-rwxr-xr-x 1 root root       35336 Apr  5  2024  tty
-rwxr-xr-x 1 root root         239 Aug 27  2024  twist3
-rwxr-xr-x 1 root root         220 Aug 27  2024  twistd3
-rwxr-xr-x 1 root root       15378 Aug  8  2024  tzselect
lrwxrwxrwx 1 root root          16 Sep  7  2024  ua -> ubuntu-advantage
-rwxr-xr-x 1 root root        1003 Sep  7  2024  ubuntu-advantage
lrwxrwxrwx 1 root root          10 Oct 26  2024  ubuntu-bug -> apport-bug
-rwxr-xr-x 1 root root       27536 Apr  8  2024  ubuntu-distro-info
-rwxr-xr-x 1 root root       22783 Sep 26  2024  ubuntu-security-status
-rwxr-xr-x 1 root root       41657 Jan 27  2023  ucf
-rwxr-xr-x 1 root root       19367 Jan 27  2023  ucfq
-rwxr-xr-x 1 root root       11111 Jan 27  2023  ucfr
-rwxr-xr-x 1 root root       31104 Aug  9  2024  uclampset
-rwxr-xr-x 1 root root     1439536 Aug  8  2024  udevadm
-rwxr-xr-x 1 root root       22920 Aug  9  2024  ul
-rwsr-xr-x 1 root root       39296 Aug  9  2024  umount
-rwxr-xr-x 1 root root       35336 Apr  5  2024  uname
-rwxr-xr-x 1 root root       99547 Feb 12  2024  unattended-upgrade
lrwxrwxrwx 1 root root          18 Feb 12  2024  unattended-upgrades -> unattended-upgrade
-rwxr-xr-x 2 root root        2346 Apr  8  2024  uncompress
-rwxr-xr-x 1 root root       39456 Apr  5  2024  unexpand
-rwxr-xr-x 1 root root        2772 Mar 31  2024  unicode_start
-rwxr-xr-x 1 root root         528 Mar 31  2024  unicode_stop
-rwxr-xr-x 1 root root       39432 Apr  5  2024  uniq
-rwxr-xr-x 1 root root       35336 Apr  5  2024  unlink
lrwxrwxrwx 1 root root          24 Aug  9  2024  unlzma -> /etc/alternatives/unlzma
-rwxr-xr-x 1 root root       43624 Aug  9  2024  unshare
-rwxr-xr-x 1 root root      151448 Apr  8  2024  unsquashfs
lrwxrwxrwx 1 root root           2 Aug  9  2024  unxz -> xz
-rwxr-xr-x 1 root root       59784 Jul 17  2024  update-alternatives
-rwxr-xr-x 1 root root       76112 Apr  1  2024  update-mime-database
-rwxr-xr-x 1 root root       14720 Sep 26  2024  uptime
-rwxr-xr-x 1 root root       35336 Apr  5  2024  users
-rwxr-xr-x 1 root root       22912 Aug  9  2024  utmpdump
-rwxr-xr-x 1 root root       18816 Aug  9  2024  uuidgen
-rwxr-xr-x 1 root root       22912 Aug  9  2024  uuidparse
-rwxr-xr-x 1 root root       31176 Aug  8  2024  varlinkctl
-rwxr-xr-x 1 root root        6912 Jun  3  2022  vcs-run
-rwxr-xr-x 1 root root      142312 Apr  5  2024  vdir
lrwxrwxrwx 1 root root          20 Mar 31  2024  vi -> /etc/alternatives/vi
lrwxrwxrwx 1 root root          22 Mar 31  2024  view -> /etc/alternatives/view
-rwxr-xr-x 1 root root        2640 Feb 10  2024  vigpg
lrwxrwxrwx 1 root root          21 Nov  6  2024  vim -> /etc/alternatives/vim
-rwxr-xr-x 1 root root     4126400 Nov  6  2024  vim.basic
-rwxr-xr-x 1 root root     1736392 Nov  6  2024  vim.tiny
lrwxrwxrwx 1 root root          25 Nov  6  2024  vimdiff -> /etc/alternatives/vimdiff
-rwxr-xr-x 1 root root        2154 Nov  6  2024  vimtutor
-rwxr-xr-x 1 root root       39712 Sep 26  2024  vmstat
-rwxr-xr-x 1 root root       27008 Sep 26  2024  w
-rwxr-xr-x 1 root root       22912 Aug  9  2024  wall
-rwxr-xr-x 1 root root       31584 Sep 26  2024  watch
-rwxr-xr-x 1 root root       22840 Apr  6  2024  watchgnupg
-rwxr-xr-x 1 root root       55824 Apr  5  2024  wc
-rwxr-xr-x 1 root root       35224 Aug  9  2024  wdctl
-rwxr-xr-x 1 root root      470032 Jun 19  2024  wget
-rwxr-xr-x 1 root root       48416 Apr  8  2024  whatis
-rwxr-xr-x 1 root root       31576 Aug  9  2024  whereis
lrwxrwxrwx 1 root root          23 Mar 31  2024  which -> /etc/alternatives/which
-rwxr-xr-x 1 root root        1080 Mar 31  2024  which.debianutils
-rwxr-xr-x 1 root root       30888 Mar 31  2024  whiptail
-rwxr-xr-x 1 root root       59928 Apr  5  2024  who
-rwxr-xr-x 1 root root       35336 Apr  5  2024  whoami
-rwxr-xr-x 1 root root        2107 Feb 10  2024  wifi-status
-rwxr-xr-x 1 root root       22920 Aug  9  2024  write
lrwxrwxrwx 1 root root           5 Mar 24 10:45  wslinfo -> /init
lrwxrwxrwx 1 root root           5 Mar 24 10:45  wslpath -> /init
lrwxrwxrwx 1 root root           7 Aug  9  2024  x86_64 -> setarch
-rwxr-xr-x 1 root root       31440 Aug  7  2024  x86_64-linux-gnu-addr2line
-rwxr-xr-x 1 root root       55792 Aug  7  2024  x86_64-linux-gnu-ar
-rwxr-xr-x 1 root root      745768 Aug  7  2024  x86_64-linux-gnu-as
-rwxr-xr-x 1 root root       22800 Aug  7  2024  x86_64-linux-gnu-c++filt
-rwxr-xr-x 1 root root     1961344 Aug  7  2024  x86_64-linux-gnu-dwp
-rwxr-xr-x 1 root root       35552 Aug  7  2024  x86_64-linux-gnu-elfedit
lrwxrwxrwx 1 root root          24 Aug  7  2024  x86_64-linux-gnu-gold -> x86_64-linux-gnu-ld.gold
-rwxr-xr-x 1 root root      162336 Aug  7  2024  x86_64-linux-gnu-gp-archive
-rwxr-xr-x 1 root root      178552 Aug  7  2024  x86_64-linux-gnu-gp-collect-app
-rwxr-xr-x 1 root root      641937 Aug  7  2024  x86_64-linux-gnu-gp-display-html
-rwxr-xr-x 1 root root      153960 Aug  7  2024  x86_64-linux-gnu-gp-display-src
-rwxr-xr-x 1 root root      297336 Aug  7  2024  x86_64-linux-gnu-gp-display-text
-rwxr-xr-x 1 root root      102184 Aug  7  2024  x86_64-linux-gnu-gprof
-rwxr-xr-x 1 root root      141672 Aug  7  2024  x86_64-linux-gnu-gprofng
lrwxrwxrwx 1 root root          23 Aug  7  2024  x86_64-linux-gnu-ld -> x86_64-linux-gnu-ld.bfd
-rwxr-xr-x 1 root root     1359128 Aug  7  2024  x86_64-linux-gnu-ld.bfd
-rwxr-xr-x 1 root root     3218592 Aug  7  2024  x86_64-linux-gnu-ld.gold
-rwxr-xr-x 1 root root       44544 Aug  7  2024  x86_64-linux-gnu-nm
-rwxr-xr-x 1 root root      166536 Aug  7  2024  x86_64-linux-gnu-objcopy
-rwxr-xr-x 1 root root      390848 Aug  7  2024  x86_64-linux-gnu-objdump
-rwxr-xr-x 1 root root       55792 Aug  7  2024  x86_64-linux-gnu-ranlib
-rwxr-xr-x 1 root root      789280 Aug  7  2024  x86_64-linux-gnu-readelf
-rwxr-xr-x 1 root root       31184 Aug  7  2024  x86_64-linux-gnu-size
-rwxr-xr-x 1 root root       35440 Aug  7  2024  x86_64-linux-gnu-strings
-rwxr-xr-x 1 root root      166568 Aug  7  2024  x86_64-linux-gnu-strip
-rwxr-xr-x 1 root root       63912 Apr  8  2024  xargs
-rwxr-xr-x 1 root root       56280 Apr  8  2024  xauth
-rwxr-xr-x 1 root root         234 Apr  8  2024  xdg-user-dir
-rwxr-xr-x 1 root root       26856 Apr  8  2024  xdg-user-dirs-update
-rwxr-xr-x 1 root root        5167 Apr  5  2024  xsubpp
-rwxr-xr-x 1 root root       22816 Nov  6  2024  xxd
-rwxr-xr-x 1 root root       89008 Aug  9  2024  xz
lrwxrwxrwx 1 root root           2 Aug  9  2024  xzcat -> xz
lrwxrwxrwx 1 root root           6 Aug  9  2024  xzcmp -> xzdiff
-rwxr-xr-x 1 root root        7422 Aug  9  2024  xzdiff
lrwxrwxrwx 1 root root           6 Aug  9  2024  xzegrep -> xzgrep
lrwxrwxrwx 1 root root           6 Aug  9  2024  xzfgrep -> xzgrep
-rwxr-xr-x 1 root root       10333 Aug  9  2024  xzgrep
-rwxr-xr-x 1 root root        1813 Aug  9  2024  xzless
-rwxr-xr-x 1 root root        2190 Aug  9  2024  xzmore
-rwxr-xr-x 1 root root       35208 Apr  5  2024  yes
lrwxrwxrwx 1 root root           8 Apr  8  2024  ypdomainname -> hostname
-rwxr-xr-x 1 root root        1984 Apr  8  2024  zcat
-rwxr-xr-x 1 root root        1678 Apr  8  2024  zcmp
-rwxr-xr-x 1 root root        6460 Apr  8  2024  zdiff
-rwxr-xr-x 1 root root       31008 Aug  8  2024  zdump
-rwxr-xr-x 1 root root          29 Apr  8  2024  zegrep
-rwxr-xr-x 1 root root          29 Apr  8  2024  zfgrep
-rwxr-xr-x 1 root root        2081 Apr  8  2024  zforce
-rwxr-xr-x 1 root root        8103 Apr  8  2024  zgrep
-rwxr-xr-x 1 root root       70193 Apr  5  2024  zipdetails
-rwxr-xr-x 1 root root        2206 Apr  8  2024  zless
-rwxr-xr-x 1 root root        1842 Apr  8  2024  zmore
-rwxr-xr-x 1 root root        4577 Apr  8  2024  znew
root@LAPTOP-66HI94H2:/usr/bin# cat cat
@@@@�@@   �D�Dppp�������0����8880hhhDDS�td8880P�td�}�}�}��Q�tdR�td������pp/lib64/ld-linux-x86-64.so.2 GNU���GNUICD�X
�ArH���y�����V�C%�<i�H ��w���]�\|� �"ex�" 3GU�L.�"__libc_start_main__cxa_finalize__cxa_atexit__errno_locationstdoutfflush_unlocked__fpurgeclearerr_unlockeddcgettexterrornl_langinforeadabortfileno__freadingfflushfcloselseekfseeko__fpending__fprintf_chkfputc_unlocked__stack_chk_failsetlocalestrlenstrcmp__ctype_get_mb_cur_max__ctype_b_locmemcmpmbrtoc32iswprintmbsinitrealloc__memset_chkfreemalloc_exitstderrstrrchrstrncmpprogram_invocation_name__progname_fullbindtextdomaingetopt_longprogram_invocation_short_name__prognamefstatoptindgetpagesizeopenposix_fadvisealigned_allocstpcpy__memmove_chkioctl__printf_chkfputs_unlockedfwritecopy_file_rangeunamelibc.so.6GLIBC_2.3GLIBC_2.33GLIBC_2.3.4GLIBC_2.16GLIBC_2.27GLIBC_2.4GLr�r$r2r Cr@Mr`Wr�`r�er�H��P@�X,�`1��������ȟ&П'؟:�>�C�B�����__ITM�registerTMCloneTable  �ii
 �
  (�
8�@�H�P�X�`�h�p�x�������␦����������� Ȟ!О"؞#�$�%�(��)��+�,�- �.(�/0�08�2@�3H�4P�5X�6`�7h�8p�9x�;��<��=��?��@��A��H�H��H��t��H���5�}�%�}@��h�����f���h�����f���h�����f���h����f���h����f���h����f���h����f���h�r���f����b���f���h �R���f���h
�B���f���h
          �2���f���h
����f���h����f���h�����f���h�����f���h�����f���h�����f���h����f���h����f���h����f���h����f���h�r���f���h�b���f���h�R���f���h␦�B���f���h2���f���h�"���f���h����f���h����f���h�����f���h �����f���h!�����f���h"�����f���h#����f���h$����f���h%����f���h&����f���h'�r���f���h(�b���f���h)�R���f���h*�B���f���h+�2���f���h,�"���f���h-����f���h.����f���h/�����f���h0�����f���h1�����f���h2�����f���h3����f���h4����f���h5����f���h6����f����%>|fD���%6zfD���%.zfD���%&zfD���%zfD���%zfD���%zfD���%zfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%�yfD���%~yfD���%vyfD���%nyfD���%fyfD���%^yfD���%VyfD���%NyfD���%FyfD���%>yfD���%6yfD���%.yfD���%&yfD���%yfD���%yfD���%yfD���%yfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD���%�xfD����f.����UH��AWAVAUATSH�����L���H�H��@���dH�%(H�E�1�H�����/H���S���I��H��t.L�hL��H)�H��~I�|$��H�5I�5�������H�x�E1�H�5�HH��yL�5�rL�-�IH�L�%�T�#���H�5�HH�=QH�`���H�=EH�4���H�=M;�x<ƅ����ƅ����ƅ����ƅ����ƅ����H��@���E1�L��L�ꋽL����j���������v�D
                     ��@~k��A��5�3
                                  Ic�L�>��A�ƅ����ƅ�����ƅ����ƅ�����ƅ�����A��ƅ�����u���ƅ����A��c���=}����
                                                                                                       H�=~HH���H�5�HH�=H������������H��������A����H�F������H9�r ���H��H�H��H)�L�41����oH������H��FH��wH��(���H������H�� ���������
�������J���H��uD� �/���ƅK�����4���Ic�H��8���ƅI���D9�L���`H���tH��x���H)�H���H��x���D�w����H������������0�������H��8���H��8���9�L�����
�������kHc�4���L��p���H��I�u�����H������I��H����1H��p��������1�1���������������9��J���u�������u
                                                Ik���
                                                     L���
                                                         H��H��P�����
                                                                     H��H������H��x���H����
                                                                                           M��J�40M�d$ƅ����L��X���D�luH��M��H������H������H9��`M9���������ǅ������H��x���I��I)�M���
D�%uH��p���H������D��D�������D������H�����
                                          H�������H������L��X���L�
                                                                  H��A�
D�(A��
E��x.������t%L������H���}H�5s�1���L������H�À�������PtoD���P����A��~wzD�+H��E�,$I��A��w�A��      ������� H����f�E��tA�$f�H��I��A��A��    t�A��
�Of�+H����A��tZ�
    A���vZA����0A�ŀH��D�k��\����A��
��A��@�^H��D�k��7���f.�f�H���!���@A��@�C^H��D�k����<
�g����������Z���M9����^MH������H��I��f�S�A�����H9������L��h���L��x���L������M��E��DL��L���5I9��␦M�H��L)�I9�~�H��x���L��h���L��D��h���H��P���M��L������H������H��L��`����_���H������L��`���D��h���H�M9�����A��I�T$E��~oA��t������A��z������uM������tDD��`���H��L��h���H��������
                              H�5�p����D��`���L��h���H������H��������H��t&�=�qt��M��qH��f�C��$H�C�
�MH��f�K��)���@D�%Uq1�H�������D������D������D��������xN���������
                                                                ��������fDH��x���L��D������H���73I9��LD�%�pD���������������A�uH��1�H��1�����D������ƅK����������G��0������A�����o1�ƅI����B���H��(���H9������`��J�������������������������������������%�=��iH��p���Hc�4���I9�IM�H��H������H������L������H��u#�kf.�H��L���1I9����=:oH��L���
                                                                                        I��H����PH��uɸ �K���������=o�n����������H�=�n�:0H������H��H�?1��01��M���ƅK�������H��D��������0D������H9��r����
H��H�@�H���N���H�ƍH�H��H��p����3���H�� ���H9����������1��������H;������q���H�=Dn�/�H�5;>1�H�������H��1�1�H��1�����ƅK���������H�5pE1������H�پH��H�lH�81�����������=~���u��H�5�@1�����H�ڿL�-H<H��1����H��k�1�H�5�@L�#�K���H��L���0���L�#�1�H�5�@�*���L��H������L�#�1�H�5�@�       ���L��H�������L�#�1�H�5B�����L��H�������L�#�1�H�5�B�����L��H������L�#�1�H�5�B����L��H������L�%�l�1�H�5�B����L��L��H��1�L��@�������H��;H�5�;fHn�fHn�H��;fl�fHn�H��;)�@����~�ffl�)�P���fHn�H�c;fHn�H��;fl�)�`���fHI��I�4$H��u�M�t�H�56;1�M�����t���L�%mB�H�):H��L��1������1�������H��t�H�5;H����������H�5�:1�����L��L��H��1�H�):����M9����H�5SB1�������H��L��H��1��g���1������1��Y��������H�51�����H�������H�ڿ�01��5�������L�%yAH�:9�H��L��L�5691������1�������H�������H�5:1��1���L��L��H��1�����L�5�8H��9�␦���H���H�5 A�����H��H������������=
                                                                            j����I����  �����K�������H�U�dH+%(uvH�e�[A\A]A^A_]�fo�EH�=�iH��@���Hǅ@����H���f���X���f���h����(H������H��H��91��01������1��S����b����H�=�9�+H���A�������H�{g�7�H�=
<H�����-���H�=i�a*H���)���H��H�@91��01��t����������foEH�=�hH��@���D������Hǅ@����H���f���X���f���h�����'I������1�L��H��8�h�ht:�=�g��E1�1�1�M�����J���H�����H��t*A��H��@��������������.�t/��g뤸E����������1� �K���H�������m���������5ȸ����u�������.�u�������2���D���w����&�l���H�Ë��␦<��~�DH�������H�=0g�s(�3H�[71�H��1���������c�����&�k�����_�b�����f���1�I��^H��H���PTE1�1�H�=Q�����d�f.�H�=qeH�jeH9�tH��dH��t �����H�=AeH�5:eH)�H��H��?H��H�H��tH��dH����fD�����=eu+UH�=rdH��t
                                                                                                        H�=�d�����d�����H���@0H9�r���8����DH�9dH9�s,H�Q��A�1H�edH�VdH9�s
                                                H��H�Fd�D�d>H����ff.��H��H�����AD�@����A���A8�����D���A����A���D8����H9�td�     �$�A�� �� A��wA�� �� H��@8�u0D�D�
                                         E�X�D��E�Q�D��A��v�A��wA�� �� E��u�1�E9�@�Ɖ���1�D8�u����S������f�1����1�D8�uǾ��t��K���UH��ATS����H�ubD� H�;����H�;�����H�;�����H�5�21�����D��H��1�����ff.�f�U�H��AUI��H��ATI��1�SH������H��I9�tH�H��[A\A]]ÿ����H��t�8tH�32H9�u
                       L����H�2L���� �� A��w�� �� H��I��8�u(�8A�0D�W���D�N���A��v�A��w�� ���u�9�ID��l���f�UH��ATA��SH����y���H��tcH�����tY���<UuC�G���<TuG�G���<Fu<�-u6�8u0�u*�;`H�m1H�u1[HD�A\]Ð<Gu
                                                                            �G���<Bt!A��        H�K1H�B1[HD�A\]�fD�1uـ8uӀ0ù3uǀ0u�1�1�H�51������t��;`H��0H��0[HD�A\]�@UH��AVA��AUI��ATI��S@L��L��D�������H��H��y"�]������tރ�uI���A����H��[A\A]A^]�@U�H�5�01�H��SH��W`����H�(21�H����1��Y��������@UH��AUATSH��H�����H�߅�xk�������uCH���������uoH��������tG����H��D�(I��� ���E����H�[A\A]]�@H���`���1��������H���u�H��H�[A\A]]�����f.��t�H�H9Ct�1�H�������k���f.�H�C H9C(u�H�{Hu�H�������1��������H����0����#�H����!���E�,$������;���f�UH��AUATSH��H������D�#H��I��A�� ����E��u$��tM��u*�����8     ������H�[A\A]]Å�u
                                                                                                                 �w�����������f.�UI��H��AWAVAUATI��SH��hL��@���L��H�����t))�P���)�`���)�p���)]�)e�)m�)u�)}�dH�%(H�����1�L�� ���H�E1�H������H�ME1�1�ǅ���� � H������ǅ����0L�������+��A��L�H�H��H��t+H��H��
���1��H�5�-�����A���L��H��H��:1������L�����M��L��-L��1�H�
0H��1�����L������L��H�
�u���H��        �iH�46Hc�H�>��M��L-L��1�H�
-H�-��S����H�5�,1�����A���L��H��H�:1��!���L��
j/�L��H��1������L���
����L�����L�������L������L������H�5K/H������L��x���L������L������L������L������L������H������H������L������1��6���L��x���H��ASL������L������L��1�L������H�������ARAVAUSAW�&���H��0H�����dH+%(�<H�e�[A\A]A^A_]�L������L������1��L������H������H�5K/L������L������L������L������L������H������H������L�������f���H��P�3���L������L������1��L������H������H�5�.L������L������L������H������L������H����������AVL������AUH��SAWL������H������L��1������H�� �����H������L������1��L������H������H�5�-L������L������H������L����������M��QH��AUSAW�H������H������1��L������H�5y-L������H������L�������7���SH������M��AWH��M��L��1��E���^_����L������L������1��L������H������H�5�,�����M��APH��M��H��AW�L������L������1��H������H�5�)����M��M��H��H��L��1���������L������H������1��H�5c)�d���M��H�پH��L��1��|����U���H������1��H�5)�-����L��H��H��1��H����!���L�����L�������H�5�,L������L������H������L��x���L������L������L������L������L������H������H������L�������c��������ff.�U1�1�H��SH��dH�%(H�E�1������H��tH��H���|���H=v$1�H�U�dH+%(��H�]���f�L������H��L�ǃs}1Ҩug�uK�u/������CtH�5,(L�����������란�����t���D��������Cu���fD�
      f�
        H���t���fD����t��ِ��H��1����H�H���q����������UI��H��AWAVAUATSH���L�M�L�uI������H�U�L�}D��D���M��M��I��dH�%(H�E�1��M�L�]�L�M��3�����D���H��0����E����E���
�����H�50L�M�L�]�Hc�H�>��f.��}�
tdL�%'1��L�]�L��L�M�����L�M�L�]�L9�I����L�%F&1��L�]�L��L�M�����L�M�L�]�L9�I���aH�E�����L��L��p���L��x����p����E�L��x���H�E�L��p���L��H����E��E�Hǅ8����E�@1�fDL9�A��I���u
                                                H�E��<A��E�����}�H�}���"E�H�}�A����H�
                                                                                     D �A�����1@��?��
                                                                                                     @���@��?�uH�=�.@��Hc�H�>��}��
          �f����}��fE1�D��
E���1�H�M�H���������ҋ���������}��}��.�E��� �t<H�}�L9�sA�9'H�M�H�QL9�sA�D        $H�}�H�WL9�sA�D9'H�E��E�H�E�L9�sA�\H�E�H��H�E�L9�sA�4�E�H�E��E��DǈE�����H�M�A�ľ0D��E1�fD�}���E���G�����H��"E���t�H�E�L9�sA�'H�M�H�AL9�sA�D      'H�E��E��r���E1�DH��0����2
          L��`���L��h���@��p���D��x�������D��x���L��h���H����p���L��`���H�H���DB@�A����"U����T����U�E1�D��`���L�E�H�
                                                                                                                    1�L�������0C�DI�@L9�s��������0C�D��H��I����0H9�����M9�sC�4A�4I�����J�������D!�E��tM9�sC�\I��H��H9��@���TM9�sC�'I�@L9�sC�D'I��E1�E1��DE1҃}�������}�������E��}��DE��E���D����H�E�������}��b�}������E1Ҁ}�������� U�몃}��
                                                                                        �v���f����}��D
                                                                                                      �}��
��D�����H�CE1Ҿ?L9��=���H�U��|␦?�.����4@��>��H���pH��A��E�����}��,���H�]�L9�sA�?H�]�H�SL9�sA�D"H�]�H�SL9�sA�D"H�]�H�SL9�sA�D?H��H�E�E1�D��
E1�E1�1�D��Ӿ'H�E�D�U��E��/����}���a�������}����D����
�r�ھ��������#@H������������� ������     �t�}�D�e���A ������������
�n���E��E��E�Hǅ8����E��E�H�E�HǅH���H�E������E����.�E�1�Hǅ8����E�M��tA�'�E�H�6�E�H�E�H��H���H�E��E��R����E��E��E�Hǅ8����EM��tA�"H���E��E��E�Hǅ8����E��E�H�E�H��H���H�E������H�t�E��E��E�Hǅ8����E��E�H�E�H��H���H�E��E��w����E��E��E�Hǅ8����E��E�H�H�E�H��H���H�E��E��.����E��E��E�Hǅ8����E��E��DH�E�H�I���udH��v^L��P���L��X���H��`���D��h���H��p���D��x��������L��P���L��X���H��`���D��h���I��H��p���D��x���I9���H�U�H��H���H��L��X���L��`���D��h���D��p���H��x����O���H��x���D��p�����D��h���L��`���L��X����b�}�������1@��?��@�������@��?�����H�E'@��Hc�H�>��E��D��
E�������d���1Ҿ
�n�c���1�E1Ҿa����H�E�H�HD��H�u�L9�sA�1\E���     ���H�SL9�sH�u��t�V�@��x�����    �i
A��H�M�D�о0E1�����1Ҿ    �t�����1�E1Ҿb�&���E�� D��
�r����1�E1Ҿf�����D�e�E��'D��
E�������`�����1@��?�c@�������@��?�����H��&@��Hc�H�>��E��D��E1�
E��7����        ����E1��␦�����}���
�U��}�H�u�����H�N ������L9�sA�1'L9�sA�  $H�u�H�VL9�sA�D1'H�u�H�VH��H�u�L9��A�\E1Ҿ0�E�����1�E1�
�n�w���E1�#����1�E1Ҿa����E1�}������fDE1Ҿ?D��
E��M�������D�e�E��'E1�D��
�r�����1�E1Ҿf�3���1�E1� �t�����1�E1Ҿb����1�E1Ҿv����E�� E1�D��
E����������fD@��zb@��@������N��H����S���H��H���w������o����}����}��y����E�H��E1Ҿ\�@���fD@��}t��@��{�I�����I�������!���f�@��z��@��@�$����N��H����S���H��H�����������D�e�D"e���H�}�������Q���@@��~������H��0��������H�E�H�E�H��x���I���uTH�}�L��P���L��X���@��`���D��h���D��p��������L��P���L��X�����`���D��h���I��D��p���D��p���1�D��B���H��`���D��C���@��A���D��@���L��P���L��(���L�� ���L�����L��X���I��H��`���J�0H�E�L�<M��M����H��X���L�m�H)���h���H��x���L��L������H��H�������h�����H��h����H��H�L9�r��U�E1�H��������p����}���H�}��� ��p�}�������}����}���H��8�����M���� ��L��8����9���DH�E��x�\����m���D@��}�p�E1�@��{�����|�+���f��}��<���E1�1��?������@��z�@��@�,����N��H����S���H��H���M��������}������E1Ҿ\�<���@H��t`H�����H�����H���t�}�u
�}���I΋}��N�����p���H��x������D؈�p�������������D��p���L��D��B���H��`�����A���D��L��X���D��@�����L��P���L��(���L�� ���L�����"U�����f���C���E1�L�%f��h����2����H����H�E�M�H�T��H��I9��������[<!w�H�+H��s��E�L��X���L��P���L��(���L�� ���L������h���f��E��� �uvL��L�]�M��H��H���H��t/��t+�
                                       H�؄�t!L��L)�H��H9�sA�
                                                           H���
                                                               ��u�I��I9���H�E�dH+%(��H���L��[A\A]A^A_]À}��␦�}���M����H��8����� �H��8���1�H���}��E�H�E�H��H���H�E����E��E�L��8����U�H��8����E�����H�E�L9�sA�'H�u�H�FL9�sA�D1\H�E�H��L9�s
H�E�A�D'L��L��8�������H���J���D�U�L��x���L�E�D��`���L��p���L��h���������E�L��x���L��p���L��h��������E1Ҿ|����D�U�L��x���L�E�D��`���L��p���L��h�������M����A�$�}�A�Eu
�}���������1�E��A���D����E�E1Ҿ0���1�@��~��H��uLE��~A��D��
E��
   ��������@��}�����q@��{������|�����E1�����E1��Z���A��E1�1��~�����I���5���L9�sA�       0H�u�H�VL9�sA�D10H�M�H���m���D���;���D��@��~�U���������A�E���_���E1�f�M9�sC�!I��C�D%��u�L�e��:���H�<�E��E��E�Hǅ8����E��E�H�E�H��H���H�E��F���L��D��B���H��`�����A���L��X���D��@���L��P���L��(���L�� ���L�����������u�H�������L�]�L�M�I�������u�H������L�]�L�M�I���7���E1������?D��
E��b����4���C�␦�[����E��E��1�L��8����E�1��E������]����EÉE��>����E�L��8����5���H��L��D��B���H��`�����A���L��X���D��@���L��P���L��(���L�� ���L���������L��M��E1��p���L��M��L�]����_���L���E�L�]�M���L���L���E�M��E1��:���L��8����U�H��8�����������?L�=V?H�Ë�Eą���Lc�H�,?1�M��I9�IE�I��M�M��I��I���Y�)�L��H�L)�H9��YN�L�M�M��H�}�I��L������H�}�L�M�H��>H��I���\L��>I9��;L��L��L��L�E�H��L9�HC�L)�1�H��H)�L�����D�5H>L�}�E�D$I�DM�7M�A�
                                                           $H�E�I��A��H�U�L��D�E�L��A�t$0A�t$(�����Y^L9�rgH�pH��>I�7I9�tL��H�u�����H�u�H��H�u�����I��H����A�
                                    $H�U�I�H��L�M�D�E�A�t$0H�u�A�t$(����XZ�EĉH�e�L��[A\A]A^A_]�f�A��A�����L��L�M��L���L�M�H��=H��I������������foh=A����H��t�M��A��������f�UH��H��@fo�␦dH�%(H�E�1�H�u�H�E�E�f��E�f��E�����H�U�dH+%(u���V���fD��UH��SH�H�D<H�8������t@�H�5x
                         1������H���5���1�H��H�J�01������=^<�5���DH�)<H�8�1�����uH�]��Ë=5<�
                                                                                           ���ff.��UH��AWE1�AVI��AUI��ATSH�H��tZ�M��DL��L�������H��H��yP蛿�����t�I���v��uA����fDH���t
                                                             I�I�I)�u�H�L��[A\A]A^A_]�Du��I�����ڐ��H�m;1�������H�H��write errorASCIIUTF-8’��"'�e‘GB18030memory exhaustedGNU coreutilscat%s (%s) %s
(C)Written by %s.
Written by %s and %s.
Written by %s, %s, and %s.
POSIX`/.libs/lt-/usr/share/localesha2 utilities[test invocationMulti-call invocationsha224sumsha256sumsha384sumsha512sum
%s online help: <%s>
en_Full documentation <%s%s>
Richard M. StallmanTorbjörn GranlundTorbjorn Granlund9.4benstuvAETstandard output%s: input file is output filecannot doclosing standard inputnumber-nonblanknumbersqueeze-blankshow-nonprintingshow-endsshow-tabsshow-allhelpversionLicense GPLv3+: GNU GPL version 3 or later <%s>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
https://gnu.org/licenses/gpl.htmlWritten by %s, %s, %s,
%s, %s, %s, %s,
%s, %s, and others.
Written by %s, %s, %s,
and %s.
Written by %s, %s, %s,
%s, and %s.
Written by %s, %s, %s,
%s, %s, and %s.
Written by %s, %s, %s,
%s, %s, %s, and %s.
Written by %s, %s, %s,
%s, %s, %s, %s,
and %s.
Written by %s, %s, %s,
%s, %s, %s, %s,
%s, and %s.
A NULL argv[0] was passed through an exec system call.
Usage: %s [OPTION]... [FILE]...
Concatenate FILE(s) to standard output.

With no FILE, or when FILE is -, read standard input.

  -A, --show-all           equivalent to -vET
  -b, --number-nonblank    number nonempty output lines, overrides -n
  -e                       equivalent to -vE
  -E, --show-ends          display $ at end of each line
  -n, --number             number all output lines
  -s, --squeeze-blank      suppress repeated empty output lines
  -t                       equivalent to -vT
  -T, --show-tabs          display TAB characters as ^I
  -u                       (ignored)
  -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB
      --help        display this help and exit
      --version     output version information and exit

Examples:
  %s f - g  Output f's contents, then standard input, then g's contents.
  %s        Copy standard input to standard output.
https://www.gnu.org/software/coreutils/Report any translation bugs to <https://translationproject.org/team/>
or available locally via: info '(coreutils) %s%s'
Try '%s --help' for more information.
�������i���F�������3������� ����������������;���������������������������%�������������������<�����������������������������������������������������������������������������������d���d���k���d���a���d�������d���d���d���a���a���a���a���a���a���a���a���a���a���a���a���a���a���a���a���d���d���d���d��������������������������������������p���_����������������������������������������������������������������������������������������������^���^���k���^�������^�������^���^���^�������������������������������������������������������������������^���^���^���^�������L�������������������������������|���h�����������Y���E�������������������������������������������������������������������������������<���<�������<���$���<���%���<���<���<���$���$���$���$���$���$���$���$���$���$���$���$���$���$���$���$���<���<���<���<�������ϫ��������������ܫ�����������������������������������������������������������������������������������������������������������������������������ի�������������������������������������������������������������������Copyright %s %d Free Software Foundation, Inc.^M^?M-^I�8�������� ȥ��88���H����ؼ���Ƚ��PH���dH���x�����h����X��������$����@���p����������������<���lx�����������zRx
                                                                                                   ���&D$48����FJ
                                                                                                                 �?␦9*3$B�H�J�Z�A�Hp�p���t�ܼ����Ƚ��SA�C

A
B�D�d��A�C

B
 i

G
 K
B�E�E�D�G�C
E���Z���A�C��<A�Q

E
 i

O
E���F��fA�C

A
H����K�(A�F

A
H�F���A�G

J
P�����9�A�F

A
 X���
H����H�����,x����'A�C

C
P �����ZA�C

A
E�k�����E�C

A
B�E�E�J��pC

F
P�������E�C

A
rbrn$rs2rvCrEMrTWrA`r~���er}���Lp�
�d�␦����o�8
�
<
���o�0 @ P ` p � � � � � � � � !! !0!@!P!`!p!�!�!�!�!�!�!�!�!"" "0"@"P"`"p"�"�"�"�"�"�"�"�"## #0#@#P#`#p#�#��      0 ��@�,�1�/usr/lib/debug/.dwz/x86_64-linux-gnu/coreutils.debugV6K7�G���F
                                                                              �␦�4344ee95580ab114995448d0e1d379638782b4.debugxg��.shstrtab.interp.note.gnu.property.note.gnu.build-id.note.ABI-tag.gnu.hash.dynsym.dynstr.gnu.version.gnu.version_r.rela.dyn.rela.plt.init.plt.got.plt.sec.text.fini.rodata.eh_frame_hdr.eh_frame.init_array.fini_array.data.rel.ro.dynamic.data.bss.gnu_debugaltlink.gnu_debuglink
                                           88&hh$9�� G���o��Q
                                                             ��Y8
8
 ��}�}���~�~���������H ����؝��h��h�@ h�I ��4�/root@LAPTOP-66HI94H2:/usr/bin# cd ..
root@LAPTOP-66HI94H2:/usr# cd ..
root@LAPTOP-66HI94H2:/# mkdir dir1
root@LAPTOP-66HI94H2:/# ls -l
total 2820
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x   2 root root    4096 Mar 25 10:57 dir1
drwxr-xr-x  87 root root    4096 Mar 25 10:23 etc
drwxr-xr-x   3 root root    4096 Mar 25 09:45 home
-rwxr-xr-x   1 root root 2781568 Dec 12 03:58 init
lrwxrwxrwx   1 root root       7 Apr 22  2024 lib -> usr/lib
drwxr-xr-x   2 root root    4096 Apr  8  2024 lib.usr-is-merged
lrwxrwxrwx   1 root root       9 Apr 22  2024 lib64 -> usr/lib64
drwx------   2 root root   16384 Mar 24 10:45 lost+found
drwxr-xr-x   2 root root    4096 Jan  6  2025 media
drwxr-xr-x   5 root root    4096 Mar 24 10:45 mnt
drwxr-xr-x   2 root root    4096 Jan  6  2025 opt
dr-xr-xr-x 276 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 08:50 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# rmdir dir1
root@LAPTOP-66HI94H2:/# ls -l
total 2816
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x  87 root root    4096 Mar 25 10:23 etc
drwxr-xr-x   3 root root    4096 Mar 25 09:45 home
-rwxr-xr-x   1 root root 2781568 Dec 12 03:58 init
lrwxrwxrwx   1 root root       7 Apr 22  2024 lib -> usr/lib
drwxr-xr-x   2 root root    4096 Apr  8  2024 lib.usr-is-merged
lrwxrwxrwx   1 root root       9 Apr 22  2024 lib64 -> usr/lib64
drwx------   2 root root   16384 Mar 24 10:45 lost+found
drwxr-xr-x   2 root root    4096 Jan  6  2025 media
drwxr-xr-x   5 root root    4096 Mar 24 10:45 mnt
drwxr-xr-x   2 root root    4096 Jan  6  2025 opt
dr-xr-xr-x 276 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 08:50 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/#
