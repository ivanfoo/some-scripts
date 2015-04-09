#! /bin/bash

pattern=$1
days=$2
safe=$3

for file in `find . -name "$pattern" -mtime +"$days"`; do
    cp -rp $file $safe
    rm -rf $file
done

exit 0
