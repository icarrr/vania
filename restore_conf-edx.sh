#!/bin/bash
set -e

echo "List backups"
echo "---------"
ls ~/backups/conf/ | awk '{print $1}'

read -p 'Enter name backup directory to restore (ex:backups-20190917_120654): ' name_backup
if [[ $name_backup == '' ]]; then
  echo "Please enter name backup directory to restore, exiting..."
  exit
fi

mkdir ~/extract-vania
tar -xvf ~/backups/conf/$name_backup --directory ~/extract-vania

sudo cp -f ~/extract-vania/$name_backup/* /edx/app/edxapp/
sudo chown edxapp:www-data /edx/app/edxapp/{l,c}ms.{auth,env}.json

rm -rf ~/extract-vania

echo "DONE"
