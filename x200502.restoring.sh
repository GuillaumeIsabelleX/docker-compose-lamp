#!/bin/bash

echo "
	#--@STCGoal Getting the Data from the latest backup
then we will try running Docker, install new WP and see how it goes..."

droxul download /Backups_py/data.tar.gz 

#--@STCgoal Restored MySQL data from Py
tar xzf data.tar.gz
mv a/ _restore
mv _restore/docker-compose-lamp/data/mysql/* data/mysql/

#--@STCGoal Docker configured for that instance and runs on HU
#--@STCIssue Will we have the same App as GuillaumeIsabelle.com ??
#--@STCIssue Wont run on HU, will try on Gaia2
