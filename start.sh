#!/bin/bash

# Variables from env
: "${SALT_ROLE:=master}"
: "${LOG_LEVEL:=info}"

if [ ! -z "$SALT_GRAINS" ]; then
    echo "INFO: Set grains: $SALT_GRAINS"
    echo $SALT_GRAINS > /etc/salt/grains
fi

# Start salt-$SALT_ROLE
echo "starting salt-$SALT_ROLE with log level $LOG_LEVEL"
/usr/bin/salt-$SALT_ROLE --log-level=$LOG_LEVEL
