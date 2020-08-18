#!/bin/bash

CONTNAME=groonga_dev

echo "removing docker image..."

ISALIVE=`docker ps -a | grep $CONTNAME | grep Exited | wc -l`
if [ $ISALIVE = 1 ]; then
    docker rm $CONTNAME
else
    echo "$CONTNAME already running!"
fi

