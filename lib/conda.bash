#!/usr/bin/env bash

# Constants
FILE="Miniconda3-latest-Linux-x86_64.sh"
URL="https://repo.anaconda.com/miniconda/${FILE}"

# Download binary
sudo wget ${URL} -O /tmp/miniconda.sh

# Change file rights
sudo chmod +x /tmp/miniconda.sh

# Install
sudo bash /tmp/miniconda.sh -b -p /usr/local/lib/conda
sudo ln -sf /usr/local/lib/conda/bin/conda /usr/local/bin/conda

# Cleanup
sudo rm -r /tmp/miniconda.sh
