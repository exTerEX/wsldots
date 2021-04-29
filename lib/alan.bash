#!/usr/bin/env bash

# Constants
ALAN_VERSION="2.1.1"

# Download source code
git clone https://github.com/mpdunne/alan.git /tmp/alan
cd /tmp/alan
git checkout ${ALAN_VERSION}

# Install
sudo mv /tmp/alan/alan /usr/local/bin

# Cleanup
sudo rm -r /tmp/alan
