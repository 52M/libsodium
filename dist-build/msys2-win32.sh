#! /bin/sh

export CFLAGS="-O3 -fomit-frame-pointer -m32 -march=pentium2 -mtune=nocona"
export PREFIX="$(pwd)/libsodium-win32"

if (i686-w64-mingw32-gcc --version > /dev/null 2>&1) then
  echo MinGW found
else
  echo Please install mingw-w64-i686-gcc >&2
  exit
fi

make distclean > /dev/null

./configure --prefix="$PREFIX" --exec-prefix="$PREFIX" \
            --host=i686-w64-mingw32 && \
make && \
make check && \
make install
