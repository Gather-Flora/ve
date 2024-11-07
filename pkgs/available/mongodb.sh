MONGODB_VERSION="8.0.3"
MONGODB_SHELL_VERSION="2.3.3"
MONGODB_TOOLS_VERSION="100.10.0"

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  MONGODB_SHA256SUM="7ab4e05385d0f4987596d3ca6f2c96eb37f78511c0728a46b87091170fc01f98"
  MONGODB_SHELL_SHA256SUM="980d186a555d96d49e6e5662caf103603a39a00f549a10fd85e2e9eace692934"
  MONGODB_TOOLS_SHA256SUM="946177e469ef8744bd36aa38809926beb3c97a56e4c1d637dc052a1f18f57515"

  getpkg https://fastdl.mongodb.org/osx/mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz
  mv mongodb-macos-aarch64-${MONGODB_VERSION} mongodb-macos-${MARCH}-${MONGODB_VERSION} || true
  mv mongodb-macos-${MARCH}-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-darwin-${MARCH}.zip $MONGODB_SHELL_SHA256SUM
  unzip mongosh-${MONGODB_SHELL_VERSION}-darwin-${MARCH}.zip
  mv mongosh-${MONGODB_SHELL_VERSION}-darwin-arm64/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip $MONGODB_TOOLS_SHA256SUM
  unzip mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip
  mv mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
else
  MONGODB_SHA256SUM="0059df2ba0033cc06774bde4d3af087d8e30c83f006b4fd466163683e8d2df53"
  MONGODB_SHELL_SHA256SUM="eb2583a750c1dda8eedc80577fb47d611c673e2482e5c39b282d979533671bf0"
  MONGODB_TOOLS_SHA256SUM="e92ef9448aeb347216f253ca3cd34ef5490102d4c6269353c799f51b69206e4a"

  getpkg https://fastdl.mongodb.org/linux/mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz $MONGODB_SHA256SUM
  tar zxf mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz
  mv mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}/bin/* $VENV/bin/

  getpkg https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-linux-x64.tgz $MONGODB_SHELL_SHA256SUM
  tar zxf mongosh-${MONGODB_SHELL_VERSION}-linux-x64.tgz
  mv mongosh-${MONGODB_SHELL_VERSION}-linux-x64/bin/* $VENV/bin/

  getpkg https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz $MONGODB_TOOLS_SHA256SUM
  tar zxf mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz
  mv mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}/bin/* $VENV/bin/
fi
