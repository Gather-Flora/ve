LIBHEIF_VERSION="1.19.8"
LIBHEIF_SHA256SUM="6c4a5b08e6eae66d199977468859dea3b5e059081db8928f7c7c16e53836c906"

getpkg https://github.com/strukturag/libheif/releases/download/v${LIBHEIF_VERSION}/libheif-${LIBHEIF_VERSION}.tar.gz $LIBHEIF_SHA256SUM
tar zxf libheif-${LIBHEIF_VERSION}.tar.gz
cd libheif-${LIBHEIF_VERSION}
mkdir build
cd build
#-DCMAKE_MACOSX_RPATH="ON" -DCMAKE_INSTALL_RPATH="$VENV/lib"
cmake -DCMAKE_INSTALL_PREFIX="$VENV" --preset=release ..
make all install

LIBDE265_VERSION="1.0.16"
LIBDE265_SHA256SUM="b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7"

cd $BUILD_DIR
getpkg https://github.com/strukturag/libde265/releases/download/v${LIBDE265_VERSION}/libde265-${LIBDE265_VERSION}.tar.gz $LIBDE265_SHA256SUM
tar zxf libde265-${LIBDE265_VERSION}.tar.gz
cd libde265-${LIBDE265_VERSION}
./configure --prefix=$VENV
make install
