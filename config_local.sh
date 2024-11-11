# install prefix
VENV="/opt/gf/ve"

# Unit to ignore in needsrestart
SYSTEMD_UNIT="supervisord"

# cache package downloads
PKG_CACHE="/tmp/venv-pkg"

# build directory
BUILD_DIR="$VENV/build"
DATA_DIR="/opt/gf/data"
LOG_DIR="/opt/gf/log"
RUN_DIR="/opt/gf/run"

# remote rsync for push/pull
RSYNC_USER="push"
RSYNC_HOST="netops.gatherflora.com"

SUBPATH="$(echo $BUILDKITE_BRANCH | tr '/' '-')"
if [ "$SUBPATH" == "" ]; then
  SUBPATH="$(git rev-parse --abbrev-ref HEAD | tr '/' '-')"
fi

RSYNC_PATH="ve/$SUBPATH"
