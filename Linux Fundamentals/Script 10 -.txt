 Comparing Files

diff file1 file2         compare two files and show differences

sdiff file1 file2        side-by-side comparison

vimdiff file1 file2      open files in vim and highlight differences



 Searching in Files and Using Pipes


 Grep - search for text in files
grep pattern file                   display lines matching pattern
grep -i pattern file                ignore case
grep -c pattern file                count occurrences
grep -n pattern file                show line numbers
grep -v pattern file                invert match (lines that don't match)


 File type
file file_name                      display file type


 Search text in binary files
strings binary_file                 display printable strings


 Pipes
command1 | command2                 output of command1 becomes input of command2
cat file | grep pattern             example using pipe


 Cut - extract parts of lines/files
cut file                             cut parts of file
cut -d ',' -f 2 file.txt            -d delimiter, -f field number



 Transferring and Copying Files Over Network


 SCP - Secure Copy
scp source_file user@host:/path/to/destination     copy file to remote host
scp -r local_dir user@host:/remote/dir           copy directory recursively


 SFTP - SSH File Transfer Protocol
sftp user@host                                   start secure file transfer session
put local_file                                   upload file to remote host
get remote_file                                  download file from remote host
ls                                               list files on remote host
cd /remote/dir                                   change directory on remote host


 FTP
ftp host                                         start file transfer session (less secure than SFTP)


 Windows Command Line SCP/SFTP
pscp source_file user@host:/path                PuTTY SCP client
psftp user@host                                  PuTTY SFTP client


 Graphical Clients
 Cyberduck, FileZilla, WinSCP for GUI-based secure file transfers