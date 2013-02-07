#!/bin/bash
while [ 1 ]; do
    if [[ ! -z `lsusb |grep '12d1:1436'` ]]; then
	sudo wvdial;
    fi
    sleep 1s
done
