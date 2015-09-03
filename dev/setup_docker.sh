#!/usr/bin/env bash
. ./app_config.sh

[[ "${1}" == "-f" ]] && docker rmi ${APP_NAME}:dev && rm dev/docker/add_user.sh

if [[ -f dev/docker/add_user.sh ]]; then
  GREEN='\033[1;32m'
  NC='\033[0m' # No Color
  printf "${GREEN}INFO: Soft rebuild. Use -f to force hard rebuild${NC}\n\n"
else
  echo "#!/bin/sh" > dev/docker/add_user.sh
  echo "groupadd -g ${GROUPS} app && useradd -u ${UID} -g ${GROUPS} app" >> dev/docker/add_user.sh
  chmod +x dev/docker/add_user.sh
  cat dev/docker/add_user.sh
fi

docker build -t ${APP_NAME}:dev dev/docker/

# Uncomment once you have a package and/or bower config

# e.g.
# ./dev/run.sh npm init
# ./dev/run.sh bower init
# ./dev/run.sh npm install grunt-sass --save-dev
# ./dev/run.sh bower install angular --save

#./dev/run.sh npm install
#./dev/run.sh bower install
