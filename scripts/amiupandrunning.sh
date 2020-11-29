#!/bin/bash
#@STCGoal Runs and restart Mysql container if not working fine
##@STCGoal See ../install.sh - Stuff for running the command bellow in the container
### docker exec png-mysql "mysql -u ... -p ... db -query ' query etc...


#var for connecting
mysqlpassword='u!_Uy9laAE2ziUm2'
mysqlusername='amiupandrunning'

testquery='SELECT * FROM serverstatus WHERE id = 1'

echo "$testquery"
echo "Testing if up"

#@STCIssue Not working because it is in a Container - the command needs to run in the container
mysql -u $mysqlusername -p $mysqlpassword $mysqlusername && echo "guess we are up" || echo "We are not up and running :( That is sad, but we can restart and act on this status"

