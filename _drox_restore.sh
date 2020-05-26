#!/bin/bash

#@STCIssue do not run as is, must paste in a BASH shell, dont know why the droxul wont load

#@STCGoal Sync master web site content with Development/backup site


#@STCPrereq [Droxul](https://www.npmjs.com/package/droxul)
#somehow the alias is not working if not created here
alias droxul='~/apps/droxulapp/node_modules/droxul/dropbox_uploader.sh '


export DROXUL='~/apps/droxulapp/node_modules/droxul/dropbox_uploader.sh '

# Vars
## Vars Mostly will change with context
export DBX_BAK_ROOT_PATH=/Backups_py
export DBX_DATA_TAR_GZ=data.tar.gz
export DBX_FILES_TAR_GZ=gi.tar.gz
export DBX_IMG_TAR_GZ=img.tar.gz
export DBX_AF_TAR_GZ=af.tar.gz
export REL_TARGET_FILES_ROOT_DIR=_vh
export REL_TARGET_FILES_DIRNAME=gi
export REL_TARGET_IMG_DIRNAME=img
## Vars Mostly will not change
export WORKDIR=$(pwd)
export LOCAL_WWW_ROOT_REL_PATH=./www
export LOCAL_WWW_ROOT_FULL_PATH=$WORKDIR/$LOCAL_WWW_ROOT_REL_PATH
export REL_TARGET_DATA_DIR=./data/mysql
export REL_TARGET_FILES_DIR_REL_PATH=$REL_TARGET_FILES_ROOT_DIR/$REL_TARGET_FILES_DIRNAME
export REL_TARGET_FILES_DIR_FULL_PATH=$LOCAL_WWW_ROOT_FULL_PATH/$REL_TARGET_FILES_DIR_REL_PATH
export VH_TARGET_FOLDER_FULL_PATH=$LOCAL_WWW_ROOT_FULL_PATH/$REL_TARGET_FILES_ROOT_DIR
export AF_FULL_PATH=$LOCAL_WWW_ROOT_FULL_PATH/af
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
mv $LOCAL_WWW_ROOT_FULL_PATH/af zold



#mkdir -p $REL_TARGET_DATA_DIR 
#mkdir -p $REL_TARGET_FILES_DIR_REL_PATH 


droxul download $DBX_BAK_ROOT_PATH/$DBX_DATA_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_DATA_TAR_GZ
droxul download $DBX_BAK_ROOT_PATH/$DBX_IMG_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_IMG_TAR_GZ
droxul download $DBX_BAK_ROOT_PATH/$DBX_AF_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_AF_TAR_GZ
droxul download $DBX_BAK_ROOT_PATH/$DBX_FILES_TAR_GZ $TMP_DOWNLOAD_PATH/$DBX_FILES_TAR_GZ

# DATA
cd _xtract_tmp
rm -rf $REL_SOURCE_DATA_PATH
tar xzf $TMP_DOWNLOAD_PATH/$DBX_DATA_TAR_GZ $REL_SOURCE_DATA_PATH
mv $REL_SOURCE_DATA_PATH/mysql .
rm -rf $REL_SOURCE_DATA_PATH/
mv mysql ../data/
echo "@State : MySQL Data is Restored"

cd $WORKDIR

##############################################
#files

cd _xtract_tmp

# Extract the target dir from the archive
tar xzf $TMP_DOWNLOAD_PATH/$DBX_FILES_TAR_GZ $REL_SOURCE_FILES_PATH/$REL_TARGET_FILES_DIR_REL_PATH

#making vhost dir if not exist
mkdir -p $VH_TARGET_FOLDER_FULL_PATH

cd $REL_SOURCE_FILES_PATH
cd $REL_TARGET_FILES_ROOT_DIR

# Moving the restored DIR into the WWW full path where it belong
mv $REL_TARGET_FILES_DIRNAME $VH_TARGET_FOLDER_FULL_PATH
echo "Files should be restored in $REL_TARGET_FILES_DIR_FULL_PATH"


# Restore the https://github.com/jgwill/assets-vr-1909.git
cd $REL_TARGET_FILES_DIR_FULL_PATH/wp-content/uploads/sites/ && git clone https://github.com/jgwill/assets-vr-1909.git

cd $WORKDIR



#################################################


##############################################
#af

cd _xtract_tmp

# Extract the target dir from the archive
tar xzf $TMP_DOWNLOAD_PATH/$DBX_AF_TAR_GZ

mv www/af $LOCAL_WWW_ROOT_FULL_PATH
echo "AF files should be restored in $LOCAL_WWW_ROOT_FULL_PATH/af"
cd $WORKDIR





##################################################
#IMG - just sync
#cd _xtract_tmp

cd $REL_TARGET_FILES_DIR_FULL_PATH && tar xzf $TMP_DOWNLOAD_PATH/$DBX_IMG_TAR_GZ img/ico
rm -f ico #if related link
mv img/ico .
rmdir img

#Cleaning up
rm $TMP_DOWNLOAD_PATH/*

#
cd $WORKDIR