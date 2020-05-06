#!/usr/bin/bash

BASE_PATH=$(dirname "$SCRIPT")

source "$BASE_PATH/constants.sh"

notify-send "Beginning Repo Prune..." "Pruning $B2_BUCKET.." -u normal

restic prune

notify-send "Finished Pruning Repo" "Finished pruning $B2_BUCKET" -u normal

source "$BASE_PATH/unset-constants.sh"
