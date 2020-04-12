#!/bin/bash

#source ~/.bashrc

export fname=$1
export dirsrc=$2
export droxbakroot=/Backups_py
export localbakroot=/backups
export droxulcmd=~/apps/node_modules/droxul/dropbox_uploader.sh

echo "Executing tar czf $localbakroot/$fname.tar.gz $dirsrc ; cd $localbakroot ; droxul upload $fname.tar.gz $droxbakroot/$fname.tar.gz"

tar czf $localbakroot/$fname.tar.gz $dirsrc ; cd $localbakroot ; $droxulcmd upload $fname.tar.gz $droxbakroot/$fname.tar.gz

echo done

