#!/bin/bash
##
##
IFS_OLD=$IFS
IFS=$'\n'
URL=`cat url.txt`
UA=`cat ua.txt`
for i in $URL
  do
    for j in $UA
       do
#/usr/bin/curl -A \"$j\" \"$i\"
/usr/bin/curl -A $j  $i 
      done
  done
IFS=$IFS_OLD
