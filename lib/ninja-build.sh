#!/bin/sh

apt update

apt --assume-yes install --no-install-recommends python3

cp -r $(cd -P -- "$(dirname -- "$0")" && pwd -P)/ninja /tmp/ninja > /dev/null

cd /tmp/ninja

python3 configure.py --bootstrap

mv /tmp/ninja/ninja /usr/local/bin

rm -r /tmp/ninja
