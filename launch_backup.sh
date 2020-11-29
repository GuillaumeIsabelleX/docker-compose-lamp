#!/bin/bash


echo "#Backing Up Data Only" 
be-stop  &&\
tar czf /backups/data.tar.gz /a/docker-compose-lamp/data/ &&\
be-start &&\
droxul upload /backups/data.tar.gz /Backups_py/data.tar.gz && echo "Data backed up Suceeded "A
be-start


# Temps to ignore huge content that is already in repo
mv /www/_vh/gi/wp-content/uploads/sites/assets-vr-1909/ /www  

tar czf /backups/gi.tar.gz  /www/_vh/gi/ && cd /backups/ && droxul upload gi.tar.gz /Backups_py/gi.tar.gz && ginol "gi.tar.gz u backuping completed " || ginol "Backuping gi.tar.gz FAILED"

mv /www/assets-vr-1909/ /www/_vh/gi/wp-content/uploads/sites/


