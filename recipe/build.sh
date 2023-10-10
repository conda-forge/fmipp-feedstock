#!/bin/sh
set -ex

mkdir build && cd build

cmake -G Ninja \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_SKIP_BUILD_RPATH=TRUE \
  -DBUILD_SWIG_JAVA=OFF \
  -DBUILD_SWIG_PYTHON_3=ON \
  -DBUILD_TESTS=OFF \
  ..

cmake --build .

# no install rule
cp -v export/libfmippex${SHLIB_EXT} ${PREFIX}/lib
cp -v import/libfmippim${SHLIB_EXT} ${PREFIX}/lib
cp -v import/swig/_fmippim.so ${SP_DIR}
cp -v import/swig/fmippim.py ${SP_DIR}
