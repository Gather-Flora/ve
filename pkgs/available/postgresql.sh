POSTGRES_VERSION="9.4.4"
getpkg http://ftp.postgresql.org/pub/source/v${POSTGRES_VERSION}/postgresql-${POSTGRES_VERSION}.tar.bz2
tar jxvf postgresql-${POSTGRES_VERSION}.tar.bz2
cd postgresql-${POSTGRES_VERSION}

# hack default socket dir
sed -i -e 's:DEFAULT_PGSOCKET_DIR[ ][ ]*"/tmp":DEFAULT_PGSOCKET_DIR "/data/run/pg":' src/include/pg_config_manual.h

./configure --prefix=$VENV --with-openssl
$PMAKE
make install
for ext in pgcrypto hstore; do
cd contrib/$ext
$PMAKE
make install
cd ../..
done