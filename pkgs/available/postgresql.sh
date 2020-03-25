POSTGRES_VERSION="11.2"
POSTGRES_SHA256SUM="2676b9ce09c21978032070b6794696e0aa5a476e3d21d60afc036dc0a9c09405"
getpkg http://ftp.postgresql.org/pub/source/v${POSTGRES_VERSION}/postgresql-${POSTGRES_VERSION}.tar.bz2 $POSTGRES_SHA256SUM
tar jxf postgresql-${POSTGRES_VERSION}.tar.bz2
cd postgresql-${POSTGRES_VERSION}

# hack default socket dir
sed -i -e 's:DEFAULT_PGSOCKET_DIR[ ][ ]*"/tmp":DEFAULT_PGSOCKET_DIR "$DATA_DIR/run/pg":' src/include/pg_config_manual.h

./configure --prefix=$VENV --with-openssl --with-uuid=e2fs
$PMAKE
make install

PGEXTS="hstore pg_trgm pgstattuple uuid-ossp"

for ext in $PGEXTS; do
cd contrib/$ext
$PMAKE
make install
cd ../..
done

cd $BUILD_DIR
