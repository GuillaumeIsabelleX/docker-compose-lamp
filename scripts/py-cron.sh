#!/bin/bash

#@STCGoal A Script that stabilise the Platform
#@STCIssue The backend crashes

# restart the docker container
docker container restart png-mysql
##@STCIssue The container will restart anyway even if not bugged
###@STCGoal A test script calls the SQL test table and if failedd will restart the server



