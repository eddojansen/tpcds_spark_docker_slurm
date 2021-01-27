#!/bin/bash
##kill-worker.sh##
worker=`docker ps |grep -c worker`
online=1

for i in $worker
do
if [ $i -eq $online ]
  then docker kill worker && echo "killing old worker instance"
  else echo "master not running" |  docker rm worker &> /dev/null
fi
done
