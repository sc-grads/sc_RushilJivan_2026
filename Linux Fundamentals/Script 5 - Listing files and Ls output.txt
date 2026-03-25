root@LAPTOP-66HI94H2:/# ls
bin                dev   init               lib64       mnt   root  sbin.usr-is-merged  sys  var        wslPlIabN
bin.usr-is-merged  etc   lib                lost+found  opt   run   snap                tmp  wslGGjBbN  wslanooeK
boot               home  lib.usr-is-merged  media       proc  sbin  srv                 usr  wslMLGkON  wslfeoPaN
root@LAPTOP-66HI94H2:/# ls -a
.    bin.usr-is-merged  etc   lib                lost+found  opt   run                 snap  tmp  wslGGjBbN  wslanooeK
..   boot               home  lib.usr-is-merged  media       proc  sbin                srv   usr  wslMLGkON  wslfeoPaN
bin  dev                init  lib64              mnt         root  sbin.usr-is-merged  sys   var  wslPlIabN
root@LAPTOP-66HI94H2:/# cd ..
root@LAPTOP-66HI94H2:/# ls 0l
ls: cannot access '0l': No such file or directory
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
dr-xr-xr-x 277 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 12:02 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# ls -l -a
total 2824
drwxr-xr-x  27 root root    4096 Mar 25 10:58 .
drwxr-xr-x  27 root root    4096 Mar 25 10:58 ..
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
dr-xr-xr-x 277 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 12:02 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# ls -la
total 2824
drwxr-xr-x  27 root root    4096 Mar 25 10:58 .
drwxr-xr-x  27 root root    4096 Mar 25 10:58 ..
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
dr-xr-xr-x 277 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 12:02 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# ls -al
total 2824
drwxr-xr-x  27 root root    4096 Mar 25 10:58 .
drwxr-xr-x  27 root root    4096 Mar 25 10:58 ..
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
dr-xr-xr-x 277 root root       0 Mar 25 08:47 proc
drwx------   5 root root    4096 Mar 25 10:24 root
drwxr-xr-x  19 root root     580 Mar 25 08:45 run
lrwxrwxrwx   1 root root       8 Apr 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root    4096 Mar 31  2024 sbin.usr-is-merged
drwxr-xr-x   2 root root    4096 Mar 24 10:44 snap
drwxr-xr-x   2 root root    4096 Jan  6  2025 srv
dr-xr-xr-x  13 root root       0 Mar 25 08:48 sys
drwxrwxrwt   8 root root    4096 Mar 25 12:02 tmp
drwxr-xr-x  12 root root    4096 Jan  6  2025 usr
drwxr-xr-x  13 root root    4096 Mar 24 10:45 var
drwx------   2 root root    4096 Mar 25 07:58 wslGGjBbN
drwx------   2 root root    4096 Mar 25 07:58 wslMLGkON
drwx------   2 root root    4096 Mar 25 07:58 wslPlIabN
drwx------   2 root root    4096 Mar 25 07:58 wslanooeK
drwx------   2 root root    4096 Mar 25 07:58 wslfeoPaN
root@LAPTOP-66HI94H2:/# cd /usr/local
root@LAPTOP-66HI94H2:/usr/local# ls
bin  etc  games  include  lib  man  sbin  share  src
root@LAPTOP-66HI94H2:/usr/local# ls -F
bin/  etc/  games/  include/  lib/  man@  sbin/  share/  src/
root@LAPTOP-66HI94H2:/usr/local# ls -R
.:
bin  etc  games  include  lib  man  sbin  share  src

./bin:

./etc:

./games:

./include:

./lib:
python3.12

./lib/python3.12:
dist-packages

./lib/python3.12/dist-packages:

./sbin:

./share:
ca-certificates  fonts  man  sgml  xml

./share/ca-certificates:

./share/fonts:

./share/man:

./share/sgml:
declaration  dtd  entities  misc  stylesheet

./share/sgml/declaration:

./share/sgml/dtd:

./share/sgml/entities:

./share/sgml/misc:

./share/sgml/stylesheet:

./share/xml:
declaration  entities  misc  schema

./share/xml/declaration:

./share/xml/entities:

./share/xml/misc:

./share/xml/schema:

./src:
root@LAPTOP-66HI94H2:/usr/local# tree
Command 'tree' not found, did you mean:
  command 'free' from deb procps (2:4.0.4-4ubuntu3.2)
  command 'ttree' from deb libtemplate-perl (2.27-1build7)
  command 'true' from deb coreutils (9.4-2ubuntu2)
  command 'tee' from deb coreutils (9.4-2ubuntu2)
Try: apt install <deb name>
root@LAPTOP-66HI94H2:/usr/local# tree -d
Command 'tree' not found, did you mean:
  command 'ttree' from deb libtemplate-perl (2.27-1build7)
  command 'true' from deb coreutils (9.4-2ubuntu2)
  command 'free' from deb procps (2:4.0.4-4ubuntu3.2)
  command 'tee' from deb coreutils (9.4-2ubuntu2)
Try: apt install <deb name>
root@LAPTOP-66HI94H2:/usr/local# ls --color
bin  etc  games  include  lib  man  sbin  share  src
root@LAPTOP-66HI94H2:/usr/local#
