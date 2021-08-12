#!/lib/sh

# Constants
ALAN_VERSION="2.1.1"

# Download source code
git clone https://github.com/mpdunne/alan.git /tmp/alan
cd /tmp/alan
git checkout ${ALAN_VERSION}

binary_path=$HOME/bin

if [ ! -d $binary_path ]; then
  mkdir -p $binary_path
fi

if [ -e $binary_path/alan ]; then
    sudo rm -rf $binary_path/alan
fi

# Install
sudo mv /tmp/alan/alan $binary_path

sudo chown -R $(whoami):$(whoami) $binary_path/alan
sudo chmod -R 744 $binary_path/alan

# Cleanup
sudo rm -r /tmp/alan
