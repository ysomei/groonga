#!/bin/sh

GROONGA=/usr/bin/groonga
DATAPATH=/mnt/db
DATAFILE=data.db

ISALIVE=`ps | grep ${GROONGA} | grep -v grep | wc -l`

start ()
{
    if [ ! -e $DATAPATH/$DATAFILE ]; then
        $GROONGA -n $DATAPATH/$DATAFILE quit
    fi

    if [ $ISALIVE == 0 ]; then
        echo "stating groonga..."
        $GROONGA --protocol http -s -d $DATAPATH/$DATAFILE
    else
        echo "groonga is already started!"
    fi
}

stop ()
{
    if [ $ISALIVE == 0 ]; then
        echo "groonga is not started."
    else
        echo "stopping groonga..."
        PID=`ps | grep ${GROONGA} | grep -v grep | awk '{print $1}'`
        kill -KILL $PID
    fi
}

case "$1" in
    start)
        start ;;
    stop)
        stop ;;
    *)
        echo "Usage: $0 [start|stop]"
        exit 0
        ;;
esac

echo "done."
exit 0

