#!/bin/bash
echo "List backups"
echo "---------"
ls ~/backups/mysql/ | awk '{print $1}'

read -p 'Enter name backup directory to restore (ex:backups-20190917_120654): ' name_backup
if [[ $name_backup == '' ]]; then
	echo "Please enter name backup directory to restore, exiting..."
	exit
fi

mysql -u root -e "drop database edxapp;"
mysql -u root -e "drop database edxapp_csmh;"
mysql -u root -e "create database edxapp;"
mysql -u root -e "create database edxapp_csmh;"
mysql -u root edxapp < ~/backups/mysql/$name_backup/edxapp_backup.sql
mysql -u root edxapp < ~/backups/mysql/$name_backup/edxapp_csmh_backup.sql

echo "DONE"
