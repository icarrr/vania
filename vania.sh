#!/bin/bash

# Vania Menu
options=(
    "Install Open edX"
    "Generate Certificate"
    "Check Status"
    "Restart LMS"
    "Restart CMS"
    "Restart edxapp_worker"
    "Restart edxapp"
    "Install Open edX Insight (Don't run this on your LMS Server)"
    "Backup MongoDB Open edX"
    "Backup MySQL Open edX"
    "Restore MongoDB Open edX"
    "Restore MySQL Open edX"
    "Backup LMS and CMS Conf"
    "Restore LMS and CMS Conf"
    "Quit"
)
PS3="Select your Open edX task (1-15): "

select option in "${options[@]}"; do
    case "$REPLY" in
        1) bash install-openedx.sh ;;
        2) bash gencert-openedx.sh ;;
        3) bash status-openedx.sh ;;
        4) bash restart-lms-openedx.sh ;;
        5) bash restart-cms-openedx.sh ;;
        6) bash restart-edxappworker-openedx.sh ;;
        7) bash restart-edxapp.sh ;;
        8) bash install-insights.sh ;;
        9) bash backup_mongo.sh ;;
        10) bash backup_mysql.sh ;;
        11) bash restore_mongo.sh ;;
        12) bash restore_mysql.sh ;;
        13) bash backup_conf-edx.sh ;;
        14) bash restore_conf-edx.sh ;;
        15) break ;;
    esac
done
