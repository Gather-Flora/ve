MARIADB_VERSION="10.0.20"
getpkg https://downloads.mariadb.org/interstitial/mariadb-10.0.20/source/mariadb-${MARIADB_VERSION}.tar.gz
tar zxf mariadb-${MARIADB_VERSION}.tar.gz
cd mariadb-${MARIADB_VERSION}

# FIXME - this links against the system openssl on OSX instead of the Fink
# version...

mkdir -p $VENV/mysql

cmake . \
-DCMAKE_INSTALL_PREFIX=$VENV/mysql \
-DCMAKE_PREFIX_PATH=$VENV \
-DCMAKE_FIND_FRAMEWORK=LAST \
-DCMAKE_VERBOSE_MAKEFILE=ON \
-DMYSQL_DATADIR=/data/mysql \
-DWITH_SSL=system \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITHOUT_TOKUDB=1 \
-DWITH_UNIT_TESTS=OFF \
-DENABLED_LOCAL_INFILE=1

$PMAKE
make install
