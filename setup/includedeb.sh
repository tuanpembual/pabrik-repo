#!/bin/bash
PATH=$1
echo $PATH

for i in $(/usr/bin/find $PATH -type f)
do 
  echo "$i"
  if [[ $i == *".deb"* ]]; then
    /usr/bin/reprepro -v -v -v includedeb experimental $i
  fi 
done

