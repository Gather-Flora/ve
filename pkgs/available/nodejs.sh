# mattb 2022/09/13 - use pre-built binaries, something on the macos x64 build
# breaks npm currently down in npm minizlib...

#NODEJS_VERSION="16.13.0"
#NODEJS_SHA256SUM="9c00e5b6024cfcbc9105f9c58cf160762e78659a345d100c5bd80a7fb38c684f"
#NODEJS_VERSION="14.18.3"
#NODEJS_SHA256SUM="96d51324e4eb9dd88082a1effe328d272a6568121930e51ec089db1b966f891a"
#NODEJS_VERSION="12.22.7"
#NODEJS_SHA256SUM="f7eaea2f9fbd09b8fceec40d64a00132928eb8b55a587c2d0a563536e3da9273"
#NODEJS_VERSION="10.24.1"
#NODEJS_SHA256SUM="95c7cfc4b5ad0b5a62bd553b30840db66f21217fbeb769ab27dac8019a4ebe5d"
#
#getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz $NODEJS_SHA256SUM
#tar zxf node-v${NODEJS_VERSION}.tar.gz
#cd node-v${NODEJS_VERSION}/
#./configure --prefix=$VENV
#$PMAKE install
#
## add yarn
#$VENV/bin/npm install --global yarn

NODEJS_VERSION="16.17.0"
NODEJS_PLATFORM="linux"
NODEJS_ARCH="x64"
NODEJS_SHA256SUM="f0867d7a17a4d0df7dbb7df9ac3f9126c2b58f75450647146749ef296b31b49b"

if [ "$MOS" == "MacOS" ]; then
  NODEJS_PLATFORM="darwin"
  NODEJS_SHA256SUM="b85eaa537f9d60a68c704e23839db65b5a75f14b37d6855c5d4e31a6bcef26c6"
  if [ "$MARCH" == "arm64" ]; then
    NODEJS_ARCH="arm64"
    NODEJS_SHA256SUM="96eefac1e168ec1bf39c5ae1e7b2760522624adfbe2e0c92875cd33ef9a07792"
  fi
  NAME="node-v${NODEJS_VERSION}-${NODEJS_PLATFORM}-${NODEJS_ARCH}"
  getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/${NAME}.tar.gz $NODEJS_SHA256SUM
  tar zxf ${NAME}.tar.gz
else
  NAME="node-v${NODEJS_VERSION}-${NODEJS_PLATFORM}-${NODEJS_ARCH}"
  getpkg https://nodejs.org/dist/v${NODEJS_VERSION}/${NAME}.tar.xz $NODEJS_SHA256SUM
  tar Jxf ${NAME}.tar.xz
fi

rm -f $NAME/[A-Z]*

cp -r $NAME/* $VENV/
