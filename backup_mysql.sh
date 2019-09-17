#!/bin/bash
echo "Create directory backups/mysql"
mkdir -p ~/backups/mysql

localTime=$(date '+%Y%m%d_%H%M%S' -d "$(curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g')")

mkdir -p ~/backups/mysql/backups-$localTime

echo "Dump database"
mysqldump -u root --databases edxapp > ~/backups/mysql/backups-$localTime/edxapp_backup.sql
mysqldump -u root --databases edxapp_csmh > ~/backups/mysql/backups-$localTime/edxapp_csmh_backup.sql

echo "DONE"
