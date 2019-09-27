#!/bin/bash

read -p 'Enter location of the password file (ex:/home/user/my-passwords.yml): ' file_password

if [[ $file_password == '' ]]; then
    echo "Please add an argument that defines the location of the password file, exiting..."
    export file_password=~/my-passwords.yml
fi

echo "Create directory backups/mongodb"
mkdir -p ~/backups/mongodb

ADMIN_PASSWORD=$(cat $file_password | grep MONGO_ADMIN_PASSWORD | head -n 1 | awk '{print $2}')

localTime=$(date '+%Y%m%d_%H%M%S' -d "$(curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g')")

echo "Dump MongoDB"
sleep 1

echo "mongodump --out ~/backups/mongodb/dump-$localTime -u 'admin' -p $ADMIN_PASSWORD --authenticationDatabase admin" | bash

echo "DONE"
