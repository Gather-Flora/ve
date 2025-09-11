#!/bin/bash

set -eo pipefail

./build.sh --clean

if [ -e ~/.gve-mtime.json ]; then
  /opt/gf/ve/ve/preserve-mtime.py /opt/gf/ve ~/.gve-mtime.json
fi
/opt/gf/ve/ve/preserve-mtime.py /opt/gf/ve > ~/.gve-mtime.json

./push.sh
