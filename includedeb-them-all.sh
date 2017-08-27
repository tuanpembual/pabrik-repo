#!/bin/bash -e
set -e
PATH=$1
echo $PATH

for i in $(/usr/bin/find $PATH -type f | /bin/grep "\.deb$")
do 
  echo "$i"
  /usr/bin/reprepro -v -v -v includedeb uluwatu $i || true
done
