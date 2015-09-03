#!/usr/bin/env bash
. ./app_config.sh

docker run -p 9000:9000 -v $(pwd):/app -ti ${APP_NAME}:dev $@
