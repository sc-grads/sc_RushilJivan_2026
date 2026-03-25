 Input, Output and Redirection

stdin    standard input (keyboard)
stdout   standard output (screen)
stderr   error output (screen)


>    redirect output (overwrite)
ls > files.txt
date > output.txt


>>   redirect output (append)
echo hello >> file.txt
date >> log.txt


<    redirect input
sort < names.txt
wc -l < file.txt


2>   redirect errors
ls missingfile 2> error.txt


2>>  append errors
command 2>> error.txt


> file 2>&1   redirect stdout and stderr together
command > output.txt 2>&1


|    pipe output to another command
ls | sort
cat file.txt | grep hello


> /dev/null         discard output
command > /dev/null

2> /dev/null        discard errors
command 2> /dev/null

> /dev/null 2>&1    discard all output
command > /dev/null 2>&1
```
