Customizing the Shell Prompt
PS1="[\u@\h \w]$ "                      basic prompt
PS1="\[\e[32m\]\u@\h \w$\[\e[0m\] "    green text prompt
echo 'PS1="[\u@\h \w]$ "' >> ~/.bashrc
source ~/.bashrc                         make prompt permanent


 


Shell Aliases
alias ll='ls -la'                        create alias
alias gs='git status'
unalias ll                                remove alias
echo "alias ll='ls -la'" >> ~/.bashrc
source ~/.bashrc                          make alias permanent

 



 Environment Variables

printenv                                  view environment variables
env
MYVAR="Hello"                             temporary variable
export MYVAR                              export variable
export PATH=$PATH:/new/directory          add directory to PATH
echo 'export PATH=$PATH:/new/directory' >> ~/.bashrc
source ~/.bashrc                          make permanent





 Processes and Job Control

jobs                                      list background jobs
command &                                 run job in background
fg %1                                      bring job to foreground
bg %1                                      resume stopped job in background
kill PID                                   terminate process
kill -9 PID                                force terminate




 

 Scheduling Repeated Jobs with Cron
 
crontab -e                                edit user's cron jobs
crontab -l                                list cron jobs
0 2 * * * /home/user/script.sh            example: run daily at 2am
crontab -r                                remove all cron jobs




 
 Switching Users and Running Commands as Others
 
su -                                       switch to root user
su username                                switch to another user
sudo command                               run command as root
sudo -u username command                   run command as another user

 
 


Shell History
 
history                                    view command history
!!                                         repeat last command
!123                                       repeat command number 123
Ctrl + r                                   search history interactively

 




 Tab Completion
 
ls Doc<TAB>                                auto-complete filename
cd /usr/loc<TAB>                           auto-complete directory
source /etc/bash_completion                enable programmable completion