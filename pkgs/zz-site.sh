# This is the last package built -- add your dependencies here

# Fix pillow_heif to use our own heif lib - on linux they bundle all these
# libs, not sure why not on macos...
if [ "$MOS" == "MacOS" ]; then
  install_name_tool -change @rpath/libheif.1.dylib $VENV/lib/libheif.1.dylib \
    /opt/gf/ve/lib/python3.*/site-packages/_pillow_heif.cpython-3*-darwin.so
fi
