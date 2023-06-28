GCLOUD_VERSION="402.0.0"
GCLOUD_PLATFORM="linux"
GCLOUD_SHA256SUM="a9902b57d4cba2ebb76d7354570813d3d8199c36b95a1111a1b7fea013beaaf9"
GCLOUD_ARCH="$MARCH"

if [ "$MARCH" == "arm64" ]; then
  GCLOUD_ARCH="arm"
  GCLOUD_SHA256SUM="3c2e24f132d8150c54b67dc5f65cc0f694071c0b111c07ad5467c82ea09f355a"
fi

if [ "$MOS" == "MacOS" ]; then
  GCLOUD_PLATFORM="darwin"
  GCLOUD_SHA256SUM="0d42c4f76eb1262ef3f81733bd9ddb35b3a77561b846fbf9b3a6828d8abdda86"
  if [ "$MARCH" == "arm64" ]; then
    GCLOUD_ARCH="arm"
    GCLOUD_SHA256SUM="7b8f4ff8c73629680323401b2a057e64919d32bcae65abb3cfc7e37c91c0b2de"
  fi
fi

getpkg https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-$GCLOUD_VERSION-$GCLOUD_PLATFORM-$GCLOUD_ARCH.tar.gz $GCLOUD_SHA256SUM

tar zxf google-cloud-cli-$GCLOUD_VERSION-$GCLOUD_PLATFORM-$GCLOUD_ARCH.tar.gz
rm -fR $VENV/opt/google-cloud-sdk
mv google-cloud-sdk $VENV/opt/
