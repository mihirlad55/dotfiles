#!/usr/bin/bash

export B2_KEY_NAME=
export B2_BUCKET=

export B2_ACCOUNT_ID=
export B2_ACCOUNT_KEY=
export RESTIC_PASSWORD=

export B2_PATH="b2:${B2_BUCKET}/${B2_DIR}"
export RESTIC_REPOSITORY="b2:${B2_BUCKET}"

O_OPTIONS="-o b2.connections=5"
