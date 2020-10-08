#!/bin/bash

# TODO do this properly

if [ $# -eq 0 ] ; then
    echo "I need the path to a directory"
    exit 1
fi


count=0

for file in $1/* ; do

    if [ -f $file ] && [ -x $file ] ; then
       # echo $file
       fullpath="$(realpath $file)"
       #echo $fullpath
       basename="$(basename $file)"
       #echo $basename
       ln -s $fullpath "$HOME/.local/bin/$basename" && echo "$fullpath linked to $HOME/.local/bin/$basename"
       ((count=count+1))
    fi

done

#test $linked -eq 0 && echo "no executables to link in $1"
if [ $count -eq 0 ] ; then
    echo "no executables to link in $1"
else
    echo "$count files linked"
fi

