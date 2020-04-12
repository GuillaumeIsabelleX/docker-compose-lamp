#!/bin/bash

export fname=$1
export dirsrc=$2
export droxbakroot=/Backups_py
export localbakroot=/backups

echo "Executing tar czf $localbakroot/$fname.tar.gz $dirsrc ; cd $localbakroot ; droxul upload $fname.tar.gz $droxbakroot/$fname.tar.gz"

tar czf $localbakroot/$fname.tar.gz $dirsrc ; cd $localbakroot ; droxul upload $fname.tar.gz $droxbakroot/$fname.tar.gz

echo done

