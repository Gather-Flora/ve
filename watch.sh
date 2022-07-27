#!/bin/bash

while true; do
  git fetch
  if [ "$(git rev-list HEAD...origin/master --count)" != "0" ]; then
    git pull
    time ./build.sh --clean && ./push.sh
    git log -n 1
    echo 'Done.'
  fi
  sleep 300
done
