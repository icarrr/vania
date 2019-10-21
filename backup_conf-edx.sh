#!/bin/bash
echo "Create directory backups/conf"
mkdir -p ~/backups/conf

localTime=$(date '+%Y%m%d_%H%M%S' -d "$(curl -s --head http://google.com | grep ^Date: | sed 's/Date: //g')")

mkdir -p ~/backups/conf/backups-$localTime

sudo cp /edx/app/edxapp/*json ~/backups/conf/backups-$localTime

echo "DONE"
