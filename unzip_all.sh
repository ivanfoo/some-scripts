#! /bin/bash

for file in "$@"; do
  dest=${file%%.*};
  unzip $file -d ./$dest
done
