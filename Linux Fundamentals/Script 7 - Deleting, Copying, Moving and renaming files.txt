Delete
rm file                 remove file
rm -r dir               remove directory and its contents
rm -f file              force removal


 Copy
cp source_file destination_file         copy source to destination
cp src_file1 src_file2 dest_dir         copy multiple files to directory
cp -i source dest                       interactive copy (prompt before overwrite)
cp -r source_dir dest_dir               copy directory recursively


 Move / Rename
mv source dest                          move or rename file/directory
mv -i source dest                       interactive move (prompt before overwrite)


 Sort
sort file                               sort text in file
sort -k F file                          sort by field number F
sort -r file                            sort in reverse order
sort -u file                            sort unique (remove duplicates)


 Create collection (tar)
tar -c f archive.tar files              create tar archive
tar -x f archive.tar                    extract archive
tar -t f archive.tar                    list contents
tar -cvf archive.tar files              verbose create
tar -xvf archive.tar                    verbose extract
tar -czf archive.tar.gz files           create compressed archive


 Compress
gzip file                               compress file
gunzip file.gz                          uncompress file
gzcat file.gz                           view concatenated compressed files
zcat file.gz                            view compressed file contents


 Disk usage
du                                      estimate file usage
du -k                                   show in kilobytes
du -h                                   human readable sizes