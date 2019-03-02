#!/bin/bash


#@Vision Compose and make stats on the build time in a file
SLOG=stats_compose.$HOSTNAME.log


echo "-------------------------------------" >> $SLOG
echo "-----------Compose Starting----------" >> $SLOG
STARTED_BUILD_MSG="Started at : $(date) on host : $HOSTNAME"
echo "--- $STARTED_BUILD_MSG" >> $SLOG
echo "----------------->>------" >> $SLOG

(git add $SLOG && git commit $SLOG -m "$STARTED_BUILD_MSG" && git push) &

npm run compose




echo "--------------Ended-----<--------------" >> $SLOG

ENDED_BUILD_MSG="Started at : $(date) on host : $HOSTNAME"
echo "--- $ENDED_BUILD_MSG">>$SLOG

#Pushing changes
git commit $SLOG -m "$ENDED_BUILD_MSG" && git push


