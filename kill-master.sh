#!/bin/bash
## kill-master.sh##
master=`docker ps |grep -c master`
online=1

for i in $master
do
if [ $i -eq $online ]
  then docker kill master  && echo "killing old master instance"
  else echo "master not running" | docker rm master &> /dev/null
fi
done
