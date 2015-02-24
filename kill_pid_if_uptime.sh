#! /bin/bash

function uptime_is_exceeded () {

    pid=$1
    secs_allowed=$2

    if [ ! -d /proc/$pid ]; then
        return
    fi

    sys_time=`date +%s`
    pid_time=`ls -ltrhd --time-style=+%s /proc/$pid | awk '{print $6}'`
    max_time=$(($pid_time+$secs_allowed))

    return $(( max_time > sys_time ))
}

pattern=$1
secs_allowed=$2
pid_list=($(pgrep -f $pattern))

for pid in "${pid_list[@]}"; do
    if uptime_is_exceeded $pid $secs_allowed; then
        echo -e "Let\'s kill $pid"
        kill -9 $pid
    else
        echo "No PIDS to kill :("
    fi
done
