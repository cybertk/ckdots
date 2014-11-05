#!/usr/bin/env bash

nodes="
192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6
"

i=0

for node in $nodes; do
    i=$((i+1))
    log_dir="flynn-host-log/node-${i}"
    mkdir -p $log_dir

    echo "Collecting logs of ${node}"
    # collect logs
    scp -r ${node}:/tmp/flynn-host-logs/ $log_dir
    scp -r ${node}:/var/log/upstart/flynn-host.* $log_dir
done

# Packing
zip -r flynn-host-log.zip flynn-host-log/*
