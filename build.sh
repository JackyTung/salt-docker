#!/bin/bash
ROLE=master
REPO=jackytung
TAG=2017.7.2
while true; do
    read -p "Which salt image would you like to build? [master/minion] " choice
        case $choice in
            master )
                ROLE=master; CONTAINER=salt-master; break;;
            minion )
                ROLE=minion; CONTAINER=salt-minion; break;;
            *) echo "Please answer master or minion";;
        esac
done

docker build -f Dockerfile.$ROLE -t $REPO/$CONTAINER:$TAG .
