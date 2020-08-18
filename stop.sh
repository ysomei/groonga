#!/bin/bash

CONTNAME=groonga_dev

echo "stopping docker image..."

ISALIVE=`docker ps -a | grep $CONTNAME | grep Exit | wc -l`
if [ $ISALIVE = 1 ]; then
    echo "already stopped!"
else
    docker stop $CONTNAME
fi

