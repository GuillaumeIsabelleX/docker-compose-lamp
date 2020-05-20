#!/bin/bash


#@STCGoal Sync master web site content with Development/backup site

# Vars

export DBX_BAK_ROOT_PATH=/Backups_py
export DBX_DATA_TAR_GZ=data.tar.gz
export DBX_FILES_TAR_GZ=gi.tar.gz
export LOCAL_WWW_ROOT=./www
export REL_TARGET_DATA_DIR=./data/mysql
export REL_TARGET_FILES_DIR=_vh/gi
export TMP_DOWNLOAD_PATH=$TEMP/_droxrestore_sync

rm -rf $TMP_DOWNLOAD_PATH
mkdir $TMP_DOWNLOAD_PATH

# Scenario

## The main server will backup data and files to dropbox using Droxul.
## The dev/backup site will download data and files and update local copies with fresh ones

mkdir -p zold

mv $LOCAL_WWW_ROOT/$REL_TARGET_FILES_DIR zold
mv $REL_TARGET_DATA_DIR zold

mkdir -p $REL_TARGET_DATA_DIR 
mkdir -p $REL_TARGET_FILES_DIR 

droxul download $DBX_BAK_ROOT_PATH/$DBX_DATA_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_DATA_TAR_GZ
droxul download $DBX_BAK_ROOT_PATH/$DBX_FILES_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_FILES_TAR_GZ

