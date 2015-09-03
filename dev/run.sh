#!/usr/bin/env bash
. ./app_config.sh

docker run --rm --read-only --name=${APP_NAME}-dev -p 9000:9000 -v $(pwd):/app -ti ${APP_NAME}:dev $@
