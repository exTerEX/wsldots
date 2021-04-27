#!/usr/bin/env bash

# Constants
NINJA_VERSION="v1.10.2"

# Install dependencies
sudo apt update
sudo apt --assume-yes install --no-install-recommends python3

# Download source code
git clone https://github.com/ninja-build/ninja.git /tmp/ninja
cd /tmp/ninja
git checkout ${NINJA_VERSION}

# Configure
sudo python3 configure.py --bootstrap

# Install binary
sudo mv /tmp/ninja/ninja /usr/local/bin

# Cleanup
sudo apt clean
sudo rm -r /tmp/ninja /var/lib/apt/lists/*
