#!/bin/sh

apt update

# Install build libraries
apt --assume-yes install --no-install-recommends \
    libcurl4-openssl-dev \
    libexpat1-dev \
    libjsoncpp-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libnghttp2-dev \
    libzstd-dev \
    librhash-dev \
    libuv1-dev \
    libarchive-dev

if [ ! -e $(cd -P -- "$(dirname -- "$0")" && pwd -P)/cmake/bootstrap ]
then
    echo "Download submodule..."
    git submodule update --init --recursive
fi

cp -r $(cd -P -- "$(dirname -- "$0")" && pwd -P)/cmake /tmp/cmake > /dev/null

cd /tmp/cmake

./bootstrap --system-libs --no-qt-gui --prefix=/usr/local

make
make install
rm -r /tmp/cmake

apt --assume-yes autoremove \
    libcurl4-openssl-dev \
    libjsoncpp-dev \
    libbz2-dev \
    liblzma-dev \
    libnghttp2-dev \
    libzstd-dev \
    librhash-dev \
    libuv1-dev \
    libarchive-dev

# Runtime
apt --assume-yes install --no-install-recommends \
    libarchive13 \
    libcurl4 \
    libexpat1 \
    libjsoncpp1 \
    librhash0 \
    libuv1 \
    procps \
    zlib1g
