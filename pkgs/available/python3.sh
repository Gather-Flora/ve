PYTHON_VERSION="3.11.10"
PYTHON_SHA256SUM="92f2faf242681bfa406d53a51e17d42c5373affe23a130cd9697e132ef574706"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz $PYTHON_SHA256SUM
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

PIP_OPTS="--no-user --no-cache-dir --src $VENV/src"

$VENV/bin/pip3 install -U pip
$VENV/bin/pip install $PIP_OPTS -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt

# Fix pillow_heif to use our own heif lib - on linux they bundle all these
# libs, not sure why not on macos...
if [ "$MOS" == "MacOS" ]; then
  install_name_tool -change @rpath/libheif.1.dylib $VENV/lib/libheif.1.dylib \
    /opt/gf/ve/lib/python3.11/site-packages/_pillow_heif.cpython-311-darwin.so
fi
