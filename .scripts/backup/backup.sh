#!/bin/bash

BASE_PATH="$(dirname "$0")"

source "$BASE_PATH/constants.sh"

restic init

notify-send "Backup Started" "Backing up data to B2..." -u normal

restic backup $O_OPTIONS \
    --exclude-file=$BASE_PATH/excludes.txt \
    --files-from $BASE_PATH/includes.txt


last_snapshot_id=$(restic snapshots $O_OPTIONS --json | \
    egrep -o '"short_id":"[A-Za-z0-9]*"' | \
    tail -n 1 | cut -d':' -f2 | sed 's/"//g')

backup_size=$(restic stats $last_snapshot_id $O_OPTIONS | \
    grep -o "Total Size:.*$" | \
    egrep -o "[0-9]*\.[0-9]* [A-Za-z]{3}")

notify-send "Backup Complete!" "$backup_size of data was backed up. Now beginning backup check" -u normal


out="$(restic check --check-unused --read-data --with-cache $O_OPTIONS)"
unused_blobs=$(echo "$out" | grep "unused blob" | wc -l)
unreferenced_indexes=$(echo "$out" | egrep "pack [0-9A-Za-z]{8}: not referenced in any index" | wc -l)
res=$(echo "$out" | tail -n 1)

notify-send "Backup Check Complete!" "$unused_blobs unused blobs.\n$unreferenced_indexes packs not referenced in any index.\n$res" -u normal


notify-send "Removing Old Snapshots..." \
    "Forgetting snapshots and keeping only:
    - 24 hourly snapshots
    - 7 daily snapshots
    - 4 weekly snapshots
    - 12 monthly snapshots
    - 80 yearly snapshots" -u normal

restic forget $O_OPTIONS \
    --keep-hourly 24 \
    --keep-daily 7 \
    --keep-weekly 4 \ 
    --keep-monthly 12 \
    --keep-yearly 80

notify-send "Finished Removing Old Snapshots" "Old snapshots have been removed from B2" -u normal


source "$BASE_PATH/unset-constants.sh"
