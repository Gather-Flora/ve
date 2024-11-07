LIBHEIF_VERSION="1.18.2"
LIBHEIF_SHA256SUM="c4002a622bec9f519f29d84bfdc6024e33fd67953a5fb4dc2c2f11f67d5e45bf"

getpkg https://github.com/strukturag/libheif/releases/download/v${LIBHEIF_VERSION}/libheif-${LIBHEIF_VERSION}.tar.gz $LIBHEIF_SHA256SUM
tar zxf libheif-${LIBHEIF_VERSION}.tar.gz
cd libheif-${LIBHEIF_VERSION}
mkdir build
cd build
#-DCMAKE_MACOSX_RPATH="ON" -DCMAKE_INSTALL_RPATH="$VENV/lib"
cmake -DCMAKE_INSTALL_PREFIX="$VENV" --preset=release ..
make all install
