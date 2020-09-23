#!/bin/bash
set -e

echo "Create directory backups/mysql"
mkdir -p ~/backups/mysql

localTime=$(date '+%Y%m%d_%H%M%S' -d "$(curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g')")

mkdir -p ~/backups/mysql/backups-$localTime

echo "Dump database"
mysqldump -u root --databases edxapp > ~/backups/mysql/backups-$localTime/edxapp_backup.sql
mysqldump -u root --databases edxapp_csmh > ~/backups/mysql/backups-$localTime/edxapp_csmh_backup.sql
tar --lzma -C ~/backups/mysql/ -cvpf ~/backups/mysql/backups-$localTime.tar.lzma backups-$localTime
rm -rf ~/backups/mysql/backups-$localTime

echo "DONE"
