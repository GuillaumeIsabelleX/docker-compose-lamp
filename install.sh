#!/bin/bash


export bemylib=/var/lib/bemy
export bemystatusfile=$bemylib/status
alias bemyrefreshstatus='docker exec -it png-mysql "pwd"   && export bemystate=online || export bemystate=offline ; echo $bemystate > $bemystatusfile ; echo $bemystate'
alias bemyreadstate='export bemystate=$(cat $bemystatusfile)'
alias bemygetstate='echo $bemystate'

mkdir -p -m 775 $bemylib
echo "offline" > $bemystatusfile #status of the server when installing


