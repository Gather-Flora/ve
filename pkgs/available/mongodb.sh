MONGODB_VERSION="6.0.0"
MONGODB_SHELL_VERSION="1.5.1"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  if [ "$MARCH" == "arm64" ]; then
    MONGODB_SHA256SUM="aed3622e3854c85ae0de307802e593c91e5d8c59e497e659d8e42f7718db0ecb"
    MONGODB_SHELL_SHA256SUM="9a2673bc79c77508ea89321d530668be6325fffae5ef89c57c8f28f00abe5d00"
    MONGODB_SHELL_ARCH="$MARCH"
  else
    MONGODB_SHA256SUM="312fccb8bc0465104533ba42ed5641c27382fd03ca52f074fbd5bc8291d28512"
    MONGODB_SHELL_SHA256SUM="2b900c717c68d8c92b7e290a558ea584a0d3c10e25574821e846bc67b8aa7c29"
    MONGODB_SHELL_ARCH="x64"
  fi

  getpkg https://fastdl.mongodb.org/osx/mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz
  mv mongodb-macos-aarch64-${MONGODB_VERSION} mongodb-macos-${MARCH}-${MONGODB_VERSION} || true
  mv mongodb-macos-${MARCH}-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-darwin-${MONGODB_SHELL_ARCH}.zip $MONGODB_SHELL_SHA256SUM
  unzip mongosh-${MONGODB_SHELL_VERSION}-darwin-${MONGODB_SHELL_ARCH}.zip
  mv mongosh-${MONGODB_SHELL_VERSION}-darwin-${MONGODB_SHELL_ARCH}/bin/* $VENV/bin/
else
  MONGODB_SHA256SUM="1e2d68ae63351861b6e13dcda16f73a4a0d33e3cd627de2fa1254f33dd9db946"
  getpkg https://fastdl.mongodb.org/linux/mongodb-linux-${MARCH}-ubuntu2004-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-linux-${MARCH}-ubuntu2004-${MONGODB_VERSION}.tgz
  mv mongodb-linux-${MARCH}-ubuntu2004-${MONGODB_VERSION}/bin/* $VENV/bin/

  MONGODB_SHELL_SHA256SUM="5be02937b574eaf3ce26789224b4129d159b53e24143ad5be8b38cedb318525d"
  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-linux-x64-openssl11.tgz $MONGODB_SHELL_SHA256SUM
  tar zxf mongosh-${MONGODB_SHELL_VERSION}-linux-x64-openssl11.tgz
  mv mongosh-${MONGODB_SHELL_VERSION}-linux-x64-openssl11/bin/* $VENV/bin/
fi

# build tools from source (golang) - they don't provide a tools macos arm64
# binary as of July 2022
git clone https://github.com/mongodb/mongo-tools.git
cd mongo-tools
git checkout 100.5.4
./make build
cp bin/* $VENV/bin/

rm -fr mongodb*
