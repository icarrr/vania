#!/bin/bash
read -p 'Enter location of the password file (ex:/home/user/my-passwords.yml): ' file_password

if [[ $file_password == '' ]]; then
    echo "Please add an argument that defines the location of the password file, exiting..."
    exit
fi

ADMIN_PASSWORD=$(cat $file_password | grep MONGO_ADMIN_PASSWORD | head -n 1 | awk '{print $2}')

echo "List dump"
echo "---------"
ls ~/backups/mongodb/ | awk '{print $1}'

read -p 'Enter name backup directory to restore (ex:dump-20190917_120654): ' name_backup
if [[ $name_backup == '' ]]; then
	echo "Please enter name backup directory to restore, exiting..."
	exit
fi

echo "The following is a list of databases in MongoDB"
echo "-----------------------------------------------"
echo "echo 'show dbs' | mongo --quiet -u 'admin' -p $ADMIN_PASSWORD --authenticationDatabase 'admin'" | bash
sleep 1
echo ''
echo ''

echo "Drop database edxapp"
echo "--------------------"
echo "mongo edxapp --eval 'db.dropDatabase()' -u 'admin' -p $ADMIN_PASSWORD --authenticationDatabase 'admin'" | bash
sleep 1
echo ''
echo ''

echo "Drop database cs_comments_service"
echo "---------------------------------"
echo "mongo cs_comments_service --eval 'db.dropDatabase()' -u 'admin' -p $ADMIN_PASSWORD  --authenticationDatabase 'admin'" | bash
sleep 1
echo ''
echo ''

echo "The following is a list of databases in MongoDB"
echo "-----------------------------------------------"
echo "echo 'show dbs' | mongo --quiet -u 'admin' -p $ADMIN_PASSWORD --authenticationDatabase 'admin'" | bash
sleep 1
echo ''
echo ''

echo "Restore MongoDB dump file"
echo "mongorestore ~/backups/mongodb/$name_backup -u 'admin' -p $ADMIN_PASSWORD --authenticationDatabase 'admin'" | bash
echo ''
echo ''
sleep 1

echo "The following is a list of databases in MongoDB"
echo "-----------------------------------------------"
echo "echo 'show dbs' | mongo --quiet -u 'admin' -p $ADMIN_PASSWORD --authenticationDatabase 'admin'" | bash

echo "DONE"
