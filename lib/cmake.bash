#!/usr/bin/env bash

# Constatns
CMAKE_VERSION="3.20.1"

# Install build libraries
sudo apt update
sudo apt --assume-yes install --no-install-recommends \
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

# Download source code
git clone https://github.com/Kitware/CMake.git /tmp/cmake
cd /tmp/cmake
git checkout ${CMAKE_VERSION}

# Bootstrap
sudo ./bootstrap --system-libs --no-qt-gui --prefix=/usr/local

# Install
make
sudo make install

# Remove build dependencies
sudo apt --assume-yes autoremove \
    libcurl4-openssl-dev \
    libjsoncpp-dev \
    libbz2-dev \
    liblzma-dev \
    libnghttp2-dev \
    libzstd-dev \
    librhash-dev \
    libuv1-dev \
    libarchive-dev

# Install runtime dependencies
sudo apt --assume-yes install --no-install-recommends \
    libarchive13 \
    libcurl4 \
    libexpat1 \
    libjsoncpp1 \
    librhash0 \
    libuv1 \
    procps \
    zlib1g

# Cleanup
sudo apt clean
sudo rm -r /tmp/cmake /var/lib/apt/lists/*
