root@LAPTOP-66HI94H2:/# touch file.txt
root@LAPTOP-66HI94H2:/# ls -l
total 2816
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x  87 root root    4096 Mar 25 08:45 etc
-rw-r--r--   1 root root       0 Mar 25 09:41 file.txt
drwxr-xr-x   2 root root    4096 Apr 22  2024 home
-rwxr-xr-x   1 root root 2781568 Dec 12 03:58 init
lrwxrwxrwx   1 root root       7 Apr 22  2024 lib -> usr/lib
drwxr-xr-x   2 root root    4096 Apr  8  2024 lib.usr-is-merged
lrwxrwxrwx   1 root root       9 Apr 22  2024 lib64 -> usr/lib64
drwx------   2 root root   16384 Mar 24 10:45 lost+found
drwxr-xr-x   2 root root    4096 Jan  6  2025 media
drwxr-xr-x   5 root root    4096 Mar 24 10:45 mnt
drwxr-xr-x   2 root root    4096 Jan  6  2025 opt
dr-xr-xr-x 276 root root       0 Mar 25 08:47 proc
drwx------   4 root root    4096 Mar 25 09:36 root
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
root@LAPTOP-66HI94H2:/# rm file.txt
root@LAPTOP-66HI94H2:/# ls -l
total 2816
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x  87 root root    4096 Mar 25 08:45 etc
drwxr-xr-x   2 root root    4096 Apr 22  2024 home
-rwxr-xr-x   1 root root 2781568 Dec 12 03:58 init
lrwxrwxrwx   1 root root       7 Apr 22  2024 lib -> usr/lib
drwxr-xr-x   2 root root    4096 Apr  8  2024 lib.usr-is-merged
lrwxrwxrwx   1 root root       9 Apr 22  2024 lib64 -> usr/lib64
drwx------   2 root root   16384 Mar 24 10:45 lost+found
drwxr-xr-x   2 root root    4096 Jan  6  2025 media
drwxr-xr-x   5 root root    4096 Mar 24 10:45 mnt
drwxr-xr-x   2 root root    4096 Jan  6  2025 opt
dr-xr-xr-x 276 root root       0 Mar 25 08:47 proc
drwx------   4 root root    4096 Mar 25 09:36 root
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
root@LAPTOP-66HI94H2:/# cd home
root@LAPTOP-66HI94H2:/home# ls -l
total 0
root@LAPTOP-66HI94H2:/home# ls -la
total 8
drwxr-xr-x  2 root root 4096 Apr 22  2024 .
drwxr-xr-x 27 root root 4096 Mar 25 09:43 ..
root@LAPTOP-66HI94H2:/home# mkdir Linux Fundamentals
root@LAPTOP-66HI94H2:/home# ls -l
total 8
drwxr-xr-x 2 root root 4096 Mar 25 09:44 Fundamentals
drwxr-xr-x 2 root root 4096 Mar 25 09:44 Linux
root@LAPTOP-66HI94H2:/home# rm Fundamentals
rm: cannot remove 'Fundamentals': Is a directory
root@LAPTOP-66HI94H2:/home# rm -rf Fundamentals
root@LAPTOP-66HI94H2:/home# ls -l
total 4
drwxr-xr-x 2 root root 4096 Mar 25 09:44 Linux
root@LAPTOP-66HI94H2:/home# rm -rf Linux
root@LAPTOP-66HI94H2:/home# ls -l
total 0
root@LAPTOP-66HI94H2:/home# mkdir Linux_Fundamentals
root@LAPTOP-66HI94H2:/home# ls -l
total 4
drwxr-xr-x 2 root root 4096 Mar 25 09:45 Linux_Fundamentals
root@LAPTOP-66HI94H2:/home# cd Linux_Fundamentals
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# touch test.txt
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# nano test.txt
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# cat test.txt
This is a Linux test
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# pwd
/home/Linux_Fundamentals
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# ls -l
total 4
-rw-r--r-- 1 root root 21 Mar 25 09:46 test.txt
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# cd
root@LAPTOP-66HI94H2:~# ls -l
total 0
root@LAPTOP-66HI94H2:~# ls -la
total 36
drwx------  5 root root 4096 Mar 25 09:46 .
drwxr-xr-x 27 root root 4096 Mar 25 09:43 ..
-rw-------  1 root root   89 Mar 24 12:19 .bash_history
-rw-r--r--  1 root root 3106 Apr 22  2024 .bashrc
drwx------  2 root root 4096 Mar 24 10:44 .cache
-rw-------  1 root root   20 Mar 25 09:36 .lesshst
drwxr-xr-x  3 root root 4096 Mar 25 09:46 .local
-rw-r--r--  1 root root    0 Mar 25 08:45 .motd_shown
-rw-r--r--  1 root root  161 Apr 22  2024 .profile
drwx------  2 root root 4096 Jan  6  2025 .ssh
root@LAPTOP-66HI94H2:~# cd
root@LAPTOP-66HI94H2:~# cd ..
root@LAPTOP-66HI94H2:/# ls -l
total 2816
lrwxrwxrwx   1 root root       7 Apr 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root    4096 Feb 26  2024 bin.usr-is-merged
drwxr-xr-x   2 root root    4096 Apr 22  2024 boot
drwxr-xr-x  15 root root    3860 Mar 25 08:47 dev
drwxr-xr-x  87 root root    4096 Mar 25 08:45 etc
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
drwx------   5 root root    4096 Mar 25 09:46 root
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
root@LAPTOP-66HI94H2:/# cd home
root@LAPTOP-66HI94H2:/home# ls -l
total 4
drwxr-xr-x 2 root root 4096 Mar 25 09:46 Linux_Fundamentals
root@LAPTOP-66HI94H2:/home# cd Linux_funda
-bash: cd: Linux_funda: No such file or directory
root@LAPTOP-66HI94H2:/home# cd Linux
-bash: cd: Linux: No such file or directory
root@LAPTOP-66HI94H2:/home# cd Linux_Fundamentals
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# ls -l
total 4
-rw-r--r-- 1 root root 21 Mar 25 09:46 test.txt
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# touch test.txt
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# cat test.txt
This is a Linux test
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# nano test.txt
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals# cat test.txt
This is a Linux test
test 2
root@LAPTOP-66HI94H2:/home/Linux_Fundamentals#
