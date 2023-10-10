@echo on

mkdir build && cd build

set CMAKE_CONFIG="Release"

cmake -LAH -G Ninja                                          ^
  -DCMAKE_BUILD_TYPE="%CMAKE_CONFIG%"                        ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"                     ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"                  ^
  -DBUILD_SWIG_JAVA=OFF                                      ^
  -DBUILD_TESTS=OFF                                          ^
  ..
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

:: no install rule
copy fmi2.dll %LIBRARY_BIN% || exit 1
copy fmippex.dll %LIBRARY_BIN% || exit 1
copy fmippim.dll %LIBRARY_BIN% || exit 1
copy fmi2.lib %LIBRARY_LIB% || exit 1
copy fmippex.lib %LIBRARY_LIB% || exit 1
copy fmippim.lib %LIBRARY_LIB% || exit 1

copy _fmippex.pyd %SP_DIR% || exit 1
copy _fmippim.pyd %SP_DIR% || exit 1
copy export\swig\fmippex.py %SP_DIR% || exit 1
copy import\swig\fmippim.py %SP_DIR% || exit 1
