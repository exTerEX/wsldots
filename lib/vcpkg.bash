#!/usr/bin/env bash

# Constants
VCPKG_VERSION="2020.11"
VCPKG_ROOT="/usr/local/src/vcpkg"

# Install build libraries
sudo apt update
sudo apt --assume-yes install --no-install-recommends \
    git \
    g++ \
    pkg-config \
    unzip \
    zip \
    cmake \
    ninja-build

# TODO: Check if g++ >= 6

# Download source code and change to specific version
sudo git clone https://github.com/microsoft/vcpkg ${VCPKG_ROOT}
cd ${VCPKG_ROOT}
sudo git checkout ${VCPKG_VERSION}

# Run bootstrap script
sudo ./bootstrap-vcpkg.sh -disableMetrics -useSystemBinaries

# Create shortcut to /usr/local/bin
sudo ln -sf ${VCPKG_ROOT}/vcpkg /usr/local/bin

# Change file ownership
sudo chown -R ${USER} .

# Integrate
vcpkg integrate install

# Cleanup VCPKG src
sudo rm -rf *.md *.txt .git* bootstrap* docs

# Cleanup
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
