/mingw32/bin/i686-w64-mingw32-g++ -Os -static-libgcc -static-libstdc++ -o wx-config $GITHUB_WORKSPACE/wx-config-win.cpp
strip --strip-all $GITHUB_WORKSPACE/wx-config.exe
