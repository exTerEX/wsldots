#!/lib/sh

# Constants
ALAN_VERSION="2.1.1"

# Download source code
git clone https://github.com/mpdunne/alan.git /tmp/alan
cd /tmp/alan
git checkout ${ALAN_VERSION}

if [ ! -d $HOME/bin ]; then
  mkdir -p $HOME/bin
fi

if [ -e $HOME/bin/alan ]; then
    sudo rm -rf $HOME/bin/alan
fi

# Install
sudo mv /tmp/alan/alan $HOME/bin

sudo chown -R $(whoami):$(whoami) $HOME/bin/alan
sudo chmod -R 744 $HOME/bin/alan

# Cleanup
sudo rm -r /tmp/alan
