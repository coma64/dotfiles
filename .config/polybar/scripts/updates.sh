#!/usr/bin/env bash

BAR_ICON=""

while true; do
    UPDATE_COUNT=$($HOME/bin/get_update_count.py)
    echo "${BAR_ICON} ${UPDATE_COUNT}"
    sleep 10 #$((5 * 60))
done
