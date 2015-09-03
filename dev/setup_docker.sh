#!/usr/bin/env bash
. ./app_config.sh

if [[ -f add_user.sh ]]; then
  GREEN='\033[1;32m'
  NC='\033[0m' # No Color
  printf "${GREEN}INFO: Skipping updating user. Remove add_user.sh to rebuild.${NC}\n\n"
else
  echo "#!/bin/sh" > add_user.sh
  echo "groupadd -g ${GROUPS} app && useradd -u ${UID} -g ${GROUPS} app" >> add_user.sh
  chmod +x add_user.sh
  cat add_user.sh
fi

docker build -t ${APP_NAME}:dev -f dev.dockerfile .

# Uncomment once you have a package and/or bower config

# e.g.
# ./dev/run.sh npm init
# ./dev/run.sh bower init
# ./dev/run.sh npm install grunt-sass --save-dev
# ./dev/run.sh bower install angular --save

./dev/run.sh npm install
./dev/run.sh bower install
