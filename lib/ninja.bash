#!/usr/bin/env bash

# Constants
NINJA_VERSION="v1.10.2"
TMP_BIN="/tmp/ninja"
SYS_BIN="/usr/local/bin/ninja"

# Install dependencies
sudo apt update

# Check if python3 is installed
if command -v python3 > /dev/null 2>&1; then
   echo "Python3 is not available"; exit 1
fi

# Check if cmake is installed
if command -v cmake > /dev/null 2>&1; then
   echo "CMake is not available"; exit 1
fi

# Check if previously installed
if command -v ninja > /dev/null 2>&1; then
   sudo rm -rf ${SYS_BIN}
fi

# Download source code
git clone https://github.com/ninja-build/ninja.git ${TMP_BIN}
cd ${TMP_BIN}
git checkout ${NINJA_VERSION}

# Configure
sudo python3 configure.py --bootstrap

# Install binary
sudo mv ${TMP_BIN}/ninja ${SYS_BIN}

# Cleanup
sudo apt clean
sudo rm -r ${TMP_BIN} /var/lib/apt/lists/*
