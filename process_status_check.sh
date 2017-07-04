#!/bin/bash

n=0
# enter any process to check the status
pididi="tar -xvf dir.tar"

if [[ -d $HOME ]]; then
        pod=`hostname`
fi

until [[ $n -gt 0 ]];

do

        pid_present=`ps -edf | grep "$pididi" | grep -v grep`
        if [[ -n "$pid_present" ]]; then
                echo ""$pid_present" going on" > pid.temp
        else
                MAIL_LIST="xxx@gmail.com"
                MSG_SUB=""$pididi" completed in $pod"
                echo ""$pididi" completed" > pid.temp
                mailx -s "${MSG_SUB}" "${MAIL_LIST}" < pid.temp
                n=$(($n+1))
        fi

done

if [[ -f pid.temp ]]; then
        rm pid.temp
fi
