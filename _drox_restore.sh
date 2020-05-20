#!/bin/bash


#@STCGoal Sync master web site content with Development/backup site

# Vars
export WORKDIR=$(pwd)
export DBX_BAK_ROOT_PATH=/Backups_py
export DBX_DATA_TAR_GZ=data.tar.gz
export DBX_FILES_TAR_GZ=gi.tar.gz
export LOCAL_WWW_ROOT_REL_PATH=./www
export LOCAL_WWW_ROOT_FULL_PATH=$WORKDIR/$LOCAL_WWW_ROOT_REL_PATH
export REL_TARGET_DATA_DIR=./data/mysql
export REL_TARGET_FILES_ROOT_DIR=_vh
export REL_TARGET_FILES_DIRNAME=gi
export REL_TARGET_FILES_DIR_REL_PATH=$REL_TARGET_FILES_ROOT_DIR/$REL_TARGET_FILES_DIRNAME
export REL_TARGET_FILES_DIR_FULL_PATH=$LOCAL_WWW_ROOT_FULL_PATH/$REL_TARGET_FILES_DIR_REL_PATH
export TMP_DOWNLOAD_PATH=$TEMP/_droxrestore_sync
# Where the data is in the TAR
export REL_SOURCE_DATA_PATH=a/docker-compose-lamp/data
export REL_SOURCE_FILES_PATH=www

#Cleanup old
rm -rf $TMP_DOWNLOAD_PATH
mkdir $TMP_DOWNLOAD_PATH

# Scenario

## The main server will backup data and files to dropbox using Droxul.
## The dev/backup site will download data and files and update local copies with fresh ones

mkdir -p zold
mkdir -p _xtract_tmp

mv $LOCAL_WWW_ROOT_REL_PATH/$REL_TARGET_FILES_DIR_REL_PATH zold
mv $REL_TARGET_DATA_DIR zold

#mkdir -p $REL_TARGET_DATA_DIR 
#mkdir -p $REL_TARGET_FILES_DIR_REL_PATH 

droxul download $DBX_BAK_ROOT_PATH/$DBX_DATA_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_DATA_TAR_GZ
droxul download $DBX_BAK_ROOT_PATH/$DBX_FILES_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_FILES_TAR_GZ


cd _xtract_tmp
rm -rf $REL_SOURCE_DATA_PATH
tar xzf $TMP_DOWNLOAD_PATH/$DBX_DATA_TAR_GZ $REL_SOURCE_DATA_PATH
mv $REL_SOURCE_DATA_PATH/mysql .
rm -rf $REL_SOURCE_DATA_PATH/
mv mysql ../data/
echo "@State : MySQL Data is Restored"

cd $WORKDIR

#files

cd _xtract_tmp
#cd $LOCAL_WWW_ROOT_REL_PATH

# Extract the target dir from the archive
tar xzf $TMP_DOWNLOAD_PATH/$DBX_FILES_TAR_GZ $REL_SOURCE_FILES_PATH/$REL_TARGET_FILES_DIR_REL_PATH

cd $REL_SOURCE_FILES_PATH
cd $REL_TARGET_FILES_ROOT_DIR

# Moving the restored DIR into the WWW full path where it belong
mv $REL_TARGET_FILES_DIRNAME $REL_TARGET_FILES_DIR_FULL_PATH
echo "Files should be restored in $REL_TARGET_FILES_DIR_FULL_PATH"

#Cleaning up
rm $TMP_DOWNLOAD_PATH/*

#
cd $WORKDIR