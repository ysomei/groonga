#!/bin/bash

CONTNAME=groonga_dev

echo "restarting docker image..."

ISALIVE=`docker ps -a | grep $CONTNAME | grep Up | wc -l`
if [ $ISALIVE = 1 ]; then
    echo "already runnin!"
else
    docker restart $CONTNAME
fi

