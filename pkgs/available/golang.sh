GOLANG_VERSION="1.18.4"
GOLANG_KERNEL="linux"
GOLANG_ARCH="amd64"
GOLANG_SHA256SUM="c9b099b68d93f5c5c8a8844a89f8db07eaa58270e3a1e01804f17f4cf8df02f5"

if [ "$MOS" == "MacOS" ]; then
  GOLANG_KERNEL="darwin"
  GOLANG_SHA256SUM="315e1a2b21a827c68da1b7f492b5dcbe81d8df8a79ebe50922df9588893f87f0"
  if [ "$MARCH" == "arm64" ]; then
    GOLANG_ARCH="$MARCH"
    GOLANG_SHA256SUM="04eed623d5143ffa44965b618b509e0beccccfd3a4a1bfebc0cdbcf906046769"
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
