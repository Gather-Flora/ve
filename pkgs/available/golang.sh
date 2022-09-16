GOLANG_VERSION="1.18.6"
GOLANG_KERNEL="linux"
GOLANG_ARCH="amd64"
GOLANG_SHA256SUM="bb05f179a773fed60c6a454a24141aaa7e71edfd0f2d465ad610a3b8f1dc7fe8"

if [ "$MARCH" == "arm64" ]; then
  GOLANG_ARCH="$MARCH"
  GOLANG_SHA256SUM="838ffa94158125f16e4aa667ee4f6b499ea57e3e35a7e2517ad357ea06714691"
fi

if [ "$MOS" == "MacOS" ]; then
  GOLANG_KERNEL="darwin"
  GOLANG_SHA256SUM="d55c1c2b1d6fee6b5f63e07cd894a7f9369a3542d971701f8045e3a83bdb44fe"
  if [ "$MARCH" == "arm64" ]; then
    GOLANG_ARCH="arm64"
    GOLANG_SHA256SUM="063cfbb2e3dec8e3b1cc79e0aaccb618f0139600c5d28b9a9ec8cf14086e61c4"
  fi
fi

NAME="go${GOLANG_VERSION}.${GOLANG_KERNEL}-${GOLANG_ARCH}"

getpkg https://go.dev/dl/${NAME}.tar.gz $GOLANG_SHA256SUM
tar zxf ${NAME}.tar.gz

rm -fR $VENV/opt/go
mkdir -p $VENV/opt

mv go $VENV/opt/

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/golang"
export PATH="$GOROOT/bin:$PATH"
