#!/usr/bin/env bash

# Constants
VCPKG_VERSION="2021.05.12"
VCPKG_ROOT="/usr/local/src/vcpkg"
BIN_DIR="/usr/local/bin/vcpkg"

# Install build libraries
sudo apt update
sudo apt --assume-yes install --no-install-recommends \
    git \
    g++ \
    pkg-config \
    unzip \
    zip

# Check if CMake is installed locally
if ! command -v cmake > /dev/null 2>&1; then
   echo "CMake is not available"; exit 1
fi

# Check if Ninja is installed locally
if ! command -v ninja > /dev/null 2>&1; then
   echo "Ninja-build is not available"; exit 1
fi

# Check if previously installed
if command -v vcpkg > /dev/null 2>&1; then
   sudo rm -rf ${VCPKG_ROOT} ${BIN_DIR}
fi

# Download source code and change to specific version
sudo git clone https://github.com/microsoft/vcpkg.git ${VCPKG_ROOT}
cd ${VCPKG_ROOT}
sudo git checkout ${VCPKG_VERSION}

# Run bootstrap script
sudo ./bootstrap-vcpkg.sh -disableMetrics -useSystemBinaries

# Create shortcut to /usr/local/bin
sudo ln -sf ${VCPKG_ROOT} ${BIN_DIR}

# Change file ownership
sudo chown -R ${USER} .

# Integrate
vcpkg integrate install

# Cleanup VCPKG src
sudo rm -rf *.md *.txt .git* bootstrap* docs

# Cleanup
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
