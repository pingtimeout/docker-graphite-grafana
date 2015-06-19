#!/bin/bash

if test "$(ls -A "/var/lib/graphite/conf/")"; then
    echo "Using existing configuration for graphite"
else
    echo "Copied the default configuration"
    cp -r /graphite_conf/* /var/lib/graphite/conf/
fi

sleep 2