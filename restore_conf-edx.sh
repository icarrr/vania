#!/bin/bash
echo "List backups"
echo "---------"
ls ~/backups/conf/ | awk '{print $1}'

read -p 'Enter name backup directory to restore (ex:backups-20190917_120654): ' name_backup
if [[ $name_backup == '' ]]; then
  echo "Please enter name backup directory to restore, exiting..."
  exit
fi

sudo cp -f ~/backups/conf/$name_backup/* /edx/app/edxapp/

echo "DONE"
