#!/bin/bash

# This execute a sequence of backups for files of the server

source ~/.bashrc

# this backups the data
echo "Backing up data started"
(be-stop ; tar czf /backups/data.tar.gz /a/docker-compose-lamp/data/ && be-start  && droxul upload /backups/data.tar.gz /Backups_py/data.tar.gz && echo "Data backed up Suceeded "; echo Backuping the files ; tar czf /backups/gi.tar.gz  /www/_vh/gi/ && cd /backups/ && droxul upload gi.tar.gz /Backups_py/gi.tar.gz && ginol "gi.tar.gz u backuping completed " || ginol "Backuping gi.tar.gz FAILED")&

echo "Will wait a bit before the files"
sleep 30
echo "Backing up the files started"
#this backups the files and uploads them to dropbox
(tar czf /backups/gi.tar.gz  /www/_vh/gi/ && cd /backups/ && droxul upload gi.tar.gz /Backups_py/gi.tar.gz && ginol "gi.tar.gz u backuping completed " || ginol "Backuping gi.tar.gz FAILED")&

