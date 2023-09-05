METABASE_VERSION="0.47.0"
METABASE_SHA256SUM="9bf03a464163971196bec306590041e8f571f24e1d5a34695363f0dea1eba809"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $METABASE_SHA256SUM

mv metabase.jar $VENV/opt/metabase/
