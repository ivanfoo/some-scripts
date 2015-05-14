#! /bin/bash

path=$1

if [ -z $path ]; then
    echo "Usage: drop_oldies PATH"
    exit 1
fi

year=`date +%Y`
month=`date +%m`

pattern="$path/20[0-9][0-9]"
dirlist=`ls -d1 $pattern`

for dir in $dirlist; do
    basename=`basename $dir`

    if [ $basename -lt $year ];then
        echo "Moving ${dir} to ${_dir}"
        _dir="${path}/_${basename}"
        mv $dir $_dir

    elif [ $basename -eq $year ]; then
        pattern2="$dir/[0-1][0-9]"
        sdirlist=`ls -d1 $pattern2`

        for sdir in $sdirlist; do
        basename=`basename  $sdir`

            if [ $basename -lt $month ]; then
                echo "Moving ${sdir} to ${_sdir}"
                _sdir="${dir}/_${basename}"
                mv $sdir $_sdir
            fi
        done
    fi
done

exit 0
