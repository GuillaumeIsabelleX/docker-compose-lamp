#!/bin/bash


#@STCGoal Sync master web site content with Development/backup site

# Vars

export DBX_BAK_ROOT_PATH=/Backups_py
export DBX_DATA_TAR_GZ=data.tar.gz
export DBX_FILES_TAR_GZ=gi.tar.gz
export LOCAL_ROOT=./www
export REL_TARGET_DIR=_vh/gi
export TMP_DOWNLOAD_PATH=$TEMP

# Scenario

## The main server will backup data and files to dropbox using Droxul.
## The dev/backup site will download data and files and update local copies with fresh ones


droxul download 
