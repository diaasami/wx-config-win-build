/mingw32/bin/i686-w64-mingw32-g++ -Os -static-libgcc -static-libstdc++ -o wx-config $1/wx-config-win.cpp
strip --strip-all wx-config.exe
