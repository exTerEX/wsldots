#!/usr/bin/env bash

# Constants
CONDA_VERSION="4.9.2"
DIRECTORY="/tmp"
PYTHON="py39"
FILE="Miniconda3-${PYTHON}_${CONDA_VERSION}-Linux-x86_64.sh"
URL="https://repo.anaconda.com/miniconda/${FILE}"

# Download binary
sudo wget ${URL} -O /tmp/miniconda.sh

# Change file rights
sudo chmod +x /tmp/miniconda.sh

# Install
sudo bash -b -p /usr/local/lib/conda /tmp/miniconda.sh
sudo ln -sf /usr/local/lib/conda/bin/conda /usr/local/bin/conda

# Cleanup
sudo rm -r /tmp/miniconda.sh
