MONGODB_VERSION="7.0.20"
MONGODB_SHELL_VERSION="2.5.0"
MONGODB_TOOLS_VERSION="100.12.0"

if false; then
MARCH="arm64"
echo MONGODB_SHA256SUM="$(curl -s -L https://fastdl.mongodb.org/osx/mongodb-macos-${MARCH}-${MONGODB_VERSION}.tgz | sha256sum | awk '{print $1}')"
echo MONGODB_SHELL_SHA256SUM="$(curl -s -L https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-darwin-${MARCH}.zip | sha256sum | awk '{print $1}')"
echo MONGODB_TOOLS_SHA256SUM="$(curl -s -L https://fastdl.mongodb.org/tools/db/mongodb-database-tools-macos-${MARCH}-${MONGODB_TOOLS_VERSION}.zip | sha256sum | awk '{print $1}')"

echo

MARCH="x86_64"
echo MONGODB_SHA256SUM="$(curl -s -L https://fastdl.mongodb.org/linux/mongodb-linux-${MARCH}-ubuntu2204-${MONGODB_VERSION}.tgz | sha256sum | awk '{print $1}')"
echo MONGODB_SHELL_SHA256SUM="$(curl -s -L https://downloads.mongodb.com/compass/mongosh-${MONGODB_SHELL_VERSION}-linux-x64.tgz | sha256sum | awk '{print $1}')"
echo MONGODB_TOOLS_SHA256SUM="$(curl -s -L https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-${MARCH}-${MONGODB_TOOLS_VERSION}.tgz | sha256sum | awk '{print $1}')"
exit 0
fi

mkdir -p $VENV/bin

if [ "$MOS" == "MacOS" ]; then
  MONGODB_SHA256SUM="fc86aed6f9c9f5f35d6bd523968bf6ebfb3167728f64c4f98092fd351d0fd534"
  MONGODB_SHELL_SHA256SUM="7f803a0d0be9c03c57b9c4641824b7f649003dd27c94e6d075903ef7b8c4ea14"
  MONGODB_TOOLS_SHA256SUM="85ccf826976638e48844d929f60d2e6d91f8b7e5100ee74b19e045c4d1e828f3"

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
  MONGODB_SHA256SUM="7ed90600c5cf17d870c397652072df714e3d7023edfdde384b75cba57c1af16c"
  MONGODB_SHELL_SHA256SUM="d1dfc44f2b4de11c2b66994715c00bcf26eea0e29a763195c2420b262bf38f00"
  MONGODB_TOOLS_SHA256SUM="426cc14f6d2247284d557d61eb3e9d4bd4f19943a15e7ffb38354008a0cf3892"

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
